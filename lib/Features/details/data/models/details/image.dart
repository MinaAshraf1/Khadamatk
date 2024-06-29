class Image {
  String? image;
  int? id;

  Image({this.image, this.id});

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        image: json['image'] as String?,
        id: json['id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'image': image,
        'id': id,
      };
}
