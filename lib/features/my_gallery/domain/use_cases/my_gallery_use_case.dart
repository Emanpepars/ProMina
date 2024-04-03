import 'package:dartz/dartz.dart';
import 'package:pro_mina/core/api/error/failures.dart';
import 'package:pro_mina/features/my_gallery/domain/entities/my_gallery_entity.dart';
import 'package:pro_mina/features/my_gallery/domain/repositories/my_gallery_domain_repo.dart';

class MyGalleryUseCase {
  MyGalleryDomainRepo myGalleryDomainRepo;

  MyGalleryUseCase(this.myGalleryDomainRepo);

  Future<Either<Failures, MyGalleryEntity>> getMyGallery() =>
      myGalleryDomainRepo.getMyGallery();
}
