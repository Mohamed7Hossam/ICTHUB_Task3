import 'dart:convert';

import 'package:flutter/material.dart';


import 'package:http/http.dart' as http;
import 'package:task3/data/product_model.dart';


import 'product_screen.dart';





class myHome extends StatefulWidget {
  const myHome({super.key});

  @override
  State<myHome> createState() => _myHomeState();
}

class _myHomeState extends State<myHome> {
  Future<List<ProductData>> getData() async {
    List<ProductData> dataA = [];
    try {
      final res = await http.get(Uri.parse('https://dummyjson.com/products'));
      if (res.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(res.body);
        for (var item in responseData['products']) {
          dataA.add(ProductData.fromJson(item));
        }
      }
      return dataA;
    } catch (e) {
      print(e);
      return dataA;
    }
  }

  List<ProductData> myList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
          () async {
        var data = await getData();
        setState(() {
          myList = data;
          isLoading = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('New Products'),
        leadingWidth: 20,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
        child: GridView.builder(
          itemCount: myList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductScreen(
                      dataK: myList[index],
                    ),
                  ),
                );
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: Image.network(
                      myList[index].image,
                    ).image,
                  ),
                ),
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.all(10),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color:  Colors.blueGrey,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          myList[index].name,
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        '${myList[index].price.toString()} EGP',
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
        ),
      ),
    );
  }
}