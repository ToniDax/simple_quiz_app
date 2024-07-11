// import 'package:flutter/cupertino.dart';
//
// class OnBoardingController with ChangeNotifier {
//   int currentPage = 0;
//
//   final List<String> titles = [
//     "Interesting QUIZ Awaits You",
//     "Learn and Grow",
//     "Challenge Yourself",
//   ];
//
//   final List<String> subtitles = [
//     "play quizzes with your friends and get various prizes",
//     "Gain knowledge and win rewards",
//     "Test your skills and improve",
//   ];
//
//   void setCurrentPage(int page) {
//     currentPage = page;
//     notifyListeners();
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/app_route_name.dart';

// class OnBoardingController with ChangeNotifier {
//   int currentPage = 0;
//   final PageController _pageController = PageController();
//
//   final List<String> titles = [
//     "Interesting QUIZ\nAwaits You",
//     "Learn and Grow",
//     "Challenge Yourself",
//   ];
//
//   final List<String> subtitles = [
//     "Play quizzes with your friends and get various prizes",
//     "Gain knowledge and win rewards",
//     "Test your skills and improve",
//   ];
//
//   void setCurrentPage(int page) {
//     currentPage = page;
//     notifyListeners();
//   }
//
//   void nextPage({required BuildContext context}) {
//     if (currentPage < titles.length - 1) {
//       currentPage++;
//       if(currentPage == 2){
//         context.go(AppRouteName.signIn);
//       }
//     } else {
//       currentPage = 0;
//     }
//     notifyListeners();
//   }
// }

class OnBoardingController with ChangeNotifier {
  int currentPage = 0;
  final PageController _pageController = PageController();

  final List<String> titles = [
    "Interesting QUIZ\nAwaits You",
    "Learn and Grow",
    "Challenge Yourself",
  ];

  final List<String> subtitles = [
    "Play quizzes with your friends and get various prizes",
    "Gain knowledge and win rewards",
    "Test your skills and improve",
  ];

  PageController get pageController => _pageController;

  void setCurrentPage(int page) {
    currentPage = page;
    notifyListeners();
  }

  void nextPage({required BuildContext context}) {
    if (currentPage <= titles.length) {
      currentPage++;
      if (currentPage == titles.length ) {
        context.go(AppRouteName.signIn);
      }
    } else {
      currentPage = 0;
    }
    notifyListeners();
  }
}