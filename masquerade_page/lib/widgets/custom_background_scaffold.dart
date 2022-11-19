import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BaseLayout extends StatelessWidget {
  const BaseLayout({super.key, required this.imageBackground});
  final Image imageBackground;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image:
              DecorationImage(image: imageBackground.image, fit: BoxFit.cover),
        ),
        child: null /* add child content here */,
      ),
    );
  }
}
