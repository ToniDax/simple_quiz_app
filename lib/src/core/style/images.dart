import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";
import "package:lottie/lottie.dart";

import "colors.dart";

@immutable
sealed class AppImages {
  const AppImages._();

  ///  SVG
  static final SvgPicture categoryArrowBackIcon = SvgPicture.asset(
    "assets/icons/ic_arrow_back.svg",
    height: 24.h,
    width: 24.w,
    fit: BoxFit.cover,
  );
  static final SvgPicture onBoardingImage = SvgPicture.asset(
    "assets/svg/illustration.svg",
    height: 24.h,
    width: 24.w,
    fit: BoxFit.cover,
  );
  static final SvgPicture pencilSvg = SvgPicture.asset(
    "assets/svg/Pencil.svg",
    height: 24.h,
    width: 24.w,
    fit: BoxFit.cover,
  );
  static final SvgPicture fullPage = SvgPicture.asset(
    "assets/svg/page_with_line.svg",
    fit: BoxFit.cover,
  );
  static final SvgPicture nextOnTap = SvgPicture.asset(
    "assets/svg/nextOnTap.svg",
    height: 56.h,
    width: 56.w,
    fit: BoxFit.cover,
  );
  static final SvgPicture nextView = SvgPicture.asset(
    "assets/svg/nextView.svg",
    height: 56.h,
    width: 56.w,
    fit: BoxFit.cover,
  );
  static final SvgPicture backOnTap = SvgPicture.asset(
    "assets/svg/backOnTap.svg",
    height: 56.h,
    width: 56.w,
    fit: BoxFit.cover,
  );
  static final SvgPicture backView = SvgPicture.asset(
    "assets/svg/backViev.svg",
    height: 56.h,
    width: 56.w,
    fit: BoxFit.cover,

  );
  static final SvgPicture singlePerson = SvgPicture.asset(
      "assets/svg/single.svg",
      height: 56.h,
      width: 56.w,
      fit: BoxFit.cover,
  );
  static final SvgPicture lockIcon = SvgPicture.asset(
      "assets/icons/lock_icon.svg",
      height: 30.h,
      width: 30.w,
      fit: BoxFit.cover,
  );



  /// Lottie

  static final LottieBuilder loadingLottie = Lottie.asset("assets/lottie/loading.json");
  static final LottieBuilder loadingHandLottie = Lottie.asset("assets/lottie/loading_hand.json");
  static final LottieBuilder surpriseLottie = Lottie.asset("assets/lottie/jeckpot_lottie.json");
  static final LottieBuilder splashLottie = Lottie.asset("assets/lottie/splash_lottie.json");
  static final LottieBuilder fireworksLottie = Lottie.asset("assets/lottie/fireworks.json");

  /// PNG

  static final Image singlePlayerPersonIcon = Image.asset(
    "assets/images/single_player_person_icon.png",
    fit: BoxFit.fitHeight,
  );
  static final Image multiPlayerPersonIcon = Image.asset(
    "assets/images/multi_player_person_icons.png",
    fit: BoxFit.fitHeight,
  );
  static final Image questionIcon = Image.asset(
    "assets/images/questions_icon.png",
    fit: BoxFit.fitHeight,
  );
  static final Image refreshFrame = Image.asset(
    "assets/images/refresh_frame.png",
    height: 28.h,
    width: 28.w,
    fit: BoxFit.fitHeight,
  );
  static final Image doneFrame = Image.asset(
    "assets/images/done_frame.png",
    height: 28.h,
    width: 28.w,
    fit: BoxFit.fitHeight,
  );
  static final Image errorFrame = Image.asset(
    "assets/images/error_frame.png",
    height: 28.h,
    width: 28.w,
    fit: BoxFit.fitHeight,
  );
  static final Image questionPhoto = Image.asset(
    "assets/images/question_foto.png",
    fit: BoxFit.fitHeight,
  );
  static final Image playButton = Image.asset(
    "assets/images/play_button.png",
    height: 200.h,
    width: 200.w,
    fit: BoxFit.cover,
  );
  static final Image multiplayer = Image.asset(
    "assets/images/Multiplayer.png",
    height: 200.h,
    width: 170.w,
    fit: BoxFit.fitHeight,
  );
  static final Image multiplayerText = Image.asset(
    "assets/images/multiText.png",
    height: 220.h,
    width: 170.w,
    fit: BoxFit.cover,
  );
  static final Image businessmen = Image.asset(
    "assets/images/Businessman.png",
    height: 24.h,
    width: 24.w,
    fit: BoxFit.cover,
    color: AppColors.white,

  );
  static final Image businessmen2 = Image.asset(
    "assets/images/Group (1).png",
    height: 24.h,
    width: 24.w,
    fit: BoxFit.cover,
    color: AppColors.white,

  );



}

extension Extension on Image {
  Image copyWith({
    double? width,
    double? height,
    BoxFit? fit,
    Color? color,
  }) =>
      Image(
        image: image,
        width: width ?? this.width,
        height: height ?? this.height,
        fit: fit ?? this.fit,
        color: color ?? this.color,
      );
}
