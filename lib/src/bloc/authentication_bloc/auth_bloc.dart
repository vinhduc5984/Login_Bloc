import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testsuntech/src/bloc/app_bloc.dart';
import 'package:testsuntech/src/bloc/authentication_bloc/auth_event.dart';
import 'package:testsuntech/src/bloc/authentication_bloc/auth_state.dart';
import 'package:testsuntech/src/commons/dialogs/dialog_with_text_and_pop_button.dart';
import 'package:testsuntech/src/commons/dialogs/dialog_wrapper.dart';
import 'package:testsuntech/src/data/local_data_source/user_local_data.dart';
import 'package:testsuntech/src/helpers/custom_sizer/sizer.dart';
import 'package:testsuntech/src/models/enums/slide_mode.dart';
import 'package:testsuntech/src/repository/authen_repository/authen_repository.dart';
import 'package:testsuntech/src/routes/app_page.dart';
import 'package:testsuntech/src/routes/app_routes.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(InitialAuthenticationState());
  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is OnAuthCheck) {
      bool isLogin = _onAuthCheck();
      if (isLogin) {
        if (UserLocal().getIsCheckRemember()) {
          AppNavigator.push(Routes.HOME);
        }
        yield _getAuthenticationSuccess();
      } else {
        yield AuthenticationFail();
      }
    }

    if (event is LoginEvent) {
      String result = await _handleLogin(event);
      if (result.split('.').last == 'WRONG_PASSWORD') {
        dialogAnimationWrapper(
          borderRadius: 10.sp,
          slideFrom: SlideMode.bot,
          child: const DialogWithTextAndPopButton(
            bodyBefore: 'Sai mật khẩu, hãy thử lại nhé',
            title: 'Đăng nhập thật bại',
            bodyAlign: TextAlign.center,
          ),
        );
        yield AuthenticationFail();
      } else if (result.split('.').last == 'USERNAME_NOT_FOUND_ERROR') {
        dialogAnimationWrapper(
          borderRadius: 10.sp,
          slideFrom: SlideMode.bot,
          child: const DialogWithTextAndPopButton(
            bodyBefore: 'Tài khoản không tồn tại',
            title: 'Đăng nhập thật bại',
            bodyAlign: TextAlign.center,
          ),
        );
        yield AuthenticationFail();
      } else {
        UserLocal().saveAccessToken(result);
        AppNavigator.push(Routes.HOME);
        yield _getAuthenticationSuccess();
      }
    }

    if (event is LogOutEvent) {
      await _handleLogout();
      yield AuthenticationFail();
    }
  }

  // Private
  AuthenticationSuccess _getAuthenticationSuccess() {
    if (state is! AuthenticationSuccess) {
      AppBloc.cleanBloc();
      // AppBloc.initialHomeBloc();
    }
    return AuthenticationSuccess();
  }

  bool _onAuthCheck() {
    return UserLocal().getAccessToken().isNotEmpty ? true : false;
  }

  Future<String> _handleLogin(LoginEvent event) async {
    String result = await AuthenticationRepository().login(
        email: event.email,
        password: event.password,
        isCheclRemember: event.isCheckRemember);
    UserLocal().saveIsCheckRemember(event.isCheckRemember);
    AppNavigator.pop();

    return result;
  }

  Future<void> _handleLogout() async {
    UserLocal().clearAccessToken();
    UserLocal().clearUser();
    AppNavigator.pushNamedAndRemoveUntil(Routes.LOGIN);
  }
}
