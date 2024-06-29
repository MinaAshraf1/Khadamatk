import 'image.dart';

class Details {
  int? id;
  String? name;
  String? street;
  String? city;
  String? descriptionOfPlace;
  String? linkOfPlace;
  String? phoneNumber;
  String? startWork;
  String? endWork;
  double? latitude;
  double? longitude;
  List<Image>? images;

  Details({
    this.id,
    this.name,
    this.street,
    this.city,
    this.descriptionOfPlace,
    this.linkOfPlace,
    this.phoneNumber,
    this.startWork,
    this.endWork,
    this.latitude,
    this.longitude,
    this.images,
  });

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        id: json['id'] as int?,
        name: json['name'] as String?,
        street: json['street'] as String?,
        city: json['city'] as String?,
        descriptionOfPlace: json['descriptionOfPlace'] as String?,
        linkOfPlace: json['linkOfPlace'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        startWork: json['startWork'] as String?,
        endWork: json['endWork'] as String?,
        latitude: (json['latitude'] as num?)?.toDouble(),
        longitude: (json['longitude'] as num?)?.toDouble(),
        images: (json['images'] as List<dynamic>?)
            ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'street': street,
        'city': city,
        'descriptionOfPlace': descriptionOfPlace,
        'linkOfPlace': linkOfPlace,
        'phoneNumber': phoneNumber,
        'startWork': startWork,
        'endWork': endWork,
        'latitude': latitude,
        'longitude': longitude,
        'images': images?.map((e) => e.toJson()).toList(),
      };
}
