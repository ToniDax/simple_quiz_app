import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/routes/app_route_name.dart';
import '../../../core/utils/utils.dart';
import '../../../models/code_sms_token.dart';
import '../../../models/token_model.dart';
import '../../../models/user_model.dart';
import '../../../repository/app_repository_implements.dart';

class AuthController extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool passwordIsVisible = false;
  bool confirmPasswordIsVisible = true;
  bool isEnableButton = false;
  AuthTokenModel? tokenModel;
  UserModel? user;
  SmsCodeModel? smsCodeModel;
  AppRepositoryImpl appRepositoryImpl = AppRepositoryImpl();

  /// all

  void passwordChangeVisible() {
    passwordIsVisible = !passwordIsVisible;
    notifyListeners();
  }

  void confirmPasswordChangeVisible() {
    confirmPasswordIsVisible = !confirmPasswordIsVisible;
    notifyListeners();
  }

  void buttonIsVisible() {
    passwordIsVisible = true;
    notifyListeners();
  }

  bool validateEmail(String email) {
    return email.isNotEmpty && email.endsWith('@gmail.com');
  }

  bool validatePassword(String password) {
    final RegExp passwordRegExp =
        RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)[A-Za-z\d]{6,}$');
    return passwordRegExp.hasMatch(password);
  }

  /// sign in page 3 function

  void forgetPassword({required BuildContext context}) {
    context.go("${AppRouteName.signIn}/${AppRouteName.forgotPassword}");
    nameController.clear();
    passwordController.clear();
    emailController.clear();
    notifyListeners();
  }

  void authLogin(
      {required BuildContext context,
      required TextEditingController emailController,
      required TextEditingController passwordController}) async{
    final emailValid = validateEmail(emailController.text);
    final passwordValid = validatePassword(passwordController.text);

    if (emailValid && passwordValid) {
      user = await appRepositoryImpl.loginUser(email: emailController.text, password: passwordController.text);
      if(user != null){
        context.go("${AppRouteName.home}/${AppRouteName.homeSinglePlayer}/${AppRouteName.map}");
        Utils.fireSnackBar("Successfully", context, Colors.green);
      }else{
        Utils.fireSnackBar("Something went wring in Login", context, Colors.red);
      }
    } else if (!emailValid && !passwordValid) {
      Utils.fireSnackBar(
          "Email and password are not valid", context, Colors.red);
    } else {
      if (!emailValid) {
        Utils.fireSnackBar(
            "Email must end with '@gmail.com'", context, Colors.red);
      }
      if (!passwordValid) {
        Utils.fireSnackBar("Password is not Strong", context, Colors.red);
      }
    }

    notifyListeners();
    emailController.clear();
    passwordController.clear();
  }

  void createAccount({required BuildContext context}) {
    notifyListeners();
    context.go("${AppRouteName.signIn}/${AppRouteName.signUp}");
    nameController.clear();
    passwordController.clear();
    emailController.clear();
  }

  /// sign up page 2 function
  /// register => sendsms => login=> home


  void authRegister(
      {required BuildContext context,
        required TextEditingController emailController,
        required TextEditingController passwordController}) async {
    final emailValid = validateEmail(emailController.text);
    final passwordValid = validatePassword(passwordController.text);

    if (emailValid && passwordValid) {
      /// network register
      log("authController register func smsToken olinmoqda");
      smsCodeModel = await appRepositoryImpl.registerUser(email: emailController.text, password: passwordController.text);

      if (smsCodeModel != null) {
        // Initialize user if it's null
        user ??= UserModel();

        user!.smsToken = smsCodeModel!.codeToken.toString();
        log(user!.smsToken.toString());
        log("${smsCodeModel!.codeToken}  auth controller page 122 line");

        log(user!.smsToken.toString());
        Utils.fireSnackBar("We sent an SMS code to your email", context, Colors.cyan);

        /// Pass the token to the next page
        context.go("${AppRouteName.signIn}/${AppRouteName.signUp}/${AppRouteName.enterCode}", extra: user);
      } else {
        Utils.fireSnackBar("Something went wrong in Login", context, Colors.red);
      }
    } else if (!emailValid && !passwordValid) {
      Utils.fireSnackBar("Email and password are not valid", context, Colors.red);
    } else {
      if (!emailValid) {
        Utils.fireSnackBar("Email must end with '@gmail.com'", context, Colors.red);
      }
      if (!passwordValid) {
        Utils.fireSnackBar("Password is not strong", context, Colors.red);
      }
    }

    notifyListeners();
    emailController.clear();
    passwordController.clear();
  }


  void alreadyHasAccount({required BuildContext context}) {
    /// sign in boladi
    context.go(AppRouteName.signIn);
    notifyListeners();
    nameController.clear();
    passwordController.clear();
    emailController.clear();
  }
}
