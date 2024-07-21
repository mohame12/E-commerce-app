import 'package:e_commerce_app/features/presentation/splash/model/page_view_model.dart';
import 'package:flutter/material.dart';

class OnboardItembuilderWidget extends StatelessWidget {
 const OnboardItembuilderWidget({super.key, required this.model});
  final PageViewModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Image(image: AssetImage(model.image))),

        Padding(
          padding: const EdgeInsetsDirectional.only(bottom: 50),
          child: Text('On Boarding ${model.title}',style: const TextStyle(fontWeight: FontWeight.bold,fontSize:25 ),),
        ),
      ],
    );
  }
}
