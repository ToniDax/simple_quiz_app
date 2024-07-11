import 'package:flutter/material.dart';
import '../../../../core/style/colors.dart';
import '../../../../core/widget/custom_text_widget_all.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.isEnable, required this.text});
  final VoidCallback? onPressed;
  final bool isEnable;
  final String text;


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
      child: MaterialButton(
          onPressed: onPressed,
        height: 65,
        minWidth: double.infinity,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        color: isEnable ? AppColors.unVisibleAuthButton : AppColors.visibleAuthButton,
        child: CustomTextWidget(
          text,
          textColor: AppColors.white,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
    );
  }
}
