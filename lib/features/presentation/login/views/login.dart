import 'package:e_commerce_app/core/sharedpref/shared_pref.dart';
import 'package:e_commerce_app/core/widgets/def_TFF.dart';
import 'package:e_commerce_app/core/widgets/defbuttom.dart';
import 'package:e_commerce_app/features/presentation/login/cubit/login_cubit.dart';
import 'package:e_commerce_app/features/presentation/login/cubit/login_state.dart';
import 'package:e_commerce_app/features/presentation/register/view/register_view.dart';
import 'package:e_commerce_app/features/presentation/shop_main_layout/views/shop_main.dart';
import 'package:e_commerce_app/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress_indicators/progress_indicators.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String id = 'LoginView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => LoginCubit(),
  child: BlocConsumer<LoginCubit,LoginState>(
  listener: (context, state)  {
    if(state is LoginSuccessDataState)
      {
        if(state.state)
          {
            UserDataFromStorage.setUserIsLogin(true);
              Fluttertoast.showToast(
                  msg: state.message,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0

              );
              Navigator.pushReplacementNamed(context, ShopMain.id);



          }
        else
          {
            Fluttertoast.showToast(
                msg: state.message,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 6,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
          }
      }
  },
  builder: (context, state) {
    LoginCubit cubit=LoginCubit.get(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              autovalidateMode: cubit.autovalidateMode,
              key: cubit.form,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const Spacer(
                  //   flex: 1,
                  // ),
                  Text(
                    'LOGIN',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 35,
                        ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    'login now to browse our hot offers',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  DefTff(
                    controller: cubit.emailcontroller,
                    labelText: 'Email Address',
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    prefixIcon: Icon(Icons.email_outlined),
                    validator: (val) {
                      if(val?.isEmpty ??true)
                        {
                          return'The Email Is Too Short';
                        }
                      else
                      {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  DefTff(
                    onFieldSubmitted: (val){
                      if(cubit.form.currentState!.validate())
                      {
                        cubit.Login(email: cubit.emailcontroller.text, password: cubit.passcontroller.text);
                      }
                      else
                      {
                        cubit.autovalidateMode=AutovalidateMode.onUserInteraction;
                      }
                    },
                    controller: cubit.passcontroller,
                    prefixIcon: Icon(Icons.lock_open_outlined),
                    suffixIcon: IconButton(icon:Visibility(visible:cubit.visiable,child: Icon(cubit.icon)),onPressed: cubit.isvisiable,),
                    labelText: 'Password',
                    keyboardType: TextInputType.text,
                    obscureText: cubit.passvisiable,
                    onChanged:cubit.onchange,
                    validator: (val) {
                      if(val?.isEmpty??true)
                        {
                          return'The Password Is Too Short';
                        }
                      else
                      {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  DefButtom(onPressed: (){
                    if(cubit.form.currentState!.validate())
                      {
                        cubit.Login(email: cubit.emailcontroller.text, password: cubit.passcontroller.text);
                      }
                    else
                      {
                        cubit.autovalidateMode=AutovalidateMode.onUserInteraction;
                      }
                  }, child:state is LoginLoadingDataState?JumpingDotsProgressIndicator(color: Colors.white,fontSize: 15,):Text('L O G I N',style :Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 15)) ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don`t have an account?',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, RegisterView.id);
                          },
                          child: Text(
                            'REGISTER',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: defColor),
                          ))
                    ],
                  ),
                  // const Spacer(
                  //   flex: 1,
                  // ),
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
