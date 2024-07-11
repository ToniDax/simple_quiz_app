import "package:flutter/material.dart";
import "package:flutter_localizations/flutter_localizations.dart";
import "package:provider/provider.dart";
import "../../feature/auth/controller/auth_controller.dart";
import "../../feature/auth/controller/auth_pinput_controller.dart";
import "../../feature/home/controller/home_controller.dart";
import "../../feature/on_boarding/controller/on_boarding_controller.dart";
import "../../feature/settings/inherited/inherited_local_notifier.dart";
import "../../feature/settings/inherited/inherited_theme_notifier.dart";
import "../../feature/settings/inherited/local_controller.dart";
import "../../feature/settings/inherited/theme_controller.dart";
import "../../feature/settings/model/language_type.dart";
import "../../feature/splash/controller/splash_controller.dart";
import "../localization/app_localizations.dart";
import "../routes/app_router.dart";

/// {@template app}
/// App widget.
/// {@endtemplate}
///


final ThemeController themeController = ThemeController();
final LocalController localController = LocalController();


@immutable
class AppMaterialContext extends StatelessWidget {

  AppMaterialContext({super.key}): builderKey = GlobalKey();

  final GlobalKey builderKey;


  @override
  Widget build(BuildContext context) => InheritedThemeNotifier(
      themeController: themeController,
      child: InheritedLocalNotifier(
        localController: localController,
        child: MultiProvider(
          providers: [
          ChangeNotifierProvider(create: (_)=> AuthPinPutController()),
          ChangeNotifierProvider(create: (_)=> AuthController()),
          ChangeNotifierProvider(create: (_)=> SplashController()),
          ChangeNotifierProvider(create: (_)=> OnBoardingController()),
          ChangeNotifierProvider(create: (_)=> HomeController()),
          ],
          child: Builder(
              builder: (BuildContext context) {
                return MaterialApp.router(
                  onGenerateTitle: (BuildContext context) => "PDP Project",
                  routerConfig: AppRouter.router,
                  restorationScopeId: "material_app",
                  debugShowCheckedModeBanner: false,
                  locale: InheritedLocalNotifier.maybeOf(context)?.appLocal ?? const Locale("ru", "RU"),
                  supportedLocales: const <Locale>[Locale("uz", "UZ"), Locale("ru", "RU"),  Locale("en", "EN")],
                  localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  localeResolutionCallback: (final Locale? deviceLocale, final Iterable<Locale> supportedLocales) {
                    final LocalController local = InheritedLocalNotifier.maybeOf(context, listen: false)!;
                    for (final Locale locale in supportedLocales) {
                      if (locale.languageCode == local.appLocal.languageCode) {
                        return local.appLocal;
                      }
                    }
                    for (final Locale locale in supportedLocales) {
                      if (deviceLocale == locale) {
                        return deviceLocale;
                      }
                    }
                    local.changeLocal(LanguageType.ru);
                    return const Locale("ru", "RU");
                  },
                  theme: InheritedThemeNotifier.maybeOf(context)?.theme?? themeController.theme,
                  builder: (BuildContext context, Widget? child) => MediaQuery.withNoTextScaling(
                    key: builderKey,
                    child: child ?? const SizedBox.shrink(),
                  ),
                );
              },
          ),
        ),
      ),
  );
}
