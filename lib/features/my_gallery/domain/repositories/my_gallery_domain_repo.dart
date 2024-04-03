import 'package:dartz/dartz.dart';
import 'package:pro_mina/core/api/error/failures.dart';
import 'package:pro_mina/features/my_gallery/domain/entities/my_gallery_entity.dart';

import '../../data/models/upload_image_response.dart';

abstract class MyGalleryDomainRepo {
  Future<Either<Failures, MyGalleryEntity>> getMyGallery();

  Future<Either<Failures, UploadImageResponse>> uploadPhoto(
      {required dynamic profilePic});
}
