import 'package:flutter/material.dart';
import 'package:food_app1/pages/food/popular_food_datail.dart';

import 'package:get/get.dart';

import 'pages/home/main_food_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: popular_food_detail(),

    );
  }
}


