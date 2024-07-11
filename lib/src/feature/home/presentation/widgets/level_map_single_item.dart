import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/style/colors.dart';
import '../../../../core/style/images.dart';

class SingleItem extends StatelessWidget {
  const SingleItem({super.key, required this.isOpen});
  final bool isOpen;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 25.h, width: 2.w, color: Colors.black),

        SizedBox(
          height: 70.h,
          width: 70.w,
          child: Hero(
            tag: const Key('image'),
            child: Material(
              color: Colors.transparent, // Make Material color transparent
              child: Ink(
                decoration: const ShapeDecoration(
                  color: AppColors.primaryColor,
                  shape: StarBorder(
                    innerRadiusRatio: .9,
                    pointRounding: .2,
                    points: 6,
                    side: BorderSide(
                      color: AppColors.white,
                      width: 2,
                    ),
                  ),
                ),
                child: InkWell(
                  onTap: () {}, // Handle tap event
                  customBorder: const StarBorder(
                    innerRadiusRatio: .9,
                    pointRounding: .2,
                    points: 6,
                    side: BorderSide(
                      color: AppColors.white,
                      width: 2,
                    ),
                  ),
                  splashColor: Colors.white.withOpacity(0.3), // Customize splash color
                  child: SizedBox(
                    height: 70.h,
                    width: 70.w,
                    child: Center(child: AppImages.lockIcon),
                  ),
                ),
              ),
            ),
          ),
        ),




        Container(height: 25, width: 2, color: Colors.black),
      ],
    );
  }
}