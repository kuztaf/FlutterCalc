import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcButton extends StatelessWidget {
  final Function callback;
  final String operation;
  final int bgcolor;
  final double textSize;

  const CalcButton({
    super.key,
    required this.callback,
    required this.operation,
    required this.textSize,
    this.bgcolor = 0xFF21252B,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        child: SizedBox(
          height: 65,
          width: 65,
          child: TextButton(
            onPressed: () {
              callback(operation);
            },
            style: TextButton.styleFrom(
                backgroundColor: Color(bgcolor),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(16.0),
                textStyle: const TextStyle(fontSize: 20)),
            child: Text(operation,
                style: GoogleFonts.rubik(
                    textStyle: TextStyle(fontSize: textSize))),
          ),
        ));
  }
}
