import 'package:beykoz_nav/components/data_campus.dart';
import 'package:beykoz_nav/components/DetailScreen.dart';
//import 'package:beykoz_nav/pages/google_map_page.dart';
//import 'package:beykoz_nav/pages/map_page_old.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GridView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.65,
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              Size size = MediaQuery.of(context).size;
              final product = categories[index];
              return Transform.translate(
                offset: Offset(0, index.isOdd ? 28 : 0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) =>
                            //GoogleMapPage()));
                    DetailScreen(products: product)));
                  },
                  child: Padding(
                    padding:
                    const EdgeInsets.only(right: 10, left: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Hero(
                            tag: product.imageUrl,
                            child: Image(
                              height: size.height * 0.25,
                              width: size.width * 0.45,
                              image: AssetImage(
                                product.imageUrl,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          product.name,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                       // Text(
                        //  product.address,
                         //  style: const TextStyle(
                          //  color: Colors.black45,
                          //  fontWeight: FontWeight.w300,
                          //  fontSize: 14,
                        //  ),
                      //  )
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}