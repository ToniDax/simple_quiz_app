import "package:flutter/foundation.dart";

@immutable
final class AppRouteName {
  const AppRouteName._();

  static const String splashPage = "/splashPage";
  static const String onBoarding = "/onBoarding";

  static const String signIn = "/sign-in";

  static const String signUp = "sign-up";
  static const String forgotPassword = "forgot-password";
  static const String reCoverPassword = "recover-password";
  static const String enterCode = "enter-code";

  static const String home = "/home";
  static const String homeMultiPlayer = "home-multi-player";
  static const String homeSinglePlayer = "home-single-player";

  static const String map = "map";

  static const String loading = "loading";

  static const String quiz = "quiz";
  static const String result = "quiz/result";


  static const String multiQuiz = "multi-quiz";
  static const String multiResult = "multi-quiz/result";



}
