import 'package:flutter/material.dart';
import 'package:masquerade_page/util/custom_color.dart';
import 'package:masquerade_page/util/custom_text_style.dart';
import 'package:masquerade_page/vistas/appbar.dart';
import 'package:masquerade_page/widgets/custom_background_scaffold.dart';
import 'package:masquerade_page/widgets/custom_row_pick.dart';
import 'package:masquerade_page/widgets/custom_background_scaffold.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
      child: ListView(
        children: <Widget>[
          Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/CaronteBkgnd.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(children: <Widget>[
              CustomAppBar(),
            ]),
          ),
        ],
      ),
    ));
  }
}
