import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BaseLayout extends StatelessWidget {
  const BaseLayout(
      {super.key, required this.imageBackground, required this.myChild});
  final String imageBackground;
  final Widget? myChild;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: myChild,
    );
  }
}
