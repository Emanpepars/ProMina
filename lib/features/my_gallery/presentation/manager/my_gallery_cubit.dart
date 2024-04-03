import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pro_mina/features/my_gallery/data/data_sources/my_gallery_data_source.dart';
import 'package:pro_mina/features/my_gallery/data/repositories/my_gallery_data_repo.dart';
import 'package:pro_mina/features/my_gallery/domain/use_cases/my_gallery_use_case.dart';
import 'package:pro_mina/features/my_gallery/domain/use_cases/upload_image_use_case.dart';
import '../../domain/repositories/my_gallery_domain_repo.dart';
import 'my_gallery_state.dart';

class MyGalleryCubit extends Cubit<MyGalleryState> {
  MyGalleryDataSources dto;
  static late MyGalleryDomainRepo myGalleryDomainRepo;

  MyGalleryCubit({required this.dto}) : super(MyGalleryInitState()) {
    myGalleryDomainRepo = MyGalleryDataRepo(dto: dto);
  }

  static MyGalleryCubit get(context) => BlocProvider.of(context);

  List<dynamic> images = [];
  XFile? profilePic;

  getMyGallery() async {
    emit(MyGalleryLoadingState());
    MyGalleryUseCase myGalleryUseCase = MyGalleryUseCase(myGalleryDomainRepo);

    var response = await myGalleryUseCase.getMyGallery();
    response.fold((l) {
      emit(MyGalleryErrorState(l));
    }, (r) {
      images = r.data.images;
      MyGallerySuccessState();
    });
  }

  uploadPhoto() async {
    emit(UploadImageLoadingState());

    UploadImageUseCase uploadImageUseCase =
        UploadImageUseCase(myGalleryDomainRepo);
    var response = await uploadImageUseCase.uploadPhoto(
      profilePic: await uploadImageToAPI(profilePic!),
    );
    response.fold((l) {
      emit(UploadImageErrorState(l));
    }, (r) {
      emit(UploadImageSuccessState());
    });
  }

  void pickImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);

    if (image != null) {
      profilePic = image;

      uploadPhoto();
    }
  }

  Future<void> getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      profilePic = pickedFile;
      uploadPhoto();
    }
  }

  Future uploadImageToAPI(XFile image) async {
    return MultipartFile.fromFile(image.path,
        filename: image.path.split('/').last);
  }
}
