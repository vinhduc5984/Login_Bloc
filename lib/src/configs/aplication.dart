import 'package:flutter/material.dart';
import 'package:testsuntech/src/commons/dialogs/dialog_notify_error.dart';
import 'package:testsuntech/src/commons/dialogs/dialog_wrapper.dart';
import 'package:testsuntech/src/constants/constants.dart';
import 'package:testsuntech/src/helpers/custom_sizer/sizer.dart';
import 'package:testsuntech/src/models/enums/slide_mode.dart';
import 'package:testsuntech/src/models/local_data_srouce/base_local_data.dart';
import 'package:testsuntech/src/routes/app_page.dart';
import 'package:testsuntech/src/routes/appnavigator_observer.dart';

class Application {
  static String baseUrl = '';
  static const String mode = MODE_PRODUCTION;
  static bool isShowingError = false;

  Future<void> initialAppLication(BuildContext context) async {
    try {
      await BaseLocalData.initialBox();

      // Initial language

      // AppBloc.userBloc.add(GetLanguagesEvent());
      // AppBloc.requestBloc.add(GetSpecialtyEvent());
      // AppBloc.skillBloc.add(GetPositionsEvent());
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  void serverErrorAlert() async {
    if (AppNavigatorObserver.hasDialog) return;

    if (AppNavigatorObserver.isLoading) {
      AppNavigator.pop();
    }

    await dialogAnimationWrapper(
      dismissible: false,
      borderRadius: 10.sp,
      paddingBottom: 80.h,
      slideFrom: SlideMode.top,
      duration: delayHalfSecond,
      timeForDismiss: delayHalfSecond * 4,
      child: const DialogNotifyError(
        title: "Không thể kết nối",
        body: "Thử kết nối lại",
      ),
    );
  }
}
