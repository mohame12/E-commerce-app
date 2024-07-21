import 'package:e_commerce_app/style/colors.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/nav_Bar_item_selected.dart';

class HomeTap extends StatelessWidget {
  const HomeTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('M Y  S H O P E',style: Theme.of(context).textTheme.titleMedium,),
        actions: [IconButton(icon: Icon(Icons.search),onPressed: (){},)],
      ),
      body: Center(child: NavSelectedIcon(icon: Icons.home, color: defColor,)),
    ) ;
  }
}


