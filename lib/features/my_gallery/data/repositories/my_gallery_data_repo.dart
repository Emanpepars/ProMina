import 'package:dartz/dartz.dart';
import 'package:pro_mina/core/api/error/failures.dart';
import 'package:pro_mina/features/my_gallery/data/data_sources/my_gallery_data_source.dart';
import 'package:pro_mina/features/my_gallery/data/models/upload_image_response.dart';
import 'package:pro_mina/features/my_gallery/domain/entities/my_gallery_entity.dart';
import 'package:pro_mina/features/my_gallery/domain/repositories/my_gallery_domain_repo.dart';

class MyGalleryDataRepo implements MyGalleryDomainRepo {
  MyGalleryDataSources dto;

  MyGalleryDataRepo({required this.dto});

  @override
  Future<Either<Failures, MyGalleryEntity>> getMyGallery() =>
      dto.getMyGallery();

  @override
  Future<Either<Failures, UploadImageResponse>> uploadPhoto(
          {required dynamic profilePic}) =>
      dto.uploadPhoto(profilePic: profilePic);
}
