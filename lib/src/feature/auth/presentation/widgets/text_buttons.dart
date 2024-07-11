import 'package:flutter/material.dart';

import '../../../../core/style/colors.dart';
import '../../../../core/widget/custom_text_widget_all.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({super.key, this.onPressed});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: onPressed,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0),
            child: CustomTextWidget(
              'Forgot password?',
              textColor: AppColors.primaryColor,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}



class DoNotAccountAlreadyAccount extends StatelessWidget {
  const DoNotAccountAlreadyAccount({super.key, this.onPressed, required this.text1, required this.text2});

  final VoidCallback? onPressed;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onPressed,
        child: RichText(
          text: TextSpan(
            children: [
              WidgetSpan(
                child: CustomTextWidget(
                  text1,
                  textColor: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              WidgetSpan(
                child: CustomTextWidget(
                  text2,
                  textColor: Colors.purple,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

