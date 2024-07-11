
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../../controller/auth_controller.dart';

class CustomPinPut extends StatelessWidget {
  const CustomPinPut({
    super.key,
    required this.onCompleted,
  });

  final void Function(String pin) onCompleted;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Pinput(
        length: 4,
        showCursor: true,
        keyboardType: TextInputType.number,
        defaultPinTheme: PinTheme(
          width: 56,  // Customize width
          height: 56, // Customize height
          margin: const EdgeInsets.symmetric(horizontal: 8), // Customize margin
          padding: const EdgeInsets.all(8), // Customize padding
          textStyle: const TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black),
          ),
          constraints: const BoxConstraints(
            minWidth: 40,
            minHeight: 40,
          ),
        ),
        onCompleted: onCompleted,
      ),
    );
  }
}