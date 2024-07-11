import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/style/colors.dart';
import '../../../../core/style/images.dart';
import '../../../../core/widget/custom_text_widget_all.dart';
import '../../controller/on_boarding_controller.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final onBoardingController = Provider.of<OnBoardingController>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.gradientSplash1,
              AppColors.gradientSplash2,
            ],
          ),
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 100.h),

              Expanded(
                flex: 1,
                child: AppImages.questionIcon, // Replace with your image asset
              ),
              SizedBox(height: 50.h),

              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    /// Text Page View
                    Container(
                      decoration: const BoxDecoration(
                       color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      height: 320.h,
                      width: 280.w,
                      child: PageView.builder(
                        controller: onBoardingController.pageController,
                        onPageChanged: (index) {
                          onBoardingController.setCurrentPage(index);
                        },
                        itemCount: onBoardingController.titles.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                Shimmer.fromColors(
                                  baseColor: AppColors.black,
                                  highlightColor: AppColors.primaryColor,
                                  child: Center(
                                    child: CustomTextWidget(
                                      onBoardingController.titles[index],
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      textColor: AppColors.black,
                                    ),
                                  ),
                                ),

                                SizedBox(height: 20.h),

                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                                  child: CustomTextWidget(
                                    onBoardingController.subtitles[index],
                                    textColor: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),

                                SizedBox(height: 50.h),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    /// smooth indicator
                    Positioned(
                      bottom: 180.h,
                      left: 110.w,
                      child: SmoothPageIndicator(
                        controller: onBoardingController.pageController,
                        count: onBoardingController.titles.length,
                        effect: const WormEffect(
                          activeDotColor:
                              Color(0xFFFFA500), // Replace with your color
                        ),
                      ),
                    ),
                    /// next button
                    Positioned(
                      bottom: 76.h,
                      left: 105.w,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(0xFFFFA500), // Replace with your color
                          borderRadius: BorderRadius.all(
                            Radius.circular(36),
                          ),
                        ),
                        height: 80.h,
                        width: 80.w,
                        child: Center(
                          child: IconButton(
                            onPressed: () {
                              onBoardingController.nextPage(context: context);
                              onBoardingController.pageController
                                  .animateToPage(
                                onBoardingController.currentPage,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                            icon: const Icon(
                              Icons.arrow_forward_rounded,
                              size: 32,
                            ),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
