import 'dart:ui';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradproject/Features/register/data/models/register_model.dart';
import 'package:gradproject/Features/register/presentation/view_model/cubit/register_cubit.dart';
import 'package:gradproject/core/utls/widget/sign_button.dart';
import 'package:gradproject/core/utls/widget/sign_logo.dart';
import 'package:gradproject/core/utls/widget/text_body.dart';
import 'package:gradproject/main.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool hide = true;
  bool hide1 = true;
  final TextEditingController frist = TextEditingController();
  final TextEditingController last = TextEditingController();
  final TextEditingController user = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController password1 = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController street = TextEditingController();
  final TextEditingController city = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  String changePass = "";
  String changePass2 = "";
  Color colorChangePass = Colors.green;
  Color colorChangePass2 = Colors.green;

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) async {
        if (state is RegisterLoading) {
          setState(() {
            isLoading = true;
          });
        } else if (state is RegisterSuccess) {
          setState(() {
            isLoading = false;
          });
          AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.bottomSlide,
            title: 'تم بنجاح',
            desc: 'تم انشاء الحساب بنجاح',
            btnOkOnPress: () {
              Navigator.of(context).pushReplacementNamed('login');
            },
            btnOkColor: Colors.green,
          ).show();

          // SharedPreferences prefs = await SharedPreferences.getInstance();
          // prefs.setBool('isLoggedIn', true);
        } else if (state is RegisterFailure) {
          setState(() {
            isLoading = false;
          });
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.bottomSlide,
            title: 'خطأ',
            desc: state.errMessage ?? "يمكن ان يكون البريد الالكترني خطأ او مسجل من قبل",
            btnOkOnPress: () {},
            btnOkColor: Colors.red,
          ).show();
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
              backgroundColor: Colors.white,
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const SignLogo(),
                    const SizedBox(
                      height: 50,
                    ),
                    Form(
                        key: formKey,
                        child: Column(
                          children: [
                            TextBody(
                              textController: frist,
                              imageLink: "assets/images/avatar.png",
                              name: "الاسم الاول",
                              secure: false,
                              hide: false,
                            ),
                            TextBody(
                              textController: last,
                              imageLink: "assets/images/avatar.png",
                              name: "الاسم الاخير",
                              secure: false,
                              hide: false,
                            ),
                            TextBody(
                              textController: user,
                              imageLink: "assets/images/avatar.png",
                              name: "اسم المستخدم",
                              secure: false,
                              hide: false,
                            ),
                            TextBody(
                              textController: password,
                              validator: (val) {
                                bool hasUpperCase = val!.contains(RegExp(r'[A-Z]'));
                                bool hasLowerCase = val.contains(RegExp(r'[a-z]'));
                                bool hasNumber = val.contains(RegExp(r'[0-9]'));
                                bool hasSpecialChar = val.contains(RegExp(r'[#$@%*]'));
                                if (val.isEmpty) {
                                  return "لا يمكن ان تكون كلمة المرور فارغة";
                                } else if(!hasUpperCase) {
                                  return "يجب ان تحتوي كلمة المرور علي حرف كبير";
                                } else if (!hasLowerCase) {
                                  return "يجب ان تحتوي كلمة المرور علي حرف صغير";
                                } else if (!hasNumber) {
                                  return "يجب ان تحتوي كلمة المرور علي رقم";
                                } else if (!hasSpecialChar){
                                  return "يجب ان تحتوي كلمة المرور علي حرف من (@ # \$ % *)";
                                }
                                return null;
                              },
                              onChanged: (val) {
                                bool hasUpperCase = val!.contains(RegExp(r'[A-Z]'));
                                bool hasLowerCase = val.contains(RegExp(r'[a-z]'));
                                bool hasNumber = val.contains(RegExp(r'[0-9]'));
                                bool hasSpecialChar = val.contains(RegExp(r'[#$@%*]'));
                                if(!hasUpperCase) {
                                  changePass = "يجب ان تحتوي كلمة المرور علي حرف كبير";
                                  colorChangePass = Colors.red;
                                  setState(() {

                                  });
                                } else if (!hasLowerCase) {
                                  changePass =  "يجب ان تحتوي كلمة المرور علي حرف صغير";
                                  colorChangePass = Colors.red;
                                  setState(() {

                                  });
                                } else if (!hasNumber) {
                                  changePass = "يجب ان تحتوي كلمة المرور علي رقم";
                                  colorChangePass = Colors.red;
                                  setState(() {

                                  });
                                } else if (!hasSpecialChar){
                                  changePass = "يجب ان تحتوي كلمة المرور علي حرف من (@ # \$ % *)";
                                  colorChangePass = Colors.red;
                                  setState(() {

                                  });
                                } else {
                                  changePass = "كلمة مرور قوية";
                                  colorChangePass = Colors.green;
                                  setState(() {

                                  });
                                }
                                return null;
                              },
                              change: changePass,
                              changeColor: colorChangePass,
                              imageLink: "assets/images/protection.png",
                              pass: true,
                              name: "كلمة المرور",
                              notes: "يجب ان تحتوي كلمة المرور علي حرف كبير وحرف صغير وحرف من (@ # * \$ %) ورقم",
                              secure: true,
                              hide: hide,
                              onHide: () {
                                setState(() {
                                  hide ? hide = false : hide = true;
                                });
                              },
                            ),
                            TextBody(
                              textController: password1,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "لا يمكن ان يكون كلمة المرور فارغة";
                                } else if (val != password.text) {
                                  return "كلمة المرور غير متطابقة";
                                }
                                return null;
                              },
                              onChanged: (val) {
                                if(val != password.text) {
                                  changePass2 = "كلمة المرور غير متطابقة";
                                  colorChangePass2 = Colors.red;
                                  setState(() {

                                  });
                                } else {
                                  changePass2 = "كلمة المرور متطابقة";
                                  colorChangePass2 = Colors.green;
                                  setState(() {

                                  });
                                }
                                return null;
                              },
                              change: changePass2,
                              changeColor: colorChangePass2,
                              imageLink: "assets/images/protection.png",
                              name: "تاكيد كلمة المرور",
                              pass: true,
                              secure: true,
                              hide: hide1,
                              onHide: () {
                                setState(() {
                                  hide1 ? hide1 = false : hide1 = true;
                                });
                              },
                            ),
                            TextBody(
                              textController: email,
                              imageLink: "assets/images/email.png",
                              name: "الحساب الالكتروني",
                              hint: "user@gmail.com",
                              secure: false,
                              hide: false,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            TextBody(
                              textController: phone,
                              imageLink: "assets/images/support.png",
                              name: "رقم الهاتف",
                              secure: false,
                              hide: false,
                              keyboardType: TextInputType.phone,
                            ),
                            TextBody(
                              textController: street,
                              imageLink: "assets/images/street_sign.png",
                              name: "اسم الشارع",
                              secure: false,
                              hide: false,
                            ),
                            TextBody(
                              textController: city,
                              imageLink: "assets/images/location_pin.png",
                              name: "اسم المدينة",
                              secure: false,
                              hide: false,
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 75,
                    ),
                    SignButton(
                      name: "إنشاء حساب",
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<RegisterCubit>(context).register(
                              RegisterModel(
                                  password1: password1.text,
                                  email: email.text,
                                  phone: int.parse(phone.text),
                                  street: street.text,
                                  city: city.text,
                                  userName: user.text,
                                  password: password.text,
                                  name: frist.text,
                                  lastName: last.text));
                        }
                      },
                    ),
                  ],
                ),
              )),
        );
      },
    );
  }
}
