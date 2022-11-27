import 'package:flutter/material.dart';
import 'package:testsuntech/src/commons/button_pop_dialog.dart';
import 'package:testsuntech/src/constants/constants.dart';
import 'package:testsuntech/src/helpers/custom_sizer/sizer.dart';

class DialogWithTextAndPopButton extends StatelessWidget {
  const DialogWithTextAndPopButton(
      {Key? key,
      this.title,
      this.bodyBefore,
      this.bodyAfter,
      this.highlightText,
      this.buttonText,
      this.titleColor = colorBlack1,
      this.bodyColor = colorBlack2,
      this.highlightColor = colorPrimary,
      this.titleFontSize,
      this.bodyFontSize,
      this.bodyAlign = TextAlign.justify,
      this.titleAlign = TextAlign.center,
      this.padding,
      this.route})
      : assert(
          bodyBefore != null || bodyAfter != null,
          'The body before and body after can not both be null',
        ),
        super(key: key);

  final String? title;
  final String? bodyBefore;
  final String? highlightText;
  final String? bodyAfter;
  final String? buttonText;
  final Color titleColor;
  final Color bodyColor;
  final Color highlightColor;
  final double? titleFontSize;
  final double? bodyFontSize;
  final TextAlign bodyAlign;
  final TextAlign titleAlign;
  final EdgeInsetsGeometry? padding;
  final String? route;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      decoration: BoxDecoration(
        color: colorDialogBackGround,
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: padding ??
                EdgeInsets.only(
                  left: 16.sp,
                  right: 16.sp,
                  top: 22.sp,
                  bottom: 18.sp,
                ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                title != null
                    ? Text(
                        title!,
                        textAlign: titleAlign,
                        style: TextStyle(
                          color: titleColor,
                          fontSize: titleFontSize ?? 15.sp,
                          fontWeight: FontWeight.w600,
                          height: 1.36,
                        ),
                      )
                    : const SizedBox(),
                title != null ? SizedBox(height: 8.sp) : const SizedBox(),
                RichText(
                  textAlign: bodyAlign,
                  text: TextSpan(
                    style: TextStyle(
                      color: bodyColor,
                      fontSize: bodyFontSize ?? 12.sp,
                      fontWeight: FontWeight.w400,
                      height: 1.6,
                    ),
                    children: [
                      TextSpan(text: bodyBefore),
                      highlightText != null
                          ? TextSpan(
                              text: ' $highlightText ',
                              style: TextStyle(color: highlightColor),
                            )
                          : const TextSpan(),
                      TextSpan(text: bodyAfter),
                    ],
                  ),
                ),
              ],
            ),
          ),
          dividerDialog,
          ButtonPopDialog(
            text: buttonText ?? 'Đã hiểu',
            route: route,
          ),
        ],
      ),
    );
  }
}
