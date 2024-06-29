class UserData {
  String? firstName;
  String? lastName;
  String? userName;
  String? email;
  String? phone;
  String? street;
  String? city;

  UserData({
    this.firstName,
    this.lastName,
    this.userName,
    this.email,
    this.phone,
    this.street,
    this.city,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        userName: json['userName'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as String?,
        street: json['street'] as String?,
        city: json['city'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'userName': userName,
        'email': email,
        'phone': phone,
        'street': street,
        'city': city,
      };
}
