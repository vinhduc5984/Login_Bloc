import 'package:flutter/material.dart';
import 'package:testsuntech/src/constants/constants.dart';
import 'package:testsuntech/src/helpers/custom_sizer/sizer.dart';
import 'package:testsuntech/src/routes/app_page.dart';

class ButtonPopDialog extends StatelessWidget {
  final String? route;
  const ButtonPopDialog({
    Key? key,
    required String text,
    this.route,
  })  : _text = text,
        super(key: key);

  final String _text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        route != null ? AppNavigator.popUntil(route!) : AppNavigator.pop();
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: colorDialogBackGround,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12.sp),
            bottomRight: Radius.circular(12.sp),
          ),
        ),
        constraints: BoxConstraints(maxHeight: 46.sp),
        alignment: Alignment.center,
        child: Text(
          _text.toUpperCase(),
          style: TextStyle(
            color: colorPrimary,
            fontSize: 12.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
