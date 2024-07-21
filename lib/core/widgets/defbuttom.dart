import 'package:e_commerce_app/features/presentation/login/cubit/login_cubit.dart';
import 'package:e_commerce_app/features/presentation/login/cubit/login_state.dart';
import 'package:e_commerce_app/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DefButtom extends StatelessWidget {
  const DefButtom({super.key,required this.onPressed, required this.child});
  final void Function()? onPressed;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        onPressed: onPressed,
        color: defColor,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: child,
        ),),
    );
  }
}
