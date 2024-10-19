import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:test_project/views/onboarding/on_boarding_view.dart';
import '../../ui/themes/font.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 1150,
      splash: Column(
        children: [
          Lottie.asset("assets/images/lottie/lottie.json", height: 200),
          const Text(
            "Bekia",
            style: TextStyle(
              fontFamily: Font.semiBold,
              fontSize: 50,
            ),
          ),
        ],
      ),
      nextScreen: OnboardingPage(),
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Theme.of(context).primaryColor,
      splashIconSize: 275,
    );
  }
}
