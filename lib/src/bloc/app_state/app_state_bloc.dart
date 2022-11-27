import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testsuntech/src/bloc/app_bloc.dart';

import 'package:testsuntech/src/bloc/app_state/export_bloc.dart';
import 'package:testsuntech/src/routes/app_page.dart';
import 'package:testsuntech/src/routes/app_routes.dart';

class AppStateBloc extends Bloc<AppStateEvent, AppStateState> {
  AppStateBloc() : super(AppStateInitial());
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> connectivitySubscription;
  bool isNetworkConnected = true;
  bool isActive = true;

  @override
  Stream<AppStateState> mapEventToState(AppStateEvent event) async* {
    if (event is OnStartApp) {
      _initConnectivity();
      connectivitySubscription =
          _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    }

    if (event is OnResume) {
      _handleResume();
    }

    if (event is OnBackground) {
      _handleBackground();
    }
  }

  // Private Methods
  void _handleResume() {
    if (!isActive) {
      isActive = true;
    }
  }

  void _handleBackground() {
    if (isActive) {
      isActive = true;
    }
  }

  Future<void> _initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        _handleNetworkConnected();
        break;
      case ConnectivityResult.mobile:
        _handleNetworkConnected();
        break;
      default:
        _handleConnectNetworkFail();
        break;
    }
  }

  void _handleNetworkConnected() {
    if (!isNetworkConnected) {
      // Pop dialog alert no internet connected
      AppNavigator.popUntil(Routes.HOME);
      // AppBloc.homeBloc.add(OnChangeIndexEvent());
      AppBloc.initialHomeBloc();
    }
    isNetworkConnected = true;
  }

  void _handleConnectNetworkFail() async {
    if (isNetworkConnected) {
      isNetworkConnected = false;
      // Show dialog alert no internet and reconnect
      // await dialogAnimationWrapper(
      //   dismissible: false,
      //   borderRadius: 10.sp,
      //   slideFrom: SlideMode.bot,
      //   child: DialogConfirmCancel(
      //     bodyBefore: 'Disconnect Internet',
      //     confirmText: 'Retry',
      //     onConfirmed: () {
      //       AppNavigator.popUntil(Routes.HOME);
      //       AppBloc.homeBloc.add(OnChangeIndexEvent());
      //       isNetworkConnected = true;
      //     },
      //   ),
      // );
    }
  }
}
