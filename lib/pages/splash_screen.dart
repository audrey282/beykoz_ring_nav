import 'dart:async';

import 'package:beykoz_nav/pages/home_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4),
        ()=> Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(100, 174, 23, 23),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/logo.png.png'),
            Text('Ring Navigation',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white70,
              fontStyle: FontStyle.italic
            ),),
          ],
        )
      ),
    );




    //return Material(
      //child: Container(
        //height: MediaQuery.of(context).size.height,
        //width: MediaQuery.of(context).size.width,
        //decoration: BoxDecoration(
          //color: Colors.black,
          //image: DecorationImage(image: AssetImage("images/bachelor_campus.png.jpg"),
          //fit: BoxFit.cover,
            //opacity: 0.2,
         // )),
       // child: Column(
         // mainAxisAlignment: MainAxisAlignment.center,
         // children: [
           // Image.asset("images/logo.png.png"),
           // Text("Ring Navigation",
            //style: TextStyle(
              //  color: Colors.white70,
               // fontSize: 20,
               // fontWeight: FontWeight.bold,
               // fontStyle: FontStyle.italic),)
         // ],
       // ),
     // ),
   // );
  }
}
