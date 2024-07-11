import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/style/colors.dart';
import '../../../../core/style/images.dart';
import '../../controller/home_controller.dart';

class LoadingIndicatorPage extends StatelessWidget {
  const LoadingIndicatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);
    homeController.goNextLoading(context: context);
    return  Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          image: DecorationImage(
            image: AssetImage("assets/svg/page_with_line.svg")
          )
        ),
        child: Center(
          child: AppImages.loadingHandLottie,
        ),
      ),
    );
  }
}
