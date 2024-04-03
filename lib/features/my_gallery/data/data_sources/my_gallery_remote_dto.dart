import 'package:dartz/dartz.dart';
import 'package:pro_mina/core/api/api_consumer.dart';
import 'package:pro_mina/core/api/api_keys.dart';
import 'package:pro_mina/core/api/end_points.dart';
import 'package:pro_mina/core/api/error/failures.dart';
import 'package:pro_mina/features/my_gallery/data/data_sources/my_gallery_data_source.dart';
import 'package:pro_mina/features/my_gallery/data/models/my_gallery_model.dart';

import '../../../../core/api/error/server_failures.dart';
import '../models/upload_image_response.dart';

class MyGalleryRemoteDto extends MyGalleryDataSources {
  ApiConsumer api;

  MyGalleryRemoteDto(this.api);

  @override
  Future<Either<Failures, MyGalleryModel>> getMyGallery() async {
    try {
      var response = await api.get(EndPoints.myGallery);
      MyGalleryModel myGalleryModel = MyGalleryModel.fromJson(response);
      return Right(myGalleryModel);
    } catch (e) {
      return left(
        ServerFailures(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failures, UploadImageResponse>> uploadPhoto({
    required dynamic profilePic,
  }) async {
    try {
      var response = await api.post(
        EndPoints.uploadImage,
        data: {
          ApiKeys.profilePic: profilePic,
        },
        isFormData: true,
      );
      UploadImageResponse uploadImageResponse =
          UploadImageResponse.fromJson(response.data.status);
      return Right(uploadImageResponse);
    } catch (e) {
      return left(
        ServerFailures(
          e.toString(),
        ),
      );
    }
  }
}
