class RegisterModel {
  final String name;
  final String lastName;
  final String userName;
  final String password;
  final String password1;
  final String email;
  final int phone;
  final String street;
  final String city;

  RegisterModel(
      {required this.name,
      required this.lastName,
      required this.password1,
      required this.email,
      required this.phone,
      required this.street,
      required this.city,
      required this.userName,
      required this.password});

  Map<String, dynamic> toJson() {
    return {
      'FirstName': name,
      'LastName': lastName,
      'UserName': userName,
      'Password': password,
      'ConfirmPassword': password1,
      'Email': email,
      'Phone': phone,
      'Street': street,
      'City': city
    };
  }
}
