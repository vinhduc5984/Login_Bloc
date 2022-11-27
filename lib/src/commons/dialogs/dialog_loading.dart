import 'package:flutter/material.dart';
import 'package:testsuntech/src/constants/constants.dart';
import 'package:testsuntech/src/helpers/custom_sizer/sizer.dart';
import 'package:testsuntech/src/routes/app_page.dart';

showDialogLoading({Color? color}) {
  showDialog(
    context: AppNavigator.context!,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: Center(
          child: Image.asset(
            imageLoading,
            height: 100.sp,
            width: 100.sp,
            fit: BoxFit.fitWidth,
            color: color ?? colorPrimary,
          ),
        ),
      );
    },
    barrierColor: const Color(0x80000000),
    barrierDismissible: false,
  );
}
