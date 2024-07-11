import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/style/colors.dart';
import '../../controller/home_controller.dart';
import 'home_multi_player.dart';
import 'home_single_player.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.white,
      body: Consumer<HomeController>(
        builder: (context, controller, child) {
          return PageView(
            controller: controller.pageController,
            physics:const NeverScrollableScrollPhysics(),
            children: const [
              SinglePlayerPage(),
              MultiPayerPage(),
            ],
          );
        }
      ),
    );
  }
}





