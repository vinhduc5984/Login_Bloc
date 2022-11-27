import 'package:hive/hive.dart';
import 'package:testsuntech/src/configs/storage_key.dart';
import 'package:testsuntech/src/data/remote_data/account_model.dart';

class UserLocal {
  var box = Hive.box(StorageKey.boxUser);
  // User
  // Get local
  String getAccessToken() {
    return box.get(StorageKey.token) ?? '';
  }

  AccountModel getUser() {
    var accountLocal = box.get(StorageKey.account);
    if (accountLocal == null) {
      return AccountModel(
          accessToken: '',
          partnerId: '',
          refreshToken: '',
          userId: '',
          username: '');
    }
    return AccountModel.fromJson(accountLocal);
  }

  bool getIsCheckRemember() {
    return box.get(StorageKey.checkRemember) ?? false;
  }

  // save local
  void saveAccessToken(String token) async {
    box.put(StorageKey.token, token);
  }

  void saveAccount(AccountModel accountModel) {
    box.put(StorageKey.account, accountModel.toJson());
  }

  void saveIsCheckRemember(bool isCheck) {
    box.put(StorageKey.checkRemember, isCheck);
  }

  // clear local
  void clearUser() async {
    box.delete(StorageKey.account);
  }

  void clearAccessToken() async {
    box.delete(StorageKey.token);
  }

  void clearIscheckRemember() async {
    box.delete(StorageKey.checkRemember);
  }
}
