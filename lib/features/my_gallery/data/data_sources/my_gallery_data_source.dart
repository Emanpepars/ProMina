import 'package:dartz/dartz.dart';
import 'package:pro_mina/features/my_gallery/data/models/my_gallery_model.dart';

import '../../../../core/api/error/failures.dart';
import '../models/upload_image_response.dart';

abstract class MyGalleryDataSources {
  Future<Either<Failures, MyGalleryModel>> getMyGallery();

  Future<Either<Failures, UploadImageResponse>> uploadPhoto(
      {required dynamic profilePic});
}
