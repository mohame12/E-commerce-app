import 'package:e_commerce_app/core/widgets/def_TFF.dart';
import 'package:e_commerce_app/features/presentation/login/cubit/login_cubit.dart';
import 'package:e_commerce_app/features/presentation/login/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../style/colors.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  static const String id='SearchView';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit=LoginCubit.get(context);
        return Scaffold(
          appBar: AppBar(
          ),

          body:

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                DefTff(
                    prefixIcon:Icon(Icons.search),
                    labelText: 'Search..',
                    onChanged:(s){
                      cubit.onChanges(s: s);
                    },
                    controller:cubit.controller, obscureText: false),
                if(state is SearchSuccessState)
                Expanded(
                  child: ListView.builder(
                      itemCount: cubit.model3!.data.data.length,
                    itemBuilder: (context, index) => SearchItem(cubit: cubit, index: index,)),
                ),

              ],
            ),
          ),
        );
      },
    );
  }


}


class SearchItem extends StatelessWidget {
  const SearchItem({
    super.key, required this.cubit, required this.index,
  });
  final int index;
  final LoginCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: SizedBox(
        height: 180,
        width: double.infinity,
        child: Card(
          color: Colors.white,
          elevation: 8,

          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(image: NetworkImage(cubit.model3!.data.data[index].image),height: 150,width: 120,),
              ),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20,),
                    Text(cubit.model3!.data.data[index].name,maxLines: 1,style: Theme.of(context).textTheme.titleMedium,),
                    SizedBox(height: 8,),
                    Expanded(child: Text(cubit.model3!.data.data[index].description,maxLines: 2,overflow: TextOverflow.ellipsis,style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),)),

                    Visibility(
                      visible: cubit.model3!.data.data[index].discount>0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: defColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text('Discount'),
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Text('Price: ',style: TextStyle(color: defColor),),
                        Text('${cubit.model3!.data.data[index].price.round()} LE'),
                        SizedBox(width: 15,),
                        Visibility(
                            visible: cubit.model3!.data.data[index].discount>0,
                            child: Text('${cubit.model3!.data.data[index].oldPrice.round()}',style:TextStyle(color: Colors.grey.shade600,decoration: TextDecoration.lineThrough),))

                      ],
                    ),
                    SizedBox(height: 10,)

                  ],),
              ),
              IconButton(onPressed: (){
                cubit.postfavorit(id: cubit.data[index].product.id);

              },
                  icon:cubit.favorit[cubit.data[index].product.id] ??false ? Icon(Icons.favorite,color: defColor,):Icon(Icons.favorite_border,color: defColor,)),
              SizedBox(width: 15,)
            ],
          ),
        ),
      ),
    );
  }
}