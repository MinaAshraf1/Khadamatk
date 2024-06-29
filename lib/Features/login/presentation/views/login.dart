import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradproject/Features/forget_pass/presentation/views/forget.dart';
import 'package:gradproject/Features/home/presentation/view_model/cubit/user_cubit.dart';
import 'package:gradproject/Features/home/presentation/views/main_page.dart';
import 'package:gradproject/Features/login/data/models/login_model.dart';
import 'package:gradproject/Features/login/presentation/view_model/cubit/login_cubit_cubit.dart';
import 'package:gradproject/core/utls/widget/sign_button.dart';
import 'package:gradproject/core/utls/widget/sign_logo.dart';
import 'package:gradproject/core/utls/widget/text_body.dart';
import 'package:gradproject/main.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool hide = true;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubitCubit, LoginCubitState>(
      listener: (context, state) async {
        if (state is LoginCubitLoading) {
          setState(() {
            isLoading = true;
          });
        } else if (state is LoginCubitSuccess) {
          setState(() {
            isLoading = false;
          });

          String? token = BlocProvider.of<LoginCubitCubit>(context).token;
          if (token != null) {
            BlocProvider.of<UserCubit>(context).user(token: token);

            // SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString('token', token);

            AwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              animType: AnimType.bottomSlide,
              title: 'تم بنجاح',
              desc: 'تم تسجيل الدخول بنجاح',
              btnOkOnPress: null,
            ).show();

            Future.delayed(const Duration(seconds: 1), () {
              Navigator.of(context).pushReplacementNamed(MainPage.homePageId,);
            });
            await prefs.setBool('isLoggedIn', true);
          }
        } else if (state is LoginCubitFailure) {
          setState(() {
            isLoading = false;
          });
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.bottomSlide,
            title: 'خطأ',
            desc: 'يوجد خطأ في اسم المستخدم أو كلمة المرور',
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
                  const SizedBox(height: 30),
                  const SignLogo(),
                  const SizedBox(height: 50),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextBody(
                          textController: _usernameController,
                          imageLink: "assets/images/avatar.png",
                          name: "اسم المستخدم",
                          secure: false,
                          hide: false,
                        ),
                        const SizedBox(height: 15),
                        TextBody(
                          textController: _passwordController,
                          imageLink: "assets/images/protection.png",
                          name: "كلمة المرور",
                          secure: true,
                          hide: hide,
                          onHide: () {
                            setState(() {
                              hide = !hide;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Forget.forgetId);
                        },
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: const Text(
                          "هل نسيت كلمة السر؟",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff9f83f6)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  SignButton(
                    name: "تسجيل الدخول",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<LoginCubitCubit>(context).login(
                          LoginModel(
                            userName: _usernameController.text,
                            password: _passwordController.text,
                          ),
                        );
                      }
                    },
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('register');
                    },
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: const Text(
                      "لا تمتلك حساب؟",
                      style: TextStyle(fontSize: 16, color: Color(0xff9f83f6)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
