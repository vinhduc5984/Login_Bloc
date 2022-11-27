abstract class AppStateEvent {}

class OnResume extends AppStateEvent {}

class OnBackground extends AppStateEvent {}

class OnStartApp extends AppStateEvent {
  final bool isFirstRun;
  OnStartApp({this.isFirstRun = false});
}
