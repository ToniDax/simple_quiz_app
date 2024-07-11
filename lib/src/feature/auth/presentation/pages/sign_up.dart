import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/style/colors.dart';
import '../../../../core/style/images.dart';
import '../../../../core/widget/custom_text_widget_all.dart';
import '../../controller/auth_controller.dart';
import '../widgets/custom_button.dart';
import '../widgets/email_textfield_widget.dart';
import '../widgets/password_textfield_widget.dart';
import '../widgets/text_buttons.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.white,

      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
          child: ListView(
            children: [

              /// photo
              SizedBox(
                height: size.height * 0.25,
                width: size.width,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: AppImages.questionPhoto,
                  ),
                ),
              ),

              /// text
              Shimmer.fromColors(
                baseColor: AppColors.black,
                highlightColor: AppColors.primaryColor,
                child: const Center(
                  child: CustomTextWidget(
                    'Sign Up and start solving!',
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    textColor: AppColors.black,
                  ),
                ),
              ),

              SizedBox(height: size.height * 0.04),

              /// Email TextField
              Consumer<AuthController>(
                builder: (context, authController, child) {
                  return EmailTextField(
                    emailController: authController.emailController,
                    onChanged: (text) {},
                    onSubmitted: (text) {},
                  );
                },
              ),

              SizedBox(height: size.height * 0.02),

              /// Password TextField
              Consumer<AuthController>(
                builder: (context, authController, child) {
                  return PasswordTextField(
                    passwordController: authController.passwordController,
                    passwordIsVisible: authController.passwordIsVisible,
                    onPressedIcon: authController.passwordChangeVisible,
                    onSubmitted: (text) {},
                    onChanged: (text){},
                  );
                },
              ),
              SizedBox(height: size.height * 0.02),

              /// Sign Up Button
              Consumer<AuthController>(
                builder: (context, authController, child) {
                  return CustomButton(
                    onPressed: () {
                      authController.authRegister(
                        context: context,
                        emailController: authController.emailController,
                        passwordController: authController.passwordController,
                      );
                    },
                    isEnable: authController.isEnableButton,
                    text: "Sign Up",
                  );
                },
              ),
              SizedBox(height: size.height * 0.02),

              /// TextButton
              DoNotAccountAlreadyAccount(
                onPressed: () {
                  AuthController auth = AuthController();
                  auth.alreadyHasAccount(context: context);
                },
                text1: 'Already have an account? ',
                text2: 'Sign In',
              ),

              SizedBox(height: size.height * 0.14),

              /// Text
              const Center(
                child: CustomTextWidget(
                  'By signing in with an account, you agree to QUIZ’s Terms of Service and Privacy Policy.',
                  textColor: AppColors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.center,
                ),
              ),

              /// finish page
            ],
          ),
        ),
      ),
    );
  }
}
