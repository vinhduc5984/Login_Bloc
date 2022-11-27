import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testsuntech/src/bloc/aplication/export_bloc.dart';
import 'package:testsuntech/src/bloc/app_bloc.dart';
import 'package:testsuntech/src/bloc/app_state/export_bloc.dart';
import 'package:testsuntech/src/bloc/authentication_bloc/auth_event.dart';
import 'package:testsuntech/src/configs/aplication.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(InitialApplicationState());

  @override
  Stream<ApplicationState> mapEventToState(event) async* {
    if (event is OnSetupApplication) {
      await Application().initialAppLication(event.context);

      // Check Logined
      AppBloc.authenticationBloc.add(OnAuthCheck());

      // Initial Network Status
      AppBloc.appStateBloc.add(OnStartApp(isFirstRun: true));

      yield ApplicationCompleted();
    }
  }
}
