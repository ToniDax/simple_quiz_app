import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/app_route_name.dart';

class HomeController extends ChangeNotifier{

  void goNextLoading({required BuildContext context}){
    Timer(const Duration(seconds: 5), () {
      context.go("${AppRouteName.home}/${AppRouteName.homeSinglePlayer}/${AppRouteName.map}/${AppRouteName.quiz}");
    });
  }


  PageController pageController = PageController();

  void goToMultiPlayerPage() {
  pageController.jumpToPage(1); // Navigate to MultiPlayerPage
  notifyListeners();
  }

  void goToSinglePlayerPage() {
  pageController.jumpToPage(0); // Navigate to SinglePlayerPage
  notifyListeners();
  }
}