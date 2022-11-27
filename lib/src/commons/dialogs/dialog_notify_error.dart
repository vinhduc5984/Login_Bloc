import 'package:flutter/material.dart';
import 'package:testsuntech/src/constants/constants.dart';
import 'package:testsuntech/src/helpers/custom_sizer/sizer.dart';

class DialogNotifyError extends StatelessWidget {
  const DialogNotifyError({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.sp,
      width: 100.w,
      padding: EdgeInsets.all(7.sp),
      decoration: BoxDecoration(
        color: colorDialogBackGround,
        borderRadius: BorderRadius.circular(8.sp),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 3.sp,
            padding: EdgeInsets.only(top: .5.sp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.sp),
              color: colorDialogError,
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 12.sp),
            padding: EdgeInsets.all(4.sp),
            width: 20.sp,
            height: 20.sp,
            decoration: BoxDecoration(
              color: colorDialogError,
              borderRadius: BorderRadius.circular(50.sp),
            ),
            child: Image.asset(iconExclamationMark),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: colorBlack2,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                ),
                Text(
                  body,
                  style: TextStyle(
                    color: colorGray2,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w400,
                    height: 1.57,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
