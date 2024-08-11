import 'package:e_commerce_app/core/sharedpref/shared_pref.dart';
import 'package:e_commerce_app/core/widgets/defbuttom.dart';
import 'package:e_commerce_app/features/presentation/login/cubit/login_cubit.dart';
import 'package:e_commerce_app/features/presentation/login/cubit/login_state.dart';
import 'package:e_commerce_app/features/presentation/login/views/login.dart';
import 'package:e_commerce_app/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SettingsTap extends StatelessWidget {
  const SettingsTap({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
  listener: (context, state) {
    if(state is ProfileSuccessUpdateDataState)
      {
        if(state.model.status) {
          Fluttertoast.showToast(
              msg: state.model.message,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 6,
              backgroundColor: Colors.green ,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }else
          {
            Fluttertoast.showToast(
                msg: state.model.message,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 6,
                backgroundColor: Colors.red ,
                textColor: Colors.white,
                fontSize: 16.0
            );}
      }

  },
  builder: (context, state) {
    LoginCubit cubit=LoginCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Text('Profile',style: Theme.of(context).textTheme.titleMedium,),
      ),
      body:cubit.profileData!=null?
        Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Stack(
              children:[
                CircleAvatar(
                radius:71 ,
                backgroundColor: Colors.grey.shade300,
                child: CircleAvatar(
                  radius: 70,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(70),
                      child: Image(image:AssetImage('assets/images/WhatsApp Image 2024-06-22 at 2.57.29 PM.jpeg'),)),

                ),
              ),
                Positioned(
                  left: 100,
                  bottom: 10,
                  child: CircleAvatar(
                    radius: 18,
                      backgroundColor:defColor,
                      child: IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt_outlined,color: Colors.white,),iconSize: 18,)),
                )
              ]
            ),


            SizedBox(height: 50,),

            ProfileEditing(
              onTap: (){
                cubit.onTap(context: context);
              },
              name:cubit.dataupdated['name']

              , icon: Icons.person, label: 'Name',),
            Hint(hint: 'click to editing your username',),

            SizedBox(height: 50,),
            ProfileEditing(name:cubit.dataupdated['phone'], icon: Icons.phone, label: 'Phone',),
            Hint(hint: 'click to editing your Phone',),
           
            SizedBox(height: 40,),

            DefButtom(onPressed: (){
              UserDataFromStorage.setUserIsLogin(false);
              UserDataFromStorage.removeDataFromStorage(UserDataFromStorage.userId);
              cubit.logout();
              Navigator.pushReplacementNamed(context, LoginView.id);
            }, child: Text('L O G O U T')),



          ],
        ),
      ):Center(
          child: LoadingAnimationWidget.staggeredDotsWave(
              color: defColor, size: 20)),
    );
  },
) ;
  }
}





class Hint extends StatelessWidget {
  const Hint({
    super.key, required this.hint,
  });
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 40),
          child: Text(hint,style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade500),),
        ),
      ],
    );
  }
}

class ProfileEditing extends StatelessWidget {
  const ProfileEditing({
    super.key, required this.name, required this.icon, required this.label, this.onTap,
  });
  final String name;
  final IconData icon;
  final String label;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width:MediaQuery.sizeOf(context).width ,
        child: Row(
          children: [
            Icon(icon,color: defColor,),
            SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(label,style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 12,
                color: Colors.grey.shade500
              ),),
                SizedBox(height: 8,),
              Text(name,style: Theme.of(context).textTheme.bodyLarge,),//
              ],
            ),
            Spacer(flex: 1,),
            Icon(Icons.edit,color: defColor,)
          ],
        ),
      ),
    );
  }
}
