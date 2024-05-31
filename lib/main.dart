import 'package:calculadora/widgets/calc_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:math_expressions/math_expressions.dart';

void main(List<String> args) {
  runApp(const CalcApp());
}

class CalcApp extends StatefulWidget {
  const CalcApp({super.key});

  @override
  State<CalcApp> createState() => _CalcAppState();
}

class _CalcAppState extends State<CalcApp> {
  String _history = "";
  String _expresion = "";
  void allClear(String text) {
    setState(() {
      _history = "";
      _expresion = "";
    });
  }

  void clear(String text) {
    setState(() {
      _expresion = "";
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expresion);
    ContextModel cm = ContextModel();

    setState(() {
      _history = _expresion;
      _expresion = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  void numClick(String text) {
    setState(() {
      _expresion += text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculadora",
      home: Scaffold(
        backgroundColor: const Color(0xFF21252B),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                alignment: const Alignment(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    _history,
                    style: GoogleFonts.rubik(
                        textStyle: const TextStyle(
                      fontSize: 24,
                      color: Color.fromARGB(255, 148, 135, 135),
                    )),
                  ),
                ),
              ),
              Container(
                alignment: const Alignment(1.0, 1.0),
                child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      _expresion,
                      style: GoogleFonts.rubik(
                          textStyle: const TextStyle(
                              fontSize: 48, color: Colors.white)),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    callback: allClear,
                    operation: "AC",
                    textSize: 20,
                    bgcolor: 0xFF00BF45,
                  ),
                  CalcButton(
                    callback: clear,
                    operation: "C",
                    textSize: 20,
                    bgcolor: 0xffE3303A,
                  ),
                  CalcButton(callback: numClick, operation: "%", textSize: 20),
                  CalcButton(callback: numClick, operation: "/", textSize: 20),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(callback: numClick, operation: "7", textSize: 20),
                  CalcButton(callback: numClick, operation: "8", textSize: 20),
                  CalcButton(callback: numClick, operation: "9", textSize: 20),
                  CalcButton(callback: numClick, operation: "*", textSize: 20),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(callback: numClick, operation: "4", textSize: 20),
                  CalcButton(callback: numClick, operation: "5", textSize: 20),
                  CalcButton(callback: numClick, operation: "6", textSize: 20),
                  CalcButton(callback: numClick, operation: "-", textSize: 20),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(callback: numClick, operation: "1", textSize: 20),
                  CalcButton(callback: numClick, operation: "2", textSize: 20),
                  CalcButton(callback: numClick, operation: "3", textSize: 20),
                  CalcButton(callback: numClick, operation: "+", textSize: 20),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(callback: numClick, operation: ".", textSize: 20),
                  CalcButton(callback: numClick, operation: "0", textSize: 20),
                  CalcButton(callback: numClick, operation: "00", textSize: 20),
                  CalcButton(callback: evaluate, operation: "=", textSize: 20),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
