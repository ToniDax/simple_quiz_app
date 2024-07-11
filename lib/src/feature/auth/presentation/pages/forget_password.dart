import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../../core/routes/app_route_name.dart';
import '../../../../core/style/colors.dart';
import '../../../../core/widget/custom_text_widget_all.dart';
import '../../controller/auth_pinput_controller.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_pinput.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final authController = Provider.of<AuthPinPutController>(context, listen: false);
    authController.resendCode();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.06),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.08),
              const CustomTextWidget(
                "We have sent you a code\nto your email, for recovering your password",
                textAlign: TextAlign.center,
                textColor: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              const Spacer(),
              Consumer<AuthPinPutController>(
                builder: (context, controller, child) {
                  return CustomPinPut(
                    onCompleted: (pin) {
                      controller.pinButtonEnable = false;
                      controller.verifyCode(pin);
                    },
                  );
                },
              ),
              SizedBox(height: size.height * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Consumer<AuthPinPutController>(
                      builder: (context, authController, child) {
                        return authController.isResendVisible
                            ? GestureDetector(
                          onTap: authController.resendCode,
                          child: const CustomTextWidget(
                            "Resend code",
                            textColor: AppColors.primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                            : CustomTextWidget(
                          _formatTime(authController.secondsRemaining),
                          textColor: AppColors.primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.04),
              const Spacer(),
              Consumer<AuthPinPutController>(
                builder: (context, authController, child) {
                  return CustomButton(
                    onPressed: !authController.pinButtonEnable
                        ? () {
                      context.go("${AppRouteName.signIn}/${AppRouteName.forgotPassword}/${AppRouteName.reCoverPassword}");
                    }
                        : null,
                    isEnable: authController.pinButtonEnable,
                    text: "Continue",
                  );
                },
              ),
              SizedBox(height: size.height * 0.04),

            ],
          ),
        ),
      ),
    );
  }

  String _formatTime(int seconds) {
    final int minutes = seconds ~/ 60;
    final int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }
}
