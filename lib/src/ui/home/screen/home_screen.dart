import 'package:flutter/material.dart';
import 'package:testsuntech/src/bloc/app_bloc.dart';
import 'package:testsuntech/src/bloc/authentication_bloc/auth_event.dart';
import 'package:testsuntech/src/data/local_data_source/user_local_data.dart';
import 'package:testsuntech/src/data/remote_data/account_model.dart';
import 'package:testsuntech/src/helpers/custom_sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  String accessToken = '';
  late AccountModel accountModel;
  @override
  void initState() {
    super.initState();
    accessToken = UserLocal().getAccessToken();
    if (accessToken.isNotEmpty) {
      accountModel = UserLocal().getUser();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trang Home'),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16.sp),
          child: Column(
            children: [
              accessToken == ''
                  ? const Text("Chưa au then")
                  : Text(accessToken),
              SizedBox(
                height: 35.sp,
              ),
              Text(accountModel.username),
              SizedBox(
                height: 35.sp,
              ),
              GestureDetector(
                onTap: () {
                  AppBloc.authenticationBloc.add(LogOutEvent());
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.sp,
                  ),
                  alignment: Alignment.center,
                  width: 40.w,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(
                      20.sp,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Đăng Xuất',
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
