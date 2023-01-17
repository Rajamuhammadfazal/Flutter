import 'package:calculator/colors.dart';
import "package:flutter/material.dart";
import 'package:math_expressions/math_expressions.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:CalculatorApp() ,
  ));
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {

  double firstnum = 0.0;
  double secondnum = 0.0;
  var input = "";
  var output = "";
  var operator = "";
  var hide = false;
  var outputsize = 34.0;
  onButtonClick(value)
  {

    if(value == "AC"){
      input = "";
      output = "";
    }
    else if(value == "<-"){
      if(input.isNotEmpty){
      input = input.substring(0,input.length-1);
      }
    }
    else if(value == "="){
     if(input.isNotEmpty)
     {
       var userinput = input;
       userinput = input.replaceAll("x", "*");
       Parser p = Parser();
       Expression ex = p.parse(userinput);
       ContextModel cm = ContextModel();
       var finalvalue = ex.evaluate(EvaluationType.REAL, cm);
       output = finalvalue.toString();
       if(output.endsWith(".0")){
         output = output.substring(0,output.length-2);
       }
       input = output;
       hide = true;
       outputsize = 52;
     }
    }
    else {
      input = input + value;
      hide = false;
      outputsize = 34;
    }
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:Column(
        children: [


          Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(hide ? "" :input,style: TextStyle(fontSize: 48,color: Colors.white),),
                SizedBox(height: 20,),
                Text(output,style: TextStyle(fontSize: outputsize,color: Colors.white.withOpacity(0.7)),),
                SizedBox(height: 20,)
              ],
              ),
              )
          ),

          Row(
            children: [
              button(text: "AC",tcolor: orangecolor,buttonbgcolor: operatorcolor),
              button(text: "<-",tcolor: orangecolor,buttonbgcolor: operatorcolor),
              button(text: "",buttonbgcolor: Colors.transparent),
              button(text: "/",tcolor: orangecolor,buttonbgcolor: operatorcolor),
            ],
          ),
          Row(
            children: [
              button(text: "7"),
              button(text: "8"),
              button(text: "9"),
              button(text: "x",tcolor: orangecolor,buttonbgcolor: operatorcolor),
            ],
          ),
          Row(
            children: [
              button(text: "4"),
              button(text: "5"),
              button(text: "6"),
              button(text: "-",tcolor: orangecolor,buttonbgcolor: operatorcolor),
            ],
          ),
          Row(
            children: [
              button(text: "1"),
              button(text: "2"),
              button(text: "3"),
              button(text: "+",tcolor: orangecolor,buttonbgcolor: operatorcolor),
            ],
          ),
          Row(
            children: [
              button(text: "%",tcolor: orangecolor,buttonbgcolor: operatorcolor),
              button(text: "0"),
              button(text: "."),
              button(text: "=",buttonbgcolor: orangecolor),
            ],
          ),
        ],
      )
    );
  }
  Widget button({
  text,tcolor =Colors.white, buttonbgcolor = buttoncolor}){
    return  Expanded(child:
    Container(
      margin: EdgeInsets.all(8),
      child: ElevatedButton(
        child: Text(text,style: TextStyle(fontSize: 18,color: tcolor,fontWeight: FontWeight.bold),),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)),
          primary: buttonbgcolor,
          padding: EdgeInsets.all(22),
        ), onPressed: () => onButtonClick(text),
      ),
    )
    );
  }
}
