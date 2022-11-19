import 'package:flutter/material.dart';
import 'package:masquerade_page/util/custom_color.dart';
import 'package:masquerade_page/util/custom_text_style.dart';
import 'package:masquerade_page/vistas/appbar.dart';
import 'package:masquerade_page/widgets/custom_background_scaffold.dart';
import 'package:masquerade_page/widgets/custom_row_pick.dart';

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
              //No funcionan las sombras por dentro xd
              boxShadow: [
                BoxShadow(
                  color: CustomColors.black,
                  offset: Offset(-100, -100),
                  spreadRadius: -10.0,
                  blurRadius: 12.0,
                )
              ],
              image: DecorationImage(
                image: AssetImage("assets/images/CaronteBkgnd.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(children: const <Widget>[
              CustomAppBar(),
            ]),
          ),
          BaseLayout(
            imageBackground: "assets/images/TownBkgnd.png",
            myChild: Center(
              child: Row(children: <Widget>[
                const Spacer(flex: 1),
                Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    generarTextoPersonalizado(
                        myText: "Sinópsis",
                        textStyle: CustomTextStyles.subtitle),
                    const SizedBox(
                      height: 20,
                    ),
                    generarTextoPersonalizado(
                        myText:
                            "Lo despierta en un tren sin recuerdo alguno \nsobre quien es, en su rostro una máscara que no \nse puede quitar. El conductor del tren, Caronte, \nlo lleva a un lugar con la promesa de que allá \npuede encontrar quien es. \n\nLo se dedica a explorar el pueblo de Liberio en \nbusca de respuestas; extrañamente toda persona \ncon la que se encuentra tiene también una \nmáscara y aparentan estar sumamente desorientados. \nTras pasar su primer día, Lo se da cuenta que \naquellas personas olvidan con el paso de la \nnoche todo lo que había sucedido el día anterior, y \nes aquí donde comenzará su travesía en \ndescubrir la oscura realidad detrás de este \nmisterioso pueblo.",
                        textStyle: CustomTextStyles.content)
                  ],
                ),
                const Spacer(flex: 2),
                Image.asset(
                  "assets/images/IMG_4093.PNG",
                  width: 500,
                ),
                const Spacer(flex: 1),
              ]),
            ),
          ),
          //Vista de Trailer
          BaseLayout(
            imageBackground: "assets/images/BellBkgnd.png",
            myChild: Center(
                child: Column(children: <Widget>[
              generarTextoPersonalizado(
                  myText: "Tráiler", textStyle: CustomTextStyles.subtitle),
            ])),
          ),
          BaseLayout(
            imageBackground: "assets/images/TownBkgnd.png",
            myChild: Column(children: const <Widget>[]),
          ),
        ],
      ),
    ));
  }
}

Widget generarTextoPersonalizado(
    {required String myText, required TextStyle textStyle}) {
  return Text(myText, style: textStyle);
}
