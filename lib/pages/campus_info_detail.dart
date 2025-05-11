import 'package:flutter/material.dart';
import 'package:beykoz_nav/components/data_campus.dart';
import 'package:beykoz_nav/pages/google_map_page.dart'; // GoogleMapPage is assumed to be here
import 'package:beykoz_nav/pages/map_page_old.dart';

class ProductItemsDetail extends StatelessWidget {
  const ProductItemsDetail({super.key, required this.product});
  final DataCampus product;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.52),
      child: SizedBox(
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Campus Name
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Color.fromARGB(255, 143, 25, 25),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Description
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 143, 25, 25),
                    ),
                  ),
                  Text(
                    product.description,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Address
              Text(
                product.address,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                  fontSize: 13,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 30),

              // Map Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Small Map Icon Button
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MapPage(),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      width: size.width * 0.18,
                      height: 75,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(27),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.map,
                          size: 30,
                          color: Colors.black38,
                        ),
                      ),
                    ),
                  ),

                  // Google Map Text Button
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const GoogleMapPage(),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        width: size.width * 0.60,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const Center(
                          child: Text(
                            "Google Map",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 143, 25, 25),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
