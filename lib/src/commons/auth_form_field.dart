import 'package:flutter/material.dart';
import 'package:testsuntech/src/constants/constants.dart';
import 'package:testsuntech/src/helpers/custom_sizer/sizer.dart';

class AuthFormField extends StatelessWidget {
  const AuthFormField({
    Key? key,
    required keyboardType,
    required String hintText,
    required String lable,
    required bool textVisible,
    FocusNode? focusNode,
    this.controller,
    void Function(String)? onSubmitted,
    required void Function(String) onChanged,
    required String? Function(String?) validator,
    Function()? onTap,
    Widget? suffixIcon,
  })  : _keyboardType = keyboardType,
        _hintText = hintText,
        _lable = lable,
        _textVisible = textVisible,
        _focusNode = focusNode,
        _onSubmitted = onSubmitted,
        _onChanged = onChanged,
        _validator = validator,
        _suffixIcon = suffixIcon,
        _onTap = onTap,
        super(key: key);

  final TextInputType _keyboardType;
  final String _hintText;
  final String _lable;
  final bool _textVisible;
  final FocusNode? _focusNode;
  final void Function(String)? _onSubmitted;
  final void Function(String) _onChanged;
  final String? Function(String?) _validator;
  final Widget? _suffixIcon;
  final TextEditingController? controller;
  final void Function()? _onTap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: _onTap,
      readOnly: _onTap != null,
      controller: controller,
      focusNode: _focusNode,
      onFieldSubmitted: _onSubmitted,
      keyboardType: _keyboardType,
      obscureText: !_textVisible,
      validator: _validator,
      cursorColor: colorPrimary,
      cursorRadius: Radius.circular(30.sp),
      style: TextStyle(color: Colors.black, fontSize: 12.sp),
      decoration: InputDecoration(
        label: Text(
          _lable,
          style: TextStyle(
            color: colorBlack1,
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        hintText: _hintText,
        focusColor: colorPrimary,
        hintStyle: TextStyle(
          color: colorBlack1,
          fontSize: 12.sp,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: colorGray2,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
        suffixIconConstraints: BoxConstraints(
          minWidth: 16.sp,
          minHeight: 16.sp,
        ),
        suffixIcon: _suffixIcon,
      ),
      onChanged: _onChanged,
    );
  }
}
