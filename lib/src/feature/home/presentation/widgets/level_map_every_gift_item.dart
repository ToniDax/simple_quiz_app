
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/style/colors.dart';
import '../../../../core/style/images.dart';

class LeftGift extends StatelessWidget {
  const LeftGift({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 25, width: 2, color: Colors.black),

        Row(
          children: [
            SizedBox(width: 30.w),
            Expanded(
              child: Row(
                children: [
                  /// gift item
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
                              points: 8,
                              side: BorderSide(
                                color: AppColors.orange2,
                                width: 4,
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
                            child:  const Center(child:  Icon(
                              Icons.card_giftcard_outlined,
                              color: Colors.black,
                            ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  /// line
                  Container(
                    height: 2,
                    width: 50,
                    color: Colors.black,
                  ),

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
                ],
              ),
            ),
          ],
        ),
        Container(
          height: 25,
          width: 2,
          color: Colors.black,
        ),
      ],
    );
  }
}

class RightGift extends StatelessWidget {
  const RightGift({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 25,
          width: 2,
          color: Colors.black,
        ),
        Row(
          children: [
            SizedBox(width: 145.w),
            Expanded(
              child: Row(
                children: [
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

                  /// line
                  Container(
                    height: 2,
                    width: 50,
                    color: Colors.black,
                  ),
                  /// gift item
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
                              points: 8,
                              side: BorderSide(
                                color: AppColors.orange2,
                                width: 4,
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
                            child:  const Center(child:  Icon(
                              Icons.card_giftcard_outlined,
                              color: Colors.black,
                            ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          height: 25.h,
          width: 2.w,
          color: Colors.black,
        ),
      ],
    );
  }
}