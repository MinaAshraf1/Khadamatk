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
  String ?specialization;
  int? priceOfHour;
  bool?hasDelivery;
  double? latitude;
  double? longitude;
  List<Image>? images;

  Details({
    this.id,
    this.name,
    this.street,
    this.city,
    this.descriptionOfPlace,
    this.hasDelivery,
    this.linkOfPlace,
    this.phoneNumber,
    this.startWork,
    this.endWork,
    this.priceOfHour,
    this.latitude,
    this.longitude,
    this.images,
    this.specialization
  });

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        id: json['id'] as int?,
        name: json['name'] as String?,
        street: json['street'] as String?,
        city: json['city'] as String?,
        hasDelivery:json['hasDelivery'],
        priceOfHour:json['priceOfHour'],
        descriptionOfPlace: json['descriptionOfPlace'] as String?,
        specialization: json['specialization'],
        linkOfPlace: json['linkOfPlace'] as String?,
        phoneNumber: json['phoneNumber'] as String? ?? json['phone'] as String?,
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
        "hasDelivery":hasDelivery,
        'descriptionOfPlace': descriptionOfPlace,
        'linkOfPlace': linkOfPlace,
        'phoneNumber': phoneNumber,
        'startWork': startWork,
        'endWork': endWork,
        'latitude': latitude,
        'longitude': longitude,
        'specialization':specialization,
        'priceOfHour':priceOfHour,
        'images': images?.map((e) => e.toJson()).toList(),
      };
}
