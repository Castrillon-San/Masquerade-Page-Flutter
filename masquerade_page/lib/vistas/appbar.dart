import 'package:flutter/material.dart';
import 'package:masquerade_page/util/custom_color.dart';
import 'package:masquerade_page/util/custom_text_style.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  Text customText(String txt) {
    return Text(txt,
        style: TextStyle(
          color: CustomColors.black,
          fontSize: 15,
          fontWeight: FontWeight.w300,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: ColoredBox(
        color: CustomColors.black,
        child: Row(
          children: [
            const Spacer(flex: 1),
            Image.asset('assets/images/LogoHiRes.png'),
            const Spacer(flex: 5),
            Text("Masquerade", style: CustomTextStyles.titleAppBar),
            const Spacer(flex: 7),
          ],
        ),
      ),
    );
  }
}
