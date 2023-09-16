import 'package:flutter/material.dart';
import 'package:task3/data/product_model.dart';





class ProductScreen extends StatelessWidget {
  final ProductData dataK;
  const ProductScreen({super.key, required this.dataK});

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(

        backgroundColor: Colors.white70,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
                topRight: Radius.circular(30),
                topLeft:Radius.circular(30),
              ),
              child: Image.network(
                fit: BoxFit.fill,
                dataK.image,
                height: 300,
                width: 380,
              ),
            ),

            Container(

              width: double.infinity,
              height: 100,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(20),
                color: Colors.white70,
              ),
              child: Text(
                dataK.detail,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),

            Container(
              width: 200,
              height: 70,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Expanded(
                    child: Text(
                      'Price: ${dataK.price.toString()} \$',
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}