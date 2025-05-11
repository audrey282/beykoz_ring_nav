import 'package:beykoz_nav/components/data_campus.dart';
import 'package:beykoz_nav/components/detail_image.dart';
import 'package:beykoz_nav/pages/campus_info_detail.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.products});
  final DataCampus products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // for product detail images.
            ProductDetailImages(imageUrl: products.imageUrl),
            // for product item more detail
            ProductItemsDetail(product: products),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),

            )
          ],
        ),
      ),
    );
  }
}