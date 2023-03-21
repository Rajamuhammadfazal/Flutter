

import 'package:flutter/material.dart';

class output extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    final result = ModalRoute.of(context)!.settings.arguments as Map<String,String>;
    return Scaffold(
      body:
      Container(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                child: Text("Height: ${result["height"]}",style: TextStyle(color: Colors.white,fontSize: 25),),
              ),
              Padding(
                padding:const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                child: Text("Weight: ${result["weight"]}",style: TextStyle(color: Colors.white,fontSize: 25),),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Text("Your Age is ${result["age"]}",style: TextStyle(color: Colors.white,fontSize: 25),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Text("Your BMI is ${result["result"]}",style: TextStyle(color: Colors.white,fontSize: 30),),
          ),
        ],
      ),
    )
    );
  }
}
