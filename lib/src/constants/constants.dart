// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';
import 'package:testsuntech/src/helpers/custom_sizer/sizer.dart';

const CONNECT_TIME_OUT = 5000;
const RECEIVE_TIME_OUT = 5000;
const LIMIT_RESPONSE_TIME = 200;

const INCH_TO_DP = 160;
const DELAY_HALF_SECOND = 500;
const DURATION_DEFAULT_ANIMATION = 300;

//Nunmber
const DELAY_50_MS = 50;
const DELAY_100_MS = 100;
const DELAY_200_MS = 200;
const DELAY_250_MS = 250;
const TO_PAY = 0;
const TO_SHIP = 1;
const COMPLETE = 2;
const delayHalfSecond = 500;

// String Constants
const MODE_DEV = 'DEV';
const MODE_PRODUCTION = 'PRODUCTION';

// Methods
const POST = 'POST';
const GET = 'GET';
const PUT = 'PUT';
const DELETE = 'DELETE';
const PATCH = 'PATCH';

// 'url'
const HTTP_URL = 'http://';
const HTTPS_URL = 'https://';

//Icons
const String iconExclamationMark = 'assets/icons/ic_exclamation_mark.png';

//Image
const String imgUserDefault = 'assets/images/image_user_default.png';
const String imageLoading = 'assets/images/img_loading.gif';

// colors

const Color colorPrimary = Color(0xFF3C4045);
const Color colorInactiveTextField = Color(0xFFF5F5F5);
const Color colorBorderTextField = Color(0xFFC5D0CF);

const Color backgroundDetails = Color(0xFFF5F5F5);
const colorDialogBackGround = Color(0xFFFFFFFF);
const colorDialogError = Color(0xFFE89F2F);
const Color colorGray1 = Color(0xFF6E6D7A);
const Color colorGray2 = Color(0xFFACACB9);
const Color colorBlack1 = Color(0xFF0D0C22);
const Color colorBlack2 = Color(0xFF3D3D4E);

dividerHorizontal(double width) {
  return Container(
    width: width,
    height: 0.3.sp,
    color: Colors.black,
  );
}

final dividerDialog = Container(
  height: .5.sp,
  color: const Color(0xFFE3E3E3),
);
