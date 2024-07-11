import '../models/code_sms_token.dart';
import '../models/token_model.dart';
import '../models/user_model.dart';

abstract class AppRepository {
  /// User Login
  Future<UserModel?> loginUser({
    required String email,
    required String password,
  });


  /// User Register
  Future<SmsCodeModel?> registerUser({
    required String email,
    required String password,
  });


  /// User Confirm Otp Code
  Future<void> confirmOtpUser({
    required String email,
    required String code,
    required String token,
  });



}
