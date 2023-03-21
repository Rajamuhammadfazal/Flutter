import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  const Bmi({Key? key}) : super(key: key);

  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  var height = 120;
  var weight = 50;
  var age = 20;
  int current = 1;
  var result = 0.0;

  void calculate(){
    var ht = height/100;
    var wg = weight;
    var sq = ht*ht;
    result = wg/sq;
  }
  Widget Button(@required IconData icon, @required String name, @required Color text,@required int value)
  {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.black87,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,size: 70,color:current == value? text:Colors.white,),
          Text(name,style: TextStyle(fontSize: 30,color: current == value? text:Colors.white),)
        ],
      ),
      onPressed: ()
      {
        setState(() {
          current = value;
        });
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: Center(child: Text("BMI Calculator",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)),
        ),
        body:
        Column(
          children: [
            Expanded(child:
            Row(
              children: [
                Expanded(child:
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Button(Icons.male, "male",Colors.orangeAccent,1),
                )),
                Expanded(child:
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Button(Icons.female, "Female", Colors.orangeAccent, 0),
                )),
              ],
            )),

            Expanded(child:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(height.toString(),style: TextStyle(fontSize: 40),),
                        ),
                        Text("cm",)
                      ],
                    ),
                    Slider(
                        min:120,
                        max: 200,
                        activeColor: Colors.orangeAccent,
                        inactiveColor: Colors.white38,
                        value: height.toDouble(),
                        onChanged: (double values){
                          setState(() {
                            height = values.round();
                          });
                        })
                  ],
                ),
              ),
            ),),


            Expanded(child:
            Row(
              children: [
                Expanded(child:
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Weight",style: TextStyle(fontSize: 30),),
                        Text(weight.toString(),style: TextStyle(fontSize: 25)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FloatingActionButton(
                                heroTag: "weight+",
                                onPressed: (){
                                setState(() {
                                  weight+=1;
                                });
                              } , child: Icon(Icons.add,color:Colors.white,), backgroundColor: Colors.orangeAccent,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FloatingActionButton(heroTag:"weight-",
                                onPressed: (){
                                setState(() {
                                  if(weight>40)
                                  {
                                    weight-=1;
                                  }
                                });
                              } , child: Icon(Icons.remove,color:Colors.white,), backgroundColor: Colors.orangeAccent,),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )),
                Expanded(child:
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Age",style: TextStyle(fontSize: 30),),
                        Text(age.toString(),style: TextStyle(fontSize: 25)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FloatingActionButton(heroTag:"age+",
                                onPressed: (){
                                setState(() {
                                  age+=1;
                                });
                              } , child: Icon(Icons.add,color:Colors.white,), backgroundColor: Colors.orangeAccent,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FloatingActionButton(
                                heroTag: "age-",
                                onPressed: (){
                                setState(() {
                                  if(age>10)
                                  {
                                    age-=1;
                                  }
                                });
                              } , child: Icon(Icons.remove,color:Colors.white,), backgroundColor: Colors.orangeAccent,),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )),
              ],
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: (){
                calculate();
                Navigator.pushNamed(
                  context, '/output',arguments: {
                    "result": result.toStringAsFixed(2).toString(),
                  "age": age.toString(),
                  "weight":weight.toString(),
                  "height":height.toString()
                });
              },
                  style: ElevatedButton.styleFrom(
                      primary:Colors.orangeAccent
                  ),
                  child: Container( width:double.infinity,
                      height: 50,
                      child: Center(child: Text("Calculator")))),
            ),
          ],
        )
    );
  }
}
