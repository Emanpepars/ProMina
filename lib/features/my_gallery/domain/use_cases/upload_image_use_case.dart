import 'package:dartz/dartz.dart';
import 'package:pro_mina/core/api/error/failures.dart';
import 'package:pro_mina/features/my_gallery/data/models/upload_image_response.dart';
import 'package:pro_mina/features/my_gallery/domain/repositories/my_gallery_domain_repo.dart';

class UploadImageUseCase {
  MyGalleryDomainRepo myGalleryDomainRepo;

  UploadImageUseCase(this.myGalleryDomainRepo);

  Future<Either<Failures, UploadImageResponse>> uploadPhoto(
          {required dynamic profilePic}) =>
      myGalleryDomainRepo.uploadPhoto(profilePic: profilePic);
}
