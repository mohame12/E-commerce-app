import 'package:e_commerce_app/features/presentation/shop_main_layout/views/taps/home_tap/cubits/home_tap_cubit/home_tap_cubit.dart';
import 'package:e_commerce_app/features/presentation/shop_main_layout/views/taps/home_tap/cubits/home_tap_cubit/home_tap_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../../../../style/colors.dart';

class FavoritTap extends StatelessWidget {
  const FavoritTap({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeTapCubit,HomeTapState >(
  listener: (context, state) {
    if(state is FavoritSuccessState)
    {
      Fluttertoast.showToast(
          msg: state.msg,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 6,
          backgroundColor:state.state?Colors.green:Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  },
  builder: (context, state) {
    HomeTapCubit cubit=HomeTapCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text('Favorits',style: Theme.of(context).textTheme.titleMedium,),
      ),
      body:cubit.data.isNotEmpty? ListView.builder(
        itemCount: cubit.data.length,
        itemBuilder: (context, index) => FavoritItem(cubit: cubit, index: index,),)
      :Center(
        child: Text('Add Favorits List',style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: Colors.grey.shade500,
          fontSize: 20
        ),),
      ),
    );
  },
) ;
  }
}





class FavoritItem extends StatelessWidget {
  const FavoritItem({
    super.key, required this.cubit, required this.index,
  });
  final int index;
  final HomeTapCubit cubit;
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
                child: Image(image: NetworkImage(cubit.data[index].product.image),height: 150,width: 120,),
              ),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20,),
                  Text(cubit.data[index].product.name,maxLines: 1,style: Theme.of(context).textTheme.titleMedium,),
                  SizedBox(height: 8,),
                  Expanded(child: Text(cubit.data[index].product.description,maxLines: 2,overflow: TextOverflow.ellipsis,style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),)),

                    Visibility(
                      visible: cubit.data[index].product.discount>0,
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
                      Text('${cubit.data[index].product.price.round()} LE'),
                      SizedBox(width: 15,),
                      Visibility(
                          visible: cubit.data[index].product.discount>0,
                          child: Text('${cubit.data[index].product.oldPrice.round()}',style:TextStyle(color: Colors.grey.shade600,decoration: TextDecoration.lineThrough),))

                    ],
                  ),
                SizedBox(height: 10,)

                  ],),
              ),
              IconButton(onPressed: (){
                cubit.postfavorit(id: cubit.data[index].product.id);

              },
                  icon:cubit.favorit[cubit.data[index].product.id] as bool? Icon(Icons.favorite,color: defColor,):Icon(Icons.favorite_border,color: defColor,)),
              SizedBox(width: 15,)
            ],
          ),
        ),
      ),
    );
  }
}

