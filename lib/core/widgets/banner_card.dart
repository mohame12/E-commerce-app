import 'package:flutter/material.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({
    super.key, required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 200,
        width: double.infinity,
        child: Card(
          elevation: 5,
          child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Image(image: NetworkImage(image),fit: BoxFit.fill,)),
        ),
      ),
    );
  }
}