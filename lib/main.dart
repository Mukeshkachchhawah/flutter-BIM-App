import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var whatcontroller = TextEditingController();
  var fitController = TextEditingController();
  var inchController = TextEditingController();

  var result = '';
  var alltypescolors;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fluttter BIM App "),
      ),
      body: Container(
        color: alltypescolors,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "BMI ",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text("(Wait , fit , inch, Chek this app) "),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: whatcontroller,
                decoration: InputDecoration(
                    label: Text("Enter Your Wait"),
                    prefixIcon: Icon(Icons.whatshot)),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: fitController,
                decoration: InputDecoration(
                    label: Text("Enter Your fit"),
                    prefixIcon: Icon(Icons.whatshot)),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: inchController,
                decoration: InputDecoration(
                    label: Text("Enter Your inch"),
                    prefixIcon: Icon(Icons.whatshot)),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    // add logic bim app
                    var what = whatcontroller.text.toString();
                    var fit = fitController.text.toString();
                    var inch = inchController.text.toString();
// Logical Opertar usr

                    if (what != "" && fit != "" && inch != "") {
// BIM Calculation

                      var iwhat = int.parse(
                          what); // value ko update ho rahi hai string to int me
                      var ifit = int.parse(
                          fit); // value ko update ho rahi hai string to int me
                      var iinch = int.parse(
                          inch); // value ko update ho rahi hai string to int me

// t full name total inch
                      var tinch = (ifit * 12) + iinch;
                      var tCm = tinch * 2.54;
                      var tm = tCm / 100;
                      var bmi = iwhat / (tm * tm);
// add colors types in logic
                      var colorsmessage = ' ';
                      if (bmi > 25) {
                        colorsmessage = "You're Over Weight";
                        alltypescolors = Colors.orange.shade200;
                      } else if (bmi < 18) {
                        colorsmessage = "You're Under weight";
                        alltypescolors = Colors.red.shade200;
                      } else {
                        colorsmessage = "You're  Healthy weight";
                        alltypescolors = Colors.green.shade200;
                      }

                      setState(() {
                        result =
                            "$colorsmessage \n Your BIM is : ${bmi.toStringAsFixed(4)}";
                        // BIM result is poins number exmple your bim is 00.00
                      });
                    } else {
                      setState(() {
                        result = 'Please fill all data';
                      });
                    }
                  },
                  icon: Icon(Icons.ads_click_outlined),
                  label: Text("Clike")),
              SizedBox(
                height: 20,
              ),
              Text(
                result,
                style: TextStyle(fontSize: 15),
              )
            ],
          ),
        ),
      ),
    );
  }
}
