import 'package:e_commerce_app/features/presentation/login/views/login.dart';
import 'package:e_commerce_app/style/colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/sharedpref/shared_pref.dart';

class ShopMain extends StatelessWidget {
   ShopMain({super.key});
  static const String id='ShopMain';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defColor,
     body:Container(

         child: Center(
           child: ElevatedButton(onPressed: () {
             UserDataFromStorage.setUserIsLogin(false);
             const Duration(seconds: 5,);
             Navigator.pushReplacementNamed(context, LoginView.id);
           },
           child: Text('L O G O U T',style: Theme.of(context).textTheme.bodyLarge,)),
         ))
    );
  }
}
