import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../../core/routes/app_route_name.dart';
import '../../../../core/style/colors.dart';
import '../../../../core/widget/custom_text_widget_all.dart';
import '../../../../models/code_sms_token.dart';
import '../../../../models/user_model.dart';
import '../../controller/auth_pinput_controller.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_pinput.dart';

class EnterCodePage extends StatelessWidget {
  const EnterCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final pinController = Provider.of<AuthPinPutController>(context);

    final state = GoRouter.of(context).routerDelegate.currentConfiguration;
    final userModel = state.extra as UserModel;

    log(userModel.smsToken.toString());

    if (!pinController.timerStarted) {
      pinController.startTimer();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.06), // 24.0 / 400.0 ~ 0.06
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.08),
              const CustomTextWidget(
                "We have sent you a code for confirming your account",
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
                  }
              ),
              SizedBox(height: size.height * 0.02), // 16.0 / 800.0 ~ 0.02
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
                          authController.formatTime(authController.secondsRemaining),
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
                    onPressed: () {
                      context.go("${AppRouteName.signIn}/${AppRouteName.forgotPassword}/${AppRouteName.reCoverPassword}");
                    },
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
}
