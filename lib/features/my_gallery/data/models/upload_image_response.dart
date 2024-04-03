class UploadImageResponse {
  UploadImageResponse({
    required this.status,
  });

  factory UploadImageResponse.fromJson(dynamic json) {
    return UploadImageResponse(
      status: json['status'],
    );
  }

  final String status;
}
