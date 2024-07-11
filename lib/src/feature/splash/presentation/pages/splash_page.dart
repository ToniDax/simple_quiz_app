import "package:flutter/material.dart";
import "../../../../core/style/colors.dart";
import "../../../../core/style/images.dart";
import "../../controller/splash_controller.dart";

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final splashController = SplashController();
    splashController.goNext(context: context);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: AppImages.fullPage
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // AppImages.loadingLottie,
                  AppImages.splashLottie,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// splash => AuthGate => (isRegistered) ? Home : OnBoarding;
