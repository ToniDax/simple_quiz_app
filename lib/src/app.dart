import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "core/widget/app_material_context.dart";

class App extends StatelessWidget {
  const App({super.key});

  static void run() => runApp(const App());

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) => AppMaterialContext(),
      );
}
///
/// Multi controllerga o'rash kere ????
///