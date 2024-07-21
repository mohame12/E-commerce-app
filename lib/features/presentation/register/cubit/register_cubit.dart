
import 'package:e_commerce_app/core/network/servecs/dioHelper.dart';
import 'package:e_commerce_app/features/presentation/register/cubit/register_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/register_data_model.dart';

class RegisterCubit extends Cubit<RegisterState>
{
  RegisterCubit():super(RegisterInitialDataState());
  static RegisterCubit get(context)=>BlocProvider.of(context);
  TextEditingController namecontroller=TextEditingController();
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  TextEditingController phonecontroller=TextEditingController();
  AutovalidateMode autovalidateMode=AutovalidateMode.disabled;
  GlobalKey<FormState>registerform=GlobalKey();
  bool passvisiable=true;
  bool visiable=false;
  IconData icon=Icons.visibility_off;




  void isvisiable()
  {
    passvisiable=!passvisiable;
    passvisiable?icon=Icons.visibility_off:icon=Icons.visibility;
    emit(RegisterVisiableState());
  }


  void onchange(String val)
  {
    if(val.isNotEmpty)
    {
      visiable=true;
      emit(RegisterOnchangeState());
    }else
    {
      visiable=false;
      emit(RegisterOnchangeState());
    }
  }
  
  void registerAccount({required String name,required String email,required String password,required String phone})
  {
    emit(RegisterLoadingdataState());
    Diohelper.postData(url: 'register', data:
    {
      'name':name,
      'email':email,
      'password':password,
      'phone':phone,
    }).then((val){
      RegisterDataModel dataModel=RegisterDataModel.fromJson(val.data);
      emit(RegisterSuccessDataState(message: dataModel.message, status:dataModel.status  ));
    }).catchError((e){
      print(e.toString());
      emit(RegisterfailerDataState(e: e.toString()));
    });
  }

}