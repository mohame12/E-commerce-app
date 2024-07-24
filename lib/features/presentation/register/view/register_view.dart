import 'package:e_commerce_app/core/widgets/def_TFF.dart';
import 'package:e_commerce_app/core/widgets/defbuttom.dart';
import 'package:e_commerce_app/features/presentation/login/views/login.dart';
import 'package:e_commerce_app/features/presentation/register/cubit/register_cubit.dart';
import 'package:e_commerce_app/features/presentation/register/cubit/register_state.dart';
import 'package:e_commerce_app/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress_indicators/progress_indicators.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  static String id = 'RegisterView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if(state is RegisterSuccessDataState)
            {
              if(state.status)
                {
                  Fluttertoast.showToast(
                      msg: state.message,
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 5,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                  Navigator.pushNamed(context, LoginView.id);
                }
              else
                {
                  Fluttertoast.showToast(
                      msg: state.message,
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 5,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                }
            }
        },
        builder: (context, state) {
          RegisterCubit cubit = RegisterCubit.get(context);
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    autovalidateMode: cubit.autovalidateMode,
                    key: cubit.registerform,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'REGISTER',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontSize: 35),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        DefTff(
                          controller: cubit.namecontroller,
                          obscureText: false,
                          labelText: 'Name',
                          keyboardType: TextInputType.name,
                          validator: (val) {
                            if (val?.isEmpty ?? true) {
                              return 'The Name Is Too Short';
                            }
                            else
                              {
                                return null;
                              }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        DefTff(
                          controller: cubit.emailcontroller,
                          obscureText: false,
                          labelText: 'Email',
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) {
                            if (val?.isEmpty ?? true) {
                              return 'The Email Is Too Short';
                            }
                            else
                            {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        DefTff(
                          controller: cubit.passwordcontroller,
                          obscureText: cubit.passvisiable,
                          labelText: 'Password',
                          suffixIcon: IconButton(
                              onPressed: cubit.isvisiable,
                              icon: Visibility(
                                  visible: cubit.visiable,
                                  child: Icon(cubit.icon))),
                          validator: (val) {
                            if (val?.isEmpty ?? true) {
                              return 'The Password Is Too Short';
                            }
                            else
                            {
                              return null;
                            }
                          },
                          onChanged: cubit.onchange,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        DefTff(
                          controller: cubit.phonecontroller,
                          obscureText: false,
                          labelText: 'Phone',
                          keyboardType: TextInputType.phone,
                          validator: (val) {
                            if (val?.isEmpty ?? true) {
                              return 'The Phone Is Too Short';
                            }
                            else
                            {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 45,
                        ),
                        DefButtom(
                            onPressed: () {
                              if (cubit.registerform.currentState!.validate()) {
                                cubit.registerAccount(
                                    name: cubit.namecontroller.text,
                                    email: cubit.emailcontroller.text,
                                    password: cubit.passwordcontroller.text,
                                    phone: cubit.phonecontroller.text);
                              } else {
                                cubit.autovalidateMode =
                                    AutovalidateMode.onUserInteraction;
                              }
                            },
                            child:state is RegisterLoadingdataState?JumpingDotsProgressIndicator(color: Colors.white,fontSize: 15,): Text(
                              'R E G I S T E R',
                              style: Theme.of(context).textTheme.bodyMedium,
                            )),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Did You Have An Account..?',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, LoginView.id);
                                },
                                child: Text(
                                  'LOGIN',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(color: defColor),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
