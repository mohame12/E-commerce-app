
import 'package:e_commerce_app/core/network/servecs/dioHelper.dart';
import 'package:e_commerce_app/features/presentation/login/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/LoginDataModel.dart';

class LoginCubit extends Cubit<LoginState>
{
  LoginCubit():super(LoginInitalState());
  static LoginCubit get(context)=>BlocProvider.of(context);
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passcontroller=TextEditingController();
  GlobalKey<FormState>form=GlobalKey();
  AutovalidateMode autovalidateMode=AutovalidateMode.disabled;
  bool passvisiable=true;
  bool visiable=false;
  IconData icon=Icons.visibility_off;



  void Login({required String email,required String password})
  {
    emit(LoginLoadingDataState());

    Diohelper.postData(url: 'login', data:{'email':email,
    'password':password} ).then((val)
    {
      LoginDataModel loginDataModel=LoginDataModel.fromJson(val.data);
      emit(LoginSuccessDataState(message: loginDataModel.message, state: loginDataModel.status));
    }).catchError((e){
      print(e.toString());
      emit(LoginFaileurDataState(e: e.toString()));
    });
  }


  //
  // void validatorOnPressed()
  // {
  //
  //   if(form.currentState!.validate())
  //   {
  //     Login(email: emailcontroller.text, password:passcontroller.text );
  //      Duration(seconds: 20);
  //
  //   }
  //   else
  //   {
  //     autovalidateMode=AutovalidateMode.onUserInteraction;
  //   }
  //   emit(LoginValidateState());
  // }

  void isvisiable()
  {
    passvisiable=!passvisiable;
    passvisiable?icon=Icons.visibility_off:icon=Icons.visibility;
    emit(LoginVisiableState());
  }


  void onchange(String val)
  {
    if(val.isNotEmpty)
      {
        visiable=true;
        emit(LoginOnchangeState());
      }else
        {
          visiable=false;
          emit(LoginOnchangeState());
        }
  }
}
