import 'package:flutter/material.dart';
import '../../style/colors.dart';

class GridViewItemBulder extends StatelessWidget {
  const GridViewItemBulder({
    super.key, required this.image, required this.name,
    required this.price, required this.old_price, required this.discount, required this.favorit, this.onPressed,
  });
  final String image;
  final String name;
  final double price;
  final double old_price;
  final bool favorit;
  final int discount;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6,
        color:Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(flex: 1,),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(top: 5,start: 8),
                  child: Image(image: NetworkImage(image),height:100 ,width:100 ,),
                ),
                const SizedBox(width: 2,),
                SizedBox(
                    height: MediaQuery.sizeOf(context).height*0.12,
                    width: MediaQuery.sizeOf(context).width*0.2,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(top: 10),
                      child: Text(name,maxLines: 5,overflow: TextOverflow.ellipsis  ,),
                    ))

              ],),
            Row(
              children: [
                const Spacer(flex: 1,),
                Visibility(
                  visible: discount>0,
                  child: Container(
                      decoration: BoxDecoration(
                          color: defColor,
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(2),
                        child: Text('Disount',style: TextStyle(color: Colors.white),),
                      )),
                ),
                const Spacer(flex: 6,),
              ],
            )
            ,
            Row(
              children: [
                const Spacer(flex: 1,),
                const Text('Price:',),
                Text('${price.round()}',style: const TextStyle(color: defColor),),
                const SizedBox(
                  width: 20,
                ),
                const Spacer(flex: 1,),
                IconButton(onPressed:onPressed

                    , icon:favorit!=true? const Icon(Icons.favorite_border,color: defColor,):const Icon(Icons.favorite,color: defColor,)),
                const Spacer(flex: 1,),

              ],
            ),


            Row(
              children: [
                const Spacer(flex: 1,),

                Visibility(
                    visible: discount>0,
                    child: Text('${old_price.round()}',style: const TextStyle(color:Colors.grey,decoration: TextDecoration.lineThrough),)),
                const Spacer(flex: 6,)
              ],
            ),
            const Spacer(flex: 1,),
          ],
        ),
      );
  }
}