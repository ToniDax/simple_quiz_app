import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "../../feature/auth/presentation/pages/enter_code.dart";
import "../../feature/auth/presentation/pages/forget_password.dart";
import "../../feature/auth/presentation/pages/recover_password.dart";
import "../../feature/auth/presentation/pages/sign_in.dart";
import "../../feature/game_multi_player/presentation/pages/quiz_multi_player.dart";
import "../../feature/game_multi_player/presentation/pages/result_multi_player.dart";
import "../../feature/game_single_player/presentation/pages/quiz_single_player.dart";
import "../../feature/game_single_player/presentation/pages/result_single_player.dart";
import "../../feature/home/presentation/pages/home_multi_player.dart";
import "../../feature/home/presentation/pages/home_page.dart";
import "../../feature/home/presentation/pages/home_single_player.dart";
import "../../feature/home/presentation/pages/lavel_map.dart";
import "../../feature/home/presentation/pages/loading.dart";
import "../../feature/on_boarding/presentation/pages/on_boarding_page.dart";
import "../../feature/splash/presentation/pages/splash_page.dart";
import "app_route_name.dart";

final class AppRouter{


  static GoRouter router = GoRouter(
      initialLocation: AppRouteName.splashPage,
      routes: <RouteBase>[
        /// splash
        GoRoute(
          path: AppRouteName.splashPage,
          builder: (BuildContext context, GoRouterState state) => const SplashPage(),
        ),

        /// onBoarding
        GoRoute(
          path: AppRouteName.onBoarding,
          builder: (BuildContext context, GoRouterState state) => const OnBoardingPage(),
        ),

        /// auth
        GoRoute(
          path: AppRouteName.signIn,
          builder: (BuildContext context, GoRouterState state) => const SignInPage(),
          routes: [
            GoRoute(
              path: AppRouteName.signUp,
              builder: (BuildContext context, GoRouterState state) =>const SignInPage(),
              routes: [
                GoRoute(
                  path: AppRouteName.enterCode,
                  builder: (BuildContext context, GoRouterState state) =>const EnterCodePage(),
                ),
              ]
            ),


            GoRoute(
              path: AppRouteName.forgotPassword,
              builder: (BuildContext context, GoRouterState state) => const ForgetPasswordPage(),
              routes: [
                GoRoute(
                  path: AppRouteName.reCoverPassword,
                  builder: (BuildContext context, GoRouterState state) => const RecoverPasswordPage(),
                ),
              ],
            ),
          ]
        ),

        /// Home
        GoRoute(
          path: AppRouteName.home,
          builder: (BuildContext context, GoRouterState state) => const HomePage(),
          routes: [
            GoRoute(
              path: AppRouteName.homeSinglePlayer,
              builder: (BuildContext context, GoRouterState state) => const SinglePlayerPage(),
              routes: [
                /// map test result
                GoRoute(
                  path: AppRouteName.map,
                  builder: (BuildContext context, GoRouterState state) =>  LevelMapPage(),
                  routes: [
                    GoRoute(
                      path: AppRouteName.loading,
                      builder: (BuildContext context, GoRouterState state) => const LoadingIndicatorPage(),
                    ),
                    GoRoute(
                      path: AppRouteName.quiz,
                      builder: (BuildContext context, GoRouterState state) => const QuizSinglePlayer(),
                    ),
                    GoRoute(
                      path: AppRouteName.result,
                      builder: (BuildContext context, GoRouterState state) => const ResultSinglePlayer(),
                    ),
                  ]
                ),
              ]
            ),
            GoRoute(
              path: AppRouteName.homeMultiPlayer,
              builder: (BuildContext context, GoRouterState state) => const MultiPayerPage(),
              routes: [
                /// map test result
                GoRoute(
                    path: AppRouteName.map,
                    builder: (BuildContext context, GoRouterState state) =>  LevelMapPage(),
                    routes: [
                      GoRoute(
                        path: AppRouteName.loading,
                        builder: (BuildContext context, GoRouterState state) => const LoadingIndicatorPage(),
                      ),
                      GoRoute(
                        path: AppRouteName.multiQuiz,
                        builder: (BuildContext context, GoRouterState state) => const QuizMultiPlayer(),
                      ),
                      GoRoute(
                        path: AppRouteName.multiResult,
                        builder: (BuildContext context, GoRouterState state) => const ResultMultiPlayer(),
                      ),
                    ]
                ),
              ]
            ),
          ]
        ),


      ]
  );
}