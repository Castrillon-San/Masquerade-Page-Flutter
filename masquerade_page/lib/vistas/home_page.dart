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
import 'package:pod_player/pod_player.dart';

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
                  child: const Text('Descárgalo Ya'),
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
                  child: const Text('Ver Tráiler'),
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
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            height: 200,
            child: Column(children: <Widget>[]),
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

class PlayVideoFromYoutube extends StatefulWidget {
  const PlayVideoFromYoutube({Key? key}) : super(key: key);

  @override
  State<PlayVideoFromYoutube> createState() => _PlayVideoFromYoutubeState();
}

class _PlayVideoFromYoutubeState extends State<PlayVideoFromYoutube> {
  late final PodPlayerController controller;

  @override
  void initState() {
    controller = PodPlayerController(
      playVideoFrom:
          PlayVideoFrom.youtube('https://www.youtube.com/watch?v=7ffrsMKhvPw'),
    )..initialise();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PodVideoPlayer(controller: controller),
    );
  }
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
