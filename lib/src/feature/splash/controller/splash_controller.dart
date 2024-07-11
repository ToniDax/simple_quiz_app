import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/app_route_name.dart';

class SplashController extends ChangeNotifier{

  void goNext({required BuildContext context}){
    Timer(const Duration(seconds: 3), () {

      /// splash => AuthGate => (isRegistered) ? Home : OnBoarding;
      context.go(AppRouteName.onBoarding);
    });
    notifyListeners();
  }


}