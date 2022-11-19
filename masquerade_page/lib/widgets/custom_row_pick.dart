import 'package:flutter/material.dart';

class WidgetRowPage extends StatelessWidget{
  const WidgetRowPage({super.key});
 
  Column dataColumn({required String d1, required String d2, Color? color}){
    return Column(
        children: [
          Text(d1,style: TextStyle(color: color ?? Colors.white),),
          Text(d2),
        ],
      );
  }
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Column(
        children: const [
        Text("Karim Benzama"),
        Text("Chef"),
        Text("These ribs are excellent. I believe it is \nbecause this rub is so good."),
        ]
      ),
      Image.network("https://cdn.pixabay.com/photo/2016/04/01/09/52/cartoon-1299636_960_720.png", scale: 5,),
      dataColumn(d1: "Lunch",d2: "01:00 - 03:00pm", color: Colors.red),
      dataColumn(d1: "Dinner", d2: "07:00 - 11:00pm"),
    ],
  );
  }
}