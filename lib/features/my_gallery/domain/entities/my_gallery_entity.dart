class MyGalleryEntity {
  MyGalleryEntity({
    required this.data,
  });

  DataEntity data;
}

class DataEntity {
  DataEntity({
    required this.images,
  });

  List<dynamic> images;
}
