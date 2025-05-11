import 'package:beykoz_nav/pages/campus_lists.dart';
import 'package:flutter/material.dart';
//import 'package:beykoz_nav/pages/DetailScreen.dart';

class Campus extends StatelessWidget {
  const Campus({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
            children: [
              myAppBar(),
              // for search bar
              mySearchBar(),
              const Categories(),
            ],
          )),
    );
  }

  Padding mySearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        height: 65,
        decoration: BoxDecoration(
          color: Colors.grey[350],
          borderRadius: BorderRadius.circular(20),
        ),
        child: const TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none),
              contentPadding:
              EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              fillColor: Colors.white,
              hintText: "Search...",
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black26,
              ),
              prefixIcon: Icon(
                Icons.search,
                size: 30,
                color: Colors.black26,
              )),
        ),
      ),
    );
  }

  Padding myAppBar (){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Explore The Campus",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Color.fromARGB(255, 143, 25, 25),
            ),
          ),
        ],
      ),
    );
  }

}