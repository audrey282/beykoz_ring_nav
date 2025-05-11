import 'package:flutter/material.dart';

//We are going to design our own button

class Button extends StatelessWidget {
  final String label;
  final VoidCallback press;
  const Button({super.key,
    required this.label,
    required this.press,
    required String lable});

  @override
  Widget build(BuildContext context) {
    //Query width and height of device for being fit or responsive
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width *.9,
      height: 55,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
      ),

      child: TextButton(
        onPressed: press,
        child: Text(
          label,style: const TextStyle(
          fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 143, 25, 25)),),
      ),
    );
  }
}