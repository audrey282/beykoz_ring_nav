import 'package:beykoz_nav/components/button.dart';
import 'package:flutter/material.dart';
import 'package:beykoz_nav/pages/login.dart';
import 'package:beykoz_nav/pages/signup.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(100, 174, 23, 23),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/bus-stop.png'),
              Button(lable: "LOGIN", press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> const LoginScreen()));
              }, label: 'LOGIN', ),
              Button(lable: "SIGN UP", press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> const SignupScreen()));
              }, label: 'SIGN UP', ),
            ],
          )
      ),
    );
  }
}
