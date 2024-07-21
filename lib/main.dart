import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/network/servecs/dioHelper.dart';
import 'package:e_commerce_app/core/sharedpref/shared_pref.dart';
import 'package:e_commerce_app/features/presentation/login/views/login.dart';
import 'package:e_commerce_app/features/presentation/register/view/register_view.dart';
import 'package:e_commerce_app/features/presentation/shop_main_layout/views/shop_main.dart';
import 'package:e_commerce_app/features/presentation/splash/views/onboarding_veiw.dart';
import 'package:e_commerce_app/features/presentation/splash/views/splash_screen.dart';
import 'package:e_commerce_app/style/my_theme.dart';
import 'package:flutter/material.dart';
import 'features/presentation/login/cubit/observer.dart';


Future<void> main()
async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  Diohelper.inint();
  UserDataFromStorage.getData();


  runApp(MyApp());

}

class MyApp extends StatelessWidget {


  const MyApp({super.key});
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute:SplashScreen.id,
      routes: {
        OnboardingVeiw.id:(context)=>OnboardingVeiw(),
        LoginView.id:(context)=>const LoginView(),
        RegisterView.id:(context)=>const RegisterView(),
        ShopMain.id:(context)=>ShopMain(),
        SplashScreen.id:(context)=>SplashScreen(),
      },
    );
  }
}
