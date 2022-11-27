import 'package:hive/hive.dart';
import 'package:testsuntech/src/configs/storage_key.dart';
import 'package:testsuntech/src/helpers/utils/path_helper.dart';

class BaseLocalData {
  static Future<void> initialBox() async {
    var path = await PathHelper.appDir;
    Hive.init(path.path);
    await Hive.openBox(StorageKey.boxUser);
  }
}
