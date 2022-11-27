import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testsuntech/src/bloc/aplication/application_bloc.dart';
import 'package:testsuntech/src/bloc/app_state/app_state_bloc.dart';
import 'package:testsuntech/src/bloc/authentication_bloc/auth_bloc.dart';

class AppBloc {
  static final appStateBloc = AppStateBloc();
  static final applicationBloc = ApplicationBloc();
  static final authenticationBloc = AuthenticationBloc();
  static final List<BlocProvider> providers = [
    BlocProvider<AppStateBloc>(
      create: (context) => appStateBloc,
    ),
    BlocProvider<ApplicationBloc>(
      create: (context) => applicationBloc,
    ),
    BlocProvider<AuthenticationBloc>(
      create: (context) => authenticationBloc,
    ),
  ];
  static void dispose() {
    appStateBloc.close();
    applicationBloc.close();
    authenticationBloc.close();
  }

  static void cleanBloc() {}

  static void initialHomeBloc() {}
  static void initialHomeBlocWithAuth() {}

  static final AppBloc _instance = AppBloc._internal();

  factory AppBloc() {
    return _instance;
  }

  AppBloc._internal();
}
