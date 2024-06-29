class ForgetModel {
  final String userName;
  final String password;

  ForgetModel({required this.userName, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'UserName': userName,
      'ChangePass': password,
    };
  }
}
