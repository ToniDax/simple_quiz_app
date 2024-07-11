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

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final authController = Provider.of<AuthController>(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
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

              /// Text
              Shimmer.fromColors(
                baseColor: AppColors.black,
                highlightColor: AppColors.primaryColor,
                child: const Center(
                  child: CustomTextWidget(
                    'Welcome back!',
                    fontSize: 32.9,
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.black,
                  ),
                ),
              ),

              SizedBox(height: size.height * 0.04),

              /// TF email
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

              /// TF password
              Consumer<AuthController>(
                builder: (context, authController, child) {
                  return PasswordTextField(
                    passwordController: authController.passwordController,
                    passwordIsVisible: authController.passwordIsVisible,
                    onPressedIcon: authController.passwordChangeVisible,
                    onChanged: (text) {},
                    onSubmitted: (text) {},
                  );
                },
              ),

              /// forget password button
              ForgetPasswordButton(
                onPressed: () {
                  authController.forgetPassword(context: context);
                },
              ),

              SizedBox(height: size.height * 0.02),

              /// login button
              Consumer<AuthController>(
                builder: (context, authController, child) {
                  return CustomButton(
                    onPressed: () {
                      authController.authLogin(context: context, emailController: authController.emailController, passwordController: authController.passwordController);
                      // context.go("${AppRouteName.home}/${AppRouteName.homeSinglePlayer}/${AppRouteName.map}");
                    },
                    isEnable: authController.isEnableButton,
                    text: "Sign In",
                  );
                },
              ),

              SizedBox(height: size.height * 0.16),

              /// TextButton
              DoNotAccountAlreadyAccount(
                onPressed: () {
                  AuthController auth = AuthController();
                  auth.createAccount(context: context);
                },
                text1: 'Don\'t have an account? ',
                text2: 'Create an account',
              )

              /// Finish Page
            ],
          ),
        ),
      ),
    );
  }
}

