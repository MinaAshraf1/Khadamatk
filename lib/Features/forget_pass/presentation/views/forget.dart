import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradproject/Features/forget_pass/data/models/forget_model.dart';

import 'package:gradproject/Features/forget_pass/presentation/view_model/cubit/forget_cubit_cubit.dart';
import 'package:gradproject/core/utls/widget/sign_button.dart';
import 'package:gradproject/core/utls/widget/sign_logo.dart';
import 'package:gradproject/core/utls/widget/text_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class Forget extends StatefulWidget {
  const Forget({Key? key}) : super(key: key);
  static const forgetId = 'forget';

  @override
  State<Forget> createState() => _ForgetState();
}

class _ForgetState extends State<Forget> {
  bool hide = true;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetCubitCubit, ForgetCubitState>(
      listener: (context, state) async {
        if (state is ForgetCubitLoading) {
          setState(() {
            isLoading = true;
          });
        } else if (state is ForgetCubitSuccess) {
          setState(() {
            isLoading = false;
          });

          AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.bottomSlide,
            title: 'تم بنجاح',
            desc: 'تم تغيير كلمه المرور بنجاح',
            btnOkOnPress: null,
          ).show();
          Future.delayed(const Duration(seconds: 1), () {
            Navigator.of(context).pushReplacementNamed('login');
          });
        } else if (state is ForgetCubitFailure) {
          setState(() {
            isLoading = false;
          });
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.bottomSlide,
            title:
                'خطأ فى اسم المستخدم وكلمه المرور يجب ان تحتوى على احرف ورموز وارقام',
            desc: state.message,
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
                          name: "كلمة المرور الجديدة",
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
                  const SizedBox(height: 75),
                  SignButton(
                    name: "تغيير",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<ForgetCubitCubit>(context).forget(
                          ForgetModel(
                            userName: _usernameController.text,
                            password: _passwordController.text,
                          ),
                        );
                      }
                    },
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
