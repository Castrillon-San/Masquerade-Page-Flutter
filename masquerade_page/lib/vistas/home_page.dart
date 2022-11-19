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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  // Widget textoPersonalizado(String texto){
  //     return Text(
  //       texto,
  //       style: const Text(widget.title)
  //         color: CustomColor.beige,
  //     ),
  //     );
  //     }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/CaronteBkgnd.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        ListView(
          children: <Widget>[
            const CustomAppBar(),
          ],
        ),
        const Center(
          child: TextButton(
            onPressed: null,
            child: Text(
              "Descárgalo ya",
              style: TextStyle(
                  fontSize: 26,
                  fontFamily: 'CinzelBold',
                  color: Color(0xC0316F)),
            ),
          ),
        ),
        // Container(
        //   decoration: const BoxDecoration(
        //     image: DecorationImage(
        //       image: AssetImage("assets/images/CaronteBkgnd.png"),
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
      ],
    ));
    // child: ListView(
    //   children: <Widget>[
    //     const CustomAppBar(),
    //     const SizedBox(
    //       height: 100,
    //     ),
    //     Row(
    //       children: [
    //         const Spacer(),
    //         Text(
    //           "Steak & \nRibs",
    //           style: CustomTextStyles.headingGigant,
    //         ),
    //         const Spacer(),
    //         Image.asset(
    //           'assets/images/IMG_4093.PNG',
    //           scale: 8,
    //         ),
    //         Image.network(
    //           "https://www.kansascitysteaks.com/images/www/how-to-cook/filet-mignon/doneness.png",
    //           scale: 3,
    //         ),
    //         const Spacer(
    //           flex: 3,
    //         ),
    //       ],
    //     ),
    //     const WidgetRowPage(),
    //     BaseLayout(
    //         imageBackground: Image.network(
    //             "https://www.kansascitysteaks.com/images/www/how-to-cook/filet-mignon/doneness.png")),
    //   ],
    // ),
    //   ),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: _incrementCounter,
    //     tooltip: 'Increment',
    //     child: const Icon(Icons.add),
    //   ),
    // );
  }
}
