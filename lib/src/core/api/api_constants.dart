import '../../../setup.dart';

class ApiConstants {
  /// base Url
  // static const String baseUrl = "localhost:8080";
  // static const String baseUrl= "172.30.0.1:8080";
  ///172.30.0.1
  // static const String baseUrlLaptopId= "172.30.0.1:8080";
  // static const String baseUrlWifiId = "10.10.2.123:8080";
  // static const String baseUrl = "65c717aae7c384aada6e2dae.mockapi.io";
  static const String baseUrl = "7f3a-178-218-201-17.ngrok-free.app";
  ///https:///


/// 172.30.0.1 == localhost
  /// base Api
  static String apiAuthSendCode = "/api/mail/sendcode";
  // static String apiAuthSendCode = "/user";
  static String apiAuthRegister = "/api/auth/register";
  static String apiAuthLogin = "/api/auth/login";
  static String apiAuthRecoverPassword = "/api/user/recoverpassword";
  static String apiAuthForgetPassword = "/api/user/forgotpasswordcode";
  static String apiUser = "/api/user/me";
  static String apiGetPoints = "/api/user/get";
  static String apiRefresh = "/api/refresh";
  static String apiQuestions = "/api/questions";
  static String apiQuestionsLevelId = "/api/questions/{levelId}";
  static String apiLevels = "/api/levels";



  // headers
  static Map<String, String> headers = <String, String>{
    "Content-Type": "application/json"};
    // "Accept": "application/json",
    // "Authorization": "Bearer $token",


  /// params

  static Map<String, String> emptyParams() => <String, String>{};

  /// body

  static Map<String, dynamic> bodyEmpty() => <String, dynamic>{};

  static Map<String, dynamic> bodyLoginUser(
          {required String email, required String password}) =>
      <String, String>{
        "email": email,
        "password": password,
      };
}
