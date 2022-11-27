import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:testsuntech/src/bloc/app_bloc.dart';
import 'package:testsuntech/src/bloc/authentication_bloc/auth_event.dart';
import 'package:testsuntech/src/commons/auth_form_field.dart';
import 'package:testsuntech/src/commons/dialogs/dialog_loading.dart';
import 'package:testsuntech/src/constants/constants.dart';
import 'package:testsuntech/src/helpers/custom_sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  Widget iconCheckEnterEmail = const SizedBox();
  bool isVisible = true;
  bool isCheckRemember = false;
  @override
  Widget build(BuildContext context) {
    Size currentSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.sp, horizontal: 16.sp),
          // height: double.infinity,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.sp,
              ),
              Text(
                'Welcome!',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 4.sp,
              ),
              Text(
                'Vui lòng đăng nhập hoặc đăng ký để tiếp tục',
                style: TextStyle(fontSize: 13.sp, color: Colors.grey),
              ),
              SizedBox(
                height: 20.sp,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    AuthFormField(
                        hintText: '',
                        lable: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            setState(() {
                              if (value.contains('@gmail.com')) {
                                iconCheckEnterEmail = Icon(
                                  Icons.check_circle,
                                  color: Colors.black,
                                  size: 16.sp,
                                );
                              } else {
                                iconCheckEnterEmail = const SizedBox();
                              }
                            });
                          }
                          return;
                        },
                        textVisible: true,
                        validator: (val) {
                          if (val != null && val.isNotEmpty) {
                            return null;
                          } else {
                            return "Vui lòng nhập Email";
                          }
                        },
                        suffixIcon: iconCheckEnterEmail),
                    AuthFormField(
                      hintText: '',
                      lable: 'Password',
                      keyboardType: TextInputType.text,
                      controller: passWordController,
                      onChanged: (string) {
                        return;
                      },
                      textVisible: !isVisible,
                      validator: (val) {
                        if (val != null && val.isNotEmpty) {
                          return null;
                        } else {
                          return "Vui lòng nhập mật khẩu";
                        }
                      },
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        child: isVisible
                            ? Icon(
                                Icons.visibility,
                                color: Colors.black,
                                size: 16.sp,
                              )
                            : Icon(
                                Icons.visibility_off,
                                color: Colors.black,
                                size: 16.sp,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isCheckRemember = !isCheckRemember;
                      });
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: isCheckRemember
                          ? Icon(
                              Icons.check_box,
                              size: 14.sp,
                            )
                          : Icon(
                              Icons.check_box_outline_blank,
                              size: 14.sp,
                            ),
                    ),
                  ),
                  SizedBox(
                    width: 3.sp,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isCheckRemember = !isCheckRemember;
                        });
                      },
                      child: const Text(
                        'Ghi nhớ đăng nhập',
                        style: TextStyle(
                          color: colorPrimary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.sp,
              ),
              GestureDetector(
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    showDialogLoading();
                    // var result = await AuthenticationRepository().login(
                    //     email: emailController.text.trim(),
                    //     password: passWordController.text.trim());
                    AppBloc.authenticationBloc.add(LoginEvent(
                      email: emailController.text,
                      password: passWordController.text,
                      isCheckRemember: isCheckRemember,
                    ));
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.sp,
                  ),
                  alignment: Alignment.center,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(
                      20.sp,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Đăng nhập',
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8.sp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  dividerHorizontal(currentSize.width / 2 - 32.sp),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.sp),
                    child: Text(
                      'or',
                      style: TextStyle(
                          fontSize: 10.8.sp, fontWeight: FontWeight.w500),
                    ),
                  ),
                  dividerHorizontal(currentSize.width / 2 - 32.sp)
                ],
              ),
              SizedBox(
                height: 8.sp,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 10.sp,
                ),
                alignment: Alignment.center,
                width: 100.w,
                decoration: BoxDecoration(
                    color: Colors.blue.shade800,
                    borderRadius: BorderRadius.circular(20.sp)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.facebook,
                      color: Colors.white,
                      size: 14.sp,
                    ),
                    SizedBox(
                      width: 4.sp,
                    ),
                    Text(
                      'Continue with Facebook',
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12.sp,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 10.sp,
                ),
                alignment: Alignment.center,
                width: 100.w,
                decoration: BoxDecoration(
                    border: Border.all(width: 0.8.sp, color: Colors.black),
                    borderRadius: BorderRadius.circular(20.sp)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      PhosphorIcons.google_logo_bold,
                      color: Colors.black,
                      size: 14.sp,
                    ),
                    SizedBox(
                      width: 4.sp,
                    ),
                    Text(
                      'Continue with Google',
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              MediaQuery.of(context).viewInsets.bottom > 0
                  ? SizedBox(
                      height: MediaQuery.of(context).viewInsets.bottom + 10.sp,
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
