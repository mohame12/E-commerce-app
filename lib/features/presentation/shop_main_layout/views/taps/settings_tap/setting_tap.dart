import 'package:flutter/material.dart';

class SettingsTap extends StatelessWidget {
  const SettingsTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('M Y  S H O P E',style: Theme.of(context).textTheme.titleMedium,),
        actions: [IconButton(icon: Icon(Icons.search),onPressed: (){},)],
      ),
      body: Center(child: Text('SettingsTap',style: Theme.of(context).textTheme.bodyLarge,)),
    ) ;
  }
}
