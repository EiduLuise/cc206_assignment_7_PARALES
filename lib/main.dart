import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  // manage the sum section
  int sum = 0;
  int diff = 0;
  int prod = 0;
  double quo = 0;

  // either use a TextEditingController for each input field to get the value
  TextEditingController add1Controller = TextEditingController();
  TextEditingController add2Controller = TextEditingController();
  TextEditingController add3Controller = TextEditingController();
  TextEditingController add4Controller = TextEditingController();
  TextEditingController add5Controller = TextEditingController();
  TextEditingController add6Controller = TextEditingController();
  TextEditingController add7Controller = TextEditingController();
  TextEditingController add8Controller = TextEditingController();

  // or store each value in the state
  int firstAddNum = 0;
  int secondAddNum = 0;
  int firstSubNum = 0;
  int secondSubNum = 0;
  int firstMultiNum = 0;
  int secondMultiNum = 0;
  int firstDivNum = 0;
  int secondDivNum = 0;

  void clearFields() {
    add1Controller.clear();
    add2Controller.clear();
    add3Controller.clear();
    add4Controller.clear();
    add5Controller.clear();
    add6Controller.clear();
    add7Controller.clear();
    add8Controller.clear();
    setState(() {
      sum = 0;
      diff = 0;
      prod = 0;
      quo = 0;
    });
  }

  // Function to add the two numbers
  void addNum() {
    int firstAddNum = int.tryParse(add1Controller.text) ?? 0;
    int secondAddNum = int.tryParse(add2Controller.text) ?? 0;

    setState(() {
      sum = firstAddNum + secondAddNum;
    });
  }

  void subNum() {
    int firstSubNum = int.tryParse(add3Controller.text) ?? 0;
    int secondSubNum = int.tryParse(add4Controller.text) ?? 0;

    setState(() {
      diff = firstSubNum - secondSubNum;
    });
  }

  void multiNum() {
    int firstMultiNum = int.tryParse(add5Controller.text) ?? 0;
    int secondMultiNum = int.tryParse(add6Controller.text) ?? 0;

    setState(() {
      prod = firstMultiNum * secondMultiNum;
    });
  }

  void divNum() {
    double firstDivNum = double.tryParse(add7Controller.text) ?? 0;
    double secondDivNum = double.tryParse(add8Controller.text) ?? 1;

    setState(() {
      if (secondDivNum != 0) {
        quo = (firstDivNum / secondDivNum) as double;
      } else {
        quo = double.nan as double; // Handle division by zero
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Unit 5 Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Add Row
          Row(
            children: [
              const Text(
                "ADDITION",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: add1Controller,
                  decoration: const InputDecoration(labelText: "First Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              const Text(" + "),
              Expanded(
                child: TextField(
                  controller: add2Controller,
                  decoration: const InputDecoration(labelText: "Second Number"),
                  keyboardType: TextInputType.number,
                ),
              ),

              Text(' = $sum'),
              // 3.a Add an IconButton here
              IconButton(
                icon: Icon(
                  CupertinoIcons.equal_circle_fill,
                  color: Colors.blue,
                  size: 36.0,
                ),
                onPressed: addNum,
              ),
              // b.b Add an button here
              ElevatedButton(
                onPressed: clearFields,
                child: const Text("Clear Fields"),
              ),
            ],
          ),

          // 3.c - Add the other operations
          // Minus Row
          Row(
            children: [
              const Text(
                "SUBTRACTION",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10.0),
              Expanded(
                child: TextField(
                  controller: add3Controller,
                  decoration: const InputDecoration(labelText: "First Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              const Text(" - "),
              Expanded(
                child: TextField(
                  controller: add4Controller,
                  decoration: const InputDecoration(labelText: "Second Number"),
                  keyboardType: TextInputType.number,
                ),
              ),

              Text(' = $diff'),
              // 3.a Add an IconButton here
              IconButton(
                icon: Icon(
                  CupertinoIcons.equal_circle_fill,
                  color: Colors.blue,
                  size: 36.0,
                ),
                onPressed: subNum,
              ),
              // b.b Add an button here
              ElevatedButton(
                onPressed: clearFields,
                child: const Text("Clear Fields"),
              ),
            ],
          ),
          // Multiplication Row
          Row(
            children: [
              const Text(
                "MULTIPLICATION",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10.0),
              Expanded(
                child: TextField(
                  controller: add5Controller,
                  decoration: const InputDecoration(labelText: "First Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              const Text(" X "),
              Expanded(
                child: TextField(
                  controller: add6Controller,
                  decoration: const InputDecoration(labelText: "Second Number"),
                  keyboardType: TextInputType.number,
                ),
              ),

              Text(' = $prod'),
              // 3.a Add an IconButton here
              IconButton(
                icon: Icon(
                  CupertinoIcons.equal_circle_fill,
                  color: Colors.blue,
                  size: 36.0,
                ),
                onPressed: multiNum,
              ),
              // b.b Add an button here
              ElevatedButton(
                onPressed: clearFields,
                child: const Text("Clear Fields"),
              ),
            ],
          ),
          // Division Row
          Row(
            children: [
              const Text(
                "DIVISION",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10.0),
              Expanded(
                child: TextField(
                  controller: add7Controller,
                  decoration: const InputDecoration(labelText: "First Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              const Text(" / "),
              Expanded(
                child: TextField(
                  controller: add8Controller,
                  decoration: const InputDecoration(labelText: "Second Number"),
                  keyboardType: TextInputType.number,
                ),
              ),

              Text(' = $quo'),
              // 3.a Add an IconButton here
              IconButton(
                icon: Icon(
                  CupertinoIcons.equal_circle_fill,
                  color: Colors.blue,
                  size: 36.0,
                ),
                onPressed: divNum,
              ),
              // b.b Add an button here
              ElevatedButton(
                onPressed: clearFields,
                child: const Text("Clear Fields"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
