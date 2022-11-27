import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:testsuntech/src/bloc/aplication/export_bloc.dart';
import 'package:testsuntech/src/bloc/app_bloc.dart';
import 'package:testsuntech/src/configs/storage_key.dart';
import 'package:testsuntech/src/constants/constants.dart';
import 'package:testsuntech/src/helpers/custom_sizer/sizer.dart';
import 'package:testsuntech/src/helpers/loger.dart';
import 'package:testsuntech/src/helpers/utils/path_helper.dart';
import 'package:testsuntech/src/routes/app_page.dart';
import 'package:testsuntech/src/routes/app_routes.dart';
import 'package:testsuntech/src/routes/appnavigator_observer.dart';
import 'package:testsuntech/src/routes/scaffold_wrapper.dart';
import 'package:testsuntech/src/ui/authentication/screen/login_screen.dart';
import 'package:testsuntech/src/ui/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = AppBlocObserver();
  var path = await PathHelper.appDir;
  Hive.init(path.path);
  await Hive.openBox(StorageKey.boxUser);
  runApp(const MyApp());
}

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    UtilLogger.log('BLOC EVENT', event);
    super.onEvent(bloc, event);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    UtilLogger.log('BLOC ERROR', error);
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    UtilLogger.log('BLOC TRANSITION', transition.event);
    super.onTransition(bloc, transition);
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    AppBloc.applicationBloc.add(OnSetupApplication(context));
  }

  @override
  void dispose() {
    AppBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBloc.providers,
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: AppNavigator.navigatorKey,
            title: 'SunTech',
            theme: ThemeData(
              primaryColor: colorPrimary,
            ),
            navigatorObservers: [
              AppNavigatorObserver(),
            ],
            onGenerateRoute: (settings) {
              return AppNavigator().getRoute(settings);
            },
            initialRoute: Routes.LOGIN,
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: child!,
              );
            },
            home: BlocBuilder<ApplicationBloc, ApplicationState>(
              buildWhen: (previous, current) => previous != current,
              builder: (context, application) {
                if (application is ApplicationCompleted) {
                  return const ScaffoldWrapper(
                    child: LoginScreen(),
                  );
                }
                return const ScaffoldWrapper(child: SplashScreen());
              },
            ),
          );
        },
      ),
    );
  }
}
