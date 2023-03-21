
import 'package:container/BMI.dart';
import 'package:container/output.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(Flutters());
}
class Flutters extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     title: "BMI Calculator",
     initialRoute: '/',
     routes: {
       '/': (context)=> Bmi(),
       '/output': (context)=> output()
     },
     debugShowCheckedModeBanner: false,
     theme: ThemeData.dark(),
   );
  }
}

