class UtilLogger {
  // ignore: constant_identifier_names
  static const String TAG = "SALEBOLT";

  static log([String tag = TAG, dynamic msg]) {
    // if (Application.mode == 'DEV') {
    //   developer.log('$msg', name: tag);
    // }
  }

  ///Singleton factory
  static final UtilLogger _instance = UtilLogger._internal();

  factory UtilLogger() {
    return _instance;
  }

  UtilLogger._internal();
}
