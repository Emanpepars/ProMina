import 'package:pro_mina/features/my_gallery/domain/entities/my_gallery_entity.dart';

class MyGalleryModel extends MyGalleryEntity {
  MyGalleryModel({
    required this.status,
    required super.data,
    required this.message,
  });

  factory MyGalleryModel.fromJson(dynamic json) {
    return MyGalleryModel(
      status: json['status'],
      data: Data.fromJson(json['data']),
      message: json['message'],
    );
  }

  String status;
  String message;
}

class Data extends DataEntity {
  Data({
    required super.images,
  });

  factory Data.fromJson(dynamic json) {
    return Data(
      images: List<dynamic>.from(json['images']),
    );
  }
}
