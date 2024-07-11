import 'package:flutter/material.dart';
import 'package:simple_quiz_app/src/feature/home/presentation/widgets/slidable_lavel_widget.dart';

import '../../../../core/style/colors.dart';

class UserInfoLineWidget extends StatelessWidget {
  const UserInfoLineWidget({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    return     Row(
      children: [
        SizedBox(width: size.width * 0.045),

        const CircleAvatar(
          radius: 32,
          backgroundColor: AppColors.white,
          child: CircleAvatar(
            backgroundColor: AppColors.gradientSplash1,
            radius: 28,
          ),
        ),

        SizedBox(width: size.width * 0.045),

        const SliderWidget(),

        Container(
          width: 38,
          height: 38,
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Center(
            child: Container(
              width: 34,
              height: 34,
              decoration: const BoxDecoration(
                color: AppColors.orange,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: const Center(
                child: Text(
                  "12",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                    color: AppColors.white,
                  ),
                ), //bu yerga controllerdan level yozilishi kerak
              ),
            ),
          ),
        ),
        SizedBox(
          width: size.width * 0.045,
        ),
        const SizedBox(
          height: 50,
          width: 50,
          child: Column(
            children: [
              Text(
                'Points',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                  color: AppColors.white,
                ),
              ),
              Spacer(),
              Text(
                '231',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Poppins',
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Row(
//   children: [
//     SizedBox(width: size.width * 0.045),
//
//     const CircleAvatar(
//       radius: 32,
//       backgroundColor: AppColors.white,
//       child: CircleAvatar(
//         backgroundColor: AppColors.gradientSplash1,
//         radius: 28,
//       ),
//     ),
//
//     SizedBox(width: size.width * 0.045),
//
//     const SliderWidget(),
//
//     Container(
//       width: 38,
//       height: 38,
//       decoration: const BoxDecoration(
//         color: AppColors.white,
//         borderRadius: BorderRadius.all(Radius.circular(12)),
//       ),
//       child: Center(
//         child: Container(
//           width: 34,
//           height: 34,
//           decoration: const BoxDecoration(
//             color: AppColors.orange,
//             borderRadius: BorderRadius.all(Radius.circular(12)),
//           ),
//           child: const Center(
//             child: Text(
//               "12",
//               style: TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.w700,
//                 fontFamily: 'Poppins',
//                 color: AppColors.white,
//               ),
//             ), //bu yerga controllerdan level yozilishi kerak
//           ),
//         ),
//       ),
//     ),
//     SizedBox(
//       width: size.width * 0.045,
//     ),
//     const SizedBox(
//       height: 50,
//       width: 50,
//       child: Column(
//         children: [
//           Text(
//             'Points',
//             style: TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w400,
//               fontFamily: 'Poppins',
//               color: AppColors.white,
//             ),
//           ),
//           Spacer(),
//           Text(
//             '231',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.w700,
//               fontFamily: 'Poppins',
//               color: AppColors.white,
//             ),
//           ),
//         ],
//       ),
//     ),
//   ],
// ),