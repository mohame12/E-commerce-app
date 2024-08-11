import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/network/servecs/dioHelper.dart';
import 'package:e_commerce_app/core/sharedpref/shared_pref.dart';
import 'package:e_commerce_app/features/presentation/login/cubit/login_cubit.dart';
import 'package:e_commerce_app/features/presentation/login/views/login.dart';
import 'package:e_commerce_app/features/presentation/register/view/register_view.dart';
import 'package:e_commerce_app/features/presentation/shop_main_layout/views/main_screen/search/search_view/search_view.dart';
import 'package:e_commerce_app/features/presentation/shop_main_layout/views/main_screen/shop_main.dart';
import 'package:e_commerce_app/features/presentation/shop_main_layout/views/taps/categors_tap/cubits/category_tap_cubit.dart';
import 'package:e_commerce_app/features/presentation/splash/views/onboarding_veiw.dart';
import 'package:e_commerce_app/features/presentation/splash/views/splash_screen.dart';
import 'package:e_commerce_app/style/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/presentation/login/cubit/observer.dart';


Future<void> main()
async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  Diohelper.inint();
  UserDataFromStorage.getData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CategoryTapCubit()..getCategoryData(),),
        BlocProvider(create: (context) => LoginCubit()..getHomeTapItem(token: UserDataFromStorage.userId)..getProfile(token: UserDataFromStorage.userId)..getfavorit(token: UserDataFromStorage.userId),)
      ],
      child: MaterialApp(

        theme: lightTheme,
        debugShowCheckedModeBanner: false,
        initialRoute:SplashScreen.id,
        routes: {
          OnboardingVeiw.id:(context)=>OnboardingVeiw(),
          LoginView.id:(context)=>const LoginView(),
          RegisterView.id:(context)=>const RegisterView(),
          ShopMain.id:(context)=> const ShopMain(),
          SplashScreen.id:(context)=>const SplashScreen(),
          SearchView.id:(context)=>const SearchView(),
        },
      ),
    );
  }
}
