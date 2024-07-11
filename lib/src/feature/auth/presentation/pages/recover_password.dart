import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../../core/routes/app_route_name.dart';
import '../../../../core/style/colors.dart';
import '../../../../core/widget/custom_text_widget_all.dart';
import '../../controller/auth_controller.dart';
import '../widgets/confirm_password_textfield.dart';
import '../widgets/custom_button.dart';
import '../widgets/password_textfield_widget.dart';

class RecoverPasswordPage extends StatelessWidget {
  const RecoverPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.1),
              const CustomTextWidget(
                'Enter your new password',
                fontSize: 20, fontWeight: FontWeight.bold, textColor: AppColors.black,
              ),
              const Spacer(),
              Consumer<AuthController>(
                builder: (context, controller, child) {
                  return PasswordTextField(
                    passwordController: controller.passwordController,
                    passwordIsVisible: controller.passwordIsVisible,
                    onPressedIcon: () {
                      controller.passwordChangeVisible();
                    },
                  );
                },
              ),
              SizedBox(height: size.height * 0.02),
              Consumer<AuthController>(
                builder: (context, controller, child) {
                  return ConfirmPasswordTextField(
                    passwordController: controller.confirmPasswordController,
                    passwordIsVisible: controller.confirmPasswordIsVisible,
                    onPressedIcon: () {
                      controller.confirmPasswordChangeVisible();
                    },
                    onChanged: (value) {
                      if (controller.passwordController.text.isNotEmpty && controller.confirmPasswordController.text.isNotEmpty) {
                        controller.isEnableButton = false;
                      }
                    },
                  );
                },
              ),
              const Spacer(),
              Consumer<AuthController>(
                builder: (context, controller, child) {
                  return CustomButton(
                    onPressed: () {
                      if (!controller.isEnableButton) {
                        controller.passwordController.clear();
                        controller.confirmPasswordController.clear();
                        context.go(AppRouteName.signIn);
                      }
                    },
                    isEnable: controller.isEnableButton,
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
