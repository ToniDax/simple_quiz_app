// import 'dart:developer';

import 'dart:developer';

import '../core/api/api.dart';
import '../core/api/api_constants.dart';
import '../models/code_sms_token.dart';
import '../models/token_model.dart';
import '../models/user_model.dart';
import 'app_repository.dart';

class AppRepositoryImpl implements AppRepository {
  /// Methods

  /// User Login Method
  @override
  Future<UserModel?> loginUser({
    required String email,
    required String password,
  }) async {
    String? str = await Api.getData(api: ApiConstants.apiAuthLogin, params: ApiConstants.emptyParams());
    if (str != null) {
      UserModel user = userModelFromJson(str);
      //// shetka token olinib shuni localga saqqlash kere keyin Home
      return user;
    }
    return null;
  }

  /// bu menga sms ga kod borganda smstoken qaytaradi shuni enterCode pagega
  /// olib otish kere
  Future<SmsCodeModel?> registerUser({required String email, required String password}) async {

    log("App Repo Impl register func");
    UserModel userModel = UserModel(email: email, password: password);
    String? str = await Api.postData(api: ApiConstants.apiAuthSendCode, body: userModel.toJson());
    log( "token keldi $str" ?? "str is null in App Repo impl");

    if (str != null) {
      SmsCodeModel smsToken = smsCodeModelFromJson(str);
      log("${smsToken.codeToken}  str null emas AppRepoIMple 48 line" ?? "user.email is null");
      return smsToken;
    }
    return null;
  }

  @override
  Future<void> confirmOtpUser({required String email, required String code, required String token}) async {
    String? str = await Api.postData(api: ApiConstants.apiAuthLogin, body: {});
    if (str != null) {
      log('seccessfuly');
    } else {
      log('errrrooo');
    }
  }

}
