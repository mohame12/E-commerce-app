import 'package:e_commerce_app/core/sharedpref/shared_pref.dart';
import 'package:e_commerce_app/features/presentation/login/views/login.dart';
import 'package:e_commerce_app/features/presentation/shop_main_layout/views/main_screen/shop_main.dart';
import 'package:e_commerce_app/features/presentation/splash/views/onboarding_veiw.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String id='SplahScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    UserDataFromStorage.getData();
    timeOut();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(color: Colors.white),
        child: Image(image: AssetImage('assets/images/33.png')),
      ),
    );
  }



  void timeOut() {
    Future.delayed(const Duration(seconds: 2), () async {
      if (UserDataFromStorage.onBoardingIsOpen == true) {
        if (UserDataFromStorage.userIsLogin == true) {
          Navigator.pushReplacementNamed(context, ShopMain.id);
        } else {
          Navigator.pushReplacementNamed(context, LoginView.id);
        }
      } else {
        Navigator.pushReplacementNamed(context, OnboardingVeiw.id);
      }
    });
  }
}
