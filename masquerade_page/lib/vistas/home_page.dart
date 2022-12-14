import 'package:flutter/material.dart';
import 'package:masquerade_page/util/custom_color.dart';
import 'package:masquerade_page/util/custom_text_style.dart';
import 'package:masquerade_page/vistas/appbar.dart';
import 'package:masquerade_page/widgets/custom_background_scaffold.dart';
import 'package:masquerade_page/widgets/custom_row_pick.dart';
import 'package:bulleted_list/bulleted_list.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:masquerade_page/widgets/category_model.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse(
    'https://drive.google.com/file/d/1qW5tZvKySIfbivBJxzWrWqSlLeVDt9NA/view?usp=sharing');

final Uri Trailer = Uri.parse('https://www.youtube.com/watch?v=7ffrsMKhvPw');

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
                  offset: Offset(100, 100),
                  spreadRadius: -10.0,
                  blurRadius: 12.0,
                  blurStyle: BlurStyle.inner,
                )
              ],
              image: DecorationImage(
                image: AssetImage("assets/images/CaronteBkgnd.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(children: <Widget>[
              const CustomAppBar(),
              const Spacer(
                flex: 2,
              ),
              CustomElevation(
                child: ElevatedButton(
                  onPressed: _launchUrl,
                  style: ElevatedButton.styleFrom(
                      elevation: 12.0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      shadowColor: Color.fromARGB(255, 255, 255, 255),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 40.0),
                      textStyle: CustomTextStyles.buttonText,
                      primary: Colors.pink),
                  child: const Text('Desc??rgalo Ya'),
                ),
              ),
              const Spacer()
            ]),
          ),
          BaseLayout(
            imageBackground: "assets/images/TownBkgnd.png",
            myChild: Center(
              child: Row(children: <Widget>[
                const Spacer(flex: 1),
                Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(74, 255, 255, 255),
                      border: Border.all(
                          color: const Color.fromARGB(74, 255, 255, 255)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 40.0),
                  height: 700,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      generarTextoPersonalizado(
                          myText: "Sin??psis",
                          textStyle: CustomTextStyles.subtitle),
                      const SizedBox(
                        height: 40,
                      ),
                      generarTextoPersonalizado(
                          myText:
                              "Lo despierta en un tren sin recuerdo alguno \nsobre quien es, en su rostro una m??scara que no \nse puede quitar. El conductor del tren, Caronte, \nlo lleva a un lugar con la promesa de que all?? \npuede encontrar quien es. \n\nLo se dedica a explorar el pueblo de Liberio en \nbusca de respuestas; extra??amente toda persona \ncon la que se encuentra tiene tambi??n una \nm??scara y aparentan estar sumamente desorientados. \nTras pasar su primer d??a, Lo se da cuenta que \naquellas personas olvidan con el paso de la \nnoche todo lo que hab??a sucedido el d??a anterior, y \nes aqu?? donde comenzar?? su traves??a en \ndescubrir la oscura realidad detr??s de este \nmisterioso pueblo.",
                          textStyle: CustomTextStyles.content)
                    ],
                  ),
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
              const SizedBox(
                height: 80,
              ),
              generarTextoPersonalizado(
                  myText: "Tr??iler", textStyle: CustomTextStyles.subtitle),
              const Spacer(flex: 1),
              Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(74, 255, 255, 255),
                    border: Border.all(
                        width: 5, color: Color.fromARGB(255, 0, 0, 0)),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                height: 400,
                child: Image.asset(
                  'assets/images/Conoce.png',
                  fit: BoxFit.fill,
                ),
              ),
              const Spacer(flex: 1),
              CustomElevation(
                child: ElevatedButton(
                  onPressed: _launchTrailer,
                  style: ElevatedButton.styleFrom(
                      elevation: 12.0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      shadowColor: Color.fromARGB(255, 255, 255, 255),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 40.0),
                      textStyle: CustomTextStyles.buttonText,
                      primary: Colors.pink),
                  child: const Text('Ver Tr??iler'),
                ),
              ),
              const Spacer(flex: 1),
            ])),
          ),
          BaseLayout(
            imageBackground: "assets/images/Bakery.png",
            myChild: Column(
              children: <Widget>[
                const SizedBox(
                  height: 40,
                ),
                generarTextoPersonalizado(
                    myText: "Features", textStyle: CustomTextStyles.subtitle),
                const SizedBox(
                  height: 40,
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 600,
                    aspectRatio: 1.0,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    autoPlay: true,
                  ),
                  items: Category.categories
                      .map((category) => HeroCarouselCard(category: category))
                      .toList(),
                ),
              ],
            ),
          ),
          BaseLayout(
              imageBackground: "assets/images/finalImageCaronte.png",
              myChild: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Spacer(
                    flex: 7,
                  ),
                  Column(
                    children: <Widget>[
                      const Spacer(flex: 2),
                      generarTextoPersonalizado(
                          myText:
                              "Atr??vete a conocer \nLiberio y resuelve \ntodos sus miserios.",
                          textStyle: CustomTextStyles.resume),
                      const Spacer(flex: 1),
                      const SizedBox(
                        height: 40,
                      ),
                      generarTextoPersonalizado(
                          myText: 'S??lo aqu??, en',
                          textStyle: CustomTextStyles.resume),
                      generarTextoPersonalizado(
                          myText: 'Masquerade',
                          textStyle: CustomTextStyles.title),
                      const Spacer(flex: 3),
                    ],
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                ],
              )),

          BaseLayout(
            imageBackground: "assets/images/TeamMembers.png",
            myChild: Column(
              children: [
                const SizedBox(height: 80),
                Row(
                  children: [
                    //esto no es responsive pero honestly nada en este codigo lo es
                    //so...
                    const Spacer(
                      flex: 2,
                    ),
                    generarTextoPersonalizado(
                        myText: "Equipo de\nDesarrollo",
                        textStyle: CustomTextStyles.resume),
                    const SizedBox(width: 1100),
                  ],
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: const BulletedList(
                    bulletColor: CustomColors.white,
                    listItems: [
                      "Santiago Castrill??n",
                      "Laura Molina",
                      "Valentina Gil",
                      "Samuel F. Rodriguez",
                      "Mariana Cano",
                      "Jordan Bol??var",
                      "Yefri Avella",
                      "Alejandro Serna"
                    ],
                    listOrder: ListOrder.ordered,
                    style: CustomTextStyles.teamMembers,
                  ),
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            height: 170,
            child: Row(children: <Widget>[
              const Spacer(flex: 1),
              generarTextoPersonalizado(
                  myText: "P??gina desarrollada por: ",
                  textStyle: CustomTextStyles.teamMembers),
              const Spacer(flex: 1),
              Column(
                children: [
                  const Spacer(flex: 2),
                  generarTextoPersonalizado(
                      myText: "Santiago Castrill??n",
                      textStyle: CustomTextStyles.teamMembers),
                  generarTextoPersonalizado(
                      myText: "Laura Molina ",
                      textStyle: CustomTextStyles.teamMembers),
                  const Spacer(flex: 2),
                ],
              ),
              const Spacer(flex: 3),
              generarTextoPersonalizado(
                  myText: "Todos los derechos de autor reservados ",
                  textStyle: CustomTextStyles.teamMembers),
              const Spacer(flex: 1),
            ]),
          )
        ],
      ),
    ));
  }
}

Widget generarTextoPersonalizado(
    {required String myText, required TextStyle textStyle}) {
  return Text(myText, style: textStyle);
}

_launchUrl() async {
  if (await canLaunchUrl(_url)) {
    await launchUrl(_url);
  } else {
    throw "could not load";
  }
}

_launchTrailer() async {
  if (await canLaunchUrl(Trailer)) {
    await launchUrl(Trailer);
  } else {
    throw "could not load";
  }
}

class CustomElevation extends StatelessWidget {
  final Widget child;

  CustomElevation({required this.child}) : assert(child != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(50.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color(0xADACAC).withOpacity(0.1),
            blurRadius: 1,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: this.child,
    );
  }
}

class HeroCarouselCard extends StatelessWidget {
  final Category category;

  const HeroCarouselCard({
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 20),
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.asset(category.imagePath, fit: BoxFit.cover, width: 1000.0),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Text(
                    category.name,
                    style: CustomTextStyles.cardText,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
