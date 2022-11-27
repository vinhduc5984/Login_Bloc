import 'package:dio/dio.dart';
import 'package:testsuntech/src/data/local_data_source/user_local_data.dart';
import 'package:testsuntech/src/data/remote_data/account_model.dart';
import 'package:testsuntech/src/repository/api_gateway.dart';
import 'package:testsuntech/src/repository/base_repository.dart';

class AuthenticationRepository {
  Future<String> login(
      {required String email,
      required String password,
      required bool isCheclRemember}) async {
    var body = {'username': email, 'password': password};
    Response response =
        await BaseRepository().postRoute(APIGateway.login, body);
    if (response.statusCode == 200) {
      if (isCheclRemember) {
        AccountModel accountModel = AccountModel.fromMap(response.data);
        UserLocal().saveAccount(accountModel);
      }
      return response.data['accessToken'];
    }
    return response.data['message'];
  }
}
