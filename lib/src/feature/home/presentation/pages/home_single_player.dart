import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/style/colors.dart';
import '../../../../core/style/images.dart';
import '../../controller/home_controller.dart';
import '../widgets/user_info_line_widget.dart';

class SinglePlayerPage extends StatelessWidget {
  const SinglePlayerPage({super.key});

  static const double value = 100.0;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    final controller = Provider.of<HomeController>(context, listen: false);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/page_with_line.png'),
            fit: BoxFit.cover,
          ),
          gradient: LinearGradient(
            colors: AppColors.splashBcgGradient,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.1),

            /// user info line
           UserInfoLineWidget(size: size),

            const Spacer(),

            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 56,
                    height: 56,
                    child: AppImages.backOnTap,
                  ),
                  CircleAvatar(
                    radius: 100,
                    backgroundColor: AppColors.transparent,
                    child: IconButton(
                      iconSize: 80,
                      icon: AppImages.playButton,
                      onPressed: () {
                        // Bu  bosilganda bajariladigan kod
                      },
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.goToMultiPlayerPage();
                      /// go MultiPlayer
                    },
                    child: Material(
                      color: Colors.transparent,
                      child: Ink(
                        decoration: const BoxDecoration(
                          color: AppColors.transparent,
                          shape: BoxShape.rectangle,
                        ),
                        child: SizedBox(
                          width: 56,
                          height: 56,
                          child: AppImages.nextView,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: size.height * 0.2),

            Center(
              child: Container(
                height: 70.h,
                width: 70.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.orange,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SizedBox(
                    height: 24.h,
                      width: 24.w,
                      child: AppImages.singlePlayerPersonIcon,
                  ),
                ),
              ),
            ),

            SizedBox(height: size.height * 0.07,),
          ],
        ),
      ),
    );
  }
}