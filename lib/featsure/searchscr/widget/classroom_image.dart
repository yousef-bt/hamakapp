import 'package:flutter/material.dart';

class ClassroomImage extends StatelessWidget {
  ClassroomImage({required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => Navigator.pop(context),
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(18)),
            child: Image.asset(image)),
      ),
    );
  }
}
