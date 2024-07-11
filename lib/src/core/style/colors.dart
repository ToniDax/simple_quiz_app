import "dart:ui";
import "package:flutter/foundation.dart";

@immutable
sealed class AppColors {

  ///main colors
  static const Color transparent = Color(0x00000000);
  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xFF000000);
  static const Color red = Color(0xFFCA3232);
  static const Color orange = Color(0xFFFF9051);
  static const Color orange2 = Color(0xFFDE5810);

  static const Color primaryColor = Color(0xFFB388FF); // Add your desired color


  /// every colors
  static const Color gradientSplash1 = Color(0xFF9F7FFF);
  static const Color gradientSplash2 = Color(0xFF8055FE);
  static const Color unVisibleAuthButton =  Color(0x808055FE);
  static const Color visibleAuthButton = Color(0xFF8055FE);
  static const Color subtitleSplash = Color(0xFFA7A7A7);
  static const Color titleSplash = Color(0xFF280A82);



  /// gradients
  static const List<Color> splashBcgGradient = <Color>[gradientSplash1, gradientSplash2];
}
