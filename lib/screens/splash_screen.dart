import 'package:flutter/material.dart';
import 'package:kasper_tech_task/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    // Initializing Animation for Logo in Splash Screen
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    animation = Tween(begin: -1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeIn,
      ),
    );

    animationController.forward().then((_) {
      // Adding 3 seconds delay for Splash Screen to enter Login Screen
      Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Scaffold(
            body: Stack(
              children: [
                Image.asset(
                  width: width,
                  "images/splash_img.png",
                  fit: BoxFit.fitWidth,
                ),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Transform(
                    transform: Matrix4.translationValues(
                        animation.value * width, 0, 0),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.03),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: width * 0.5,
                            spreadRadius: width * 0.5,
                          ),
                        ],
                      ),
                      child: Image.asset("images/logo.png"),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
