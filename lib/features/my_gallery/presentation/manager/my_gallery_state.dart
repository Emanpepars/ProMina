import 'package:pro_mina/core/api/error/failures.dart';

abstract class MyGalleryState {}

class MyGalleryInitState extends MyGalleryState {}

class MyGalleryLoadingState extends MyGalleryState {}

class MyGallerySuccessState extends MyGalleryState {}

class MyGalleryErrorState extends MyGalleryState {
  Failures failures;

  MyGalleryErrorState(this.failures);
}

class UploadImageLoadingState extends MyGalleryState {}

class UploadImageSuccessState extends MyGalleryState {}

class UploadImageErrorState extends MyGalleryState {
  Failures failures;

  UploadImageErrorState(this.failures);
}

class UploadProfilePic extends MyGalleryState {}
