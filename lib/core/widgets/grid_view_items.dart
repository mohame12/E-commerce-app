import 'package:flutter/material.dart';
import '../../style/colors.dart';

class GridViewItemBulder extends StatelessWidget {
  const GridViewItemBulder({
    super.key, required this.image, required this.name,
    required this.price, required this.old_price, required this.discount, required this.favorit,
  });
  final String image;
  final String name;
  final double price;
  final double old_price;
  final bool favorit;
  final int discount;
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6,
        color:Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(flex: 1,),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(top: 5,start: 8),
                  child: Image(image: NetworkImage(image),height:100 ,width:100 ,),
                ),
                SizedBox(width: 2,),
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
                Spacer(flex: 1,),
                Visibility(
                  visible: discount>0,
                  child: Container(
                      decoration: BoxDecoration(
                          color: defColor,
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Text('Disount',style: TextStyle(color: Colors.white),),
                      )),
                ),
                Spacer(flex: 6,),
              ],
            )
            ,
            Row(
              children: [
                Spacer(flex: 1,),
                Text('Price:',),
                Text('${price.round()}',style: TextStyle(color: defColor),),
                SizedBox(
                  width: 20,
                ),
                Spacer(flex: 1,),
                IconButton(onPressed: (){

                }, icon:favorit!=true? Icon(Icons.favorite_border,color: defColor,):Icon(Icons.favorite,color: defColor,)),
                Spacer(flex: 1,),

              ],
            ),


            Row(
              children: [
                Spacer(flex: 1,),

                Visibility(
                    visible: discount>0,
                    child: Text('${old_price.round()}',style: TextStyle(color:Colors.grey,decoration: TextDecoration.lineThrough),)),
                Spacer(flex: 6,)
              ],
            ),
            Spacer(flex: 1,),
          ],
        ),
      );
  }
}