import 'package:flutter/material.dart';
import '../../../../core/style/colors.dart';
import '../widgets/level_map_begin_end_item.dart';
import '../widgets/level_map_every_gift_item.dart';
import '../widgets/level_map_single_item.dart';

/// bu yerga bool kerak agar true bosa SinglePlayer else Multiplayer

class LevelMapPage extends StatelessWidget {
  LevelMapPage({super.key});

  bool isSinglePlayer = false;

  @override
  Widget build(BuildContext context) {
    const int lastIndex = 25;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        color: AppColors.primaryColor,
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60.0),
          child: Center(
            child: ListView.builder(
              reverse: true,
              itemCount: lastIndex + 1,
              itemBuilder: (context, index) {
                if ((index + 1) % 10 == 0) {
                  return const RightGift();
                } else if ((index + 1) % 5 == 0 && (index + 1) % 10 != 0) {
                  return const LeftGift();
                } else if (index == 0) {
                  return const BeginEnd();
                } else if (index == lastIndex) {
                  return const BeginEnd();
                } else {
                  return const SingleItem(isOpen: true);
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}




