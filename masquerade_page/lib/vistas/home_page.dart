import 'package:flutter/material.dart';
import 'package:masquerade_page/util/custom_color.dart';
import 'package:masquerade_page/util/custom_text_style.dart';
import 'package:masquerade_page/vistas/appbar.dart';
import 'package:masquerade_page/widgets/custom_background_scaffold.dart';
import 'package:masquerade_page/widgets/custom_row_pick.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:bulleted_list/bulleted_list.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:masquerade_page/widgets/category_model.dart';

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
                      height: 200,
                    ),
                    generarTextoPersonalizado(
                        myText: "Sinópsis",
                        textStyle: CustomTextStyles.subtitle),
                    const SizedBox(
                      height: 40,
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
              const SizedBox(
                height: 80,
              ),
              generarTextoPersonalizado(
                  myText: "Tráiler", textStyle: CustomTextStyles.subtitle),
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
                      const Spacer(flex: 1),
                      generarTextoPersonalizado(
                          myText:
                              "Atrévete a conocer \nLiberio y resuelve \ntodos sus miserios.",
                          textStyle: CustomTextStyles.resume),
                      const SizedBox(
                        height: 40,
                      ),
                      generarTextoPersonalizado(
                          myText: 'Sólo aquí, en',
                          textStyle: CustomTextStyles.resume),
                      generarTextoPersonalizado(
                          myText: 'Masquerade',
                          textStyle: CustomTextStyles.title),
                      const Spacer(flex: 4),
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
                const SizedBox(height: 40),
                generarTextoPersonalizado(
                    myText: "Equipo de Desarrollo",
                    textStyle: CustomTextStyles.subtitle),
                const BulletedList(
                  bulletColor: CustomColors.white,
                  listItems: [
                    "Santiago Castrillón",
                    "Laura Molina",
                    "Valentina Gil",
                    "Samuel F. Rodriguez",
                    "Mariana Cano",
                    "Jordan Bolívar",
                    "Yefri Avella",
                    "Alejandro Serna"
                  ],
                  listOrder: ListOrder.ordered,
                  style: CustomTextStyles.teamMembers,
                )
              ],
            ),
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