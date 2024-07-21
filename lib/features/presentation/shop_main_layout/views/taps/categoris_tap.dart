import 'package:flutter/material.dart';

class CategorisTap extends StatelessWidget {
  const CategorisTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('M Y  S H O P E',style: Theme.of(context).textTheme.titleMedium,),
        actions: [IconButton(icon: Icon(Icons.search),onPressed: (){},)],
      ),
      body: Center(child: Text('CategoresTap',style: Theme.of(context).textTheme.bodyLarge,)),
    ) ;
  }
}
