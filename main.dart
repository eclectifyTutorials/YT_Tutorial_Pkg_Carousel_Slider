// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const customSwatch = MaterialColor(
    0xFFFF5252,
    <int, Color>{
      50: Color(0xFFFFEBEE),
      100: Color(0xFFFFCDD2),
      200: Color(0xFFEF9A9A),
      300: Color(0xFFE57373),
      400: Color(0xFFEF5350),
      500: Color(0xFFFF5252),
      600: Color(0xFFE53935),
      700: Color(0xFFD32F2F),
      800: Color(0xFFC62828),
      900: Color(0xFFB71C1C),
    },
  );

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: customSwatch,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carousel Slider"),
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          CarouselSlider.builder(
            carouselController: _carouselController,
            itemCount: 5,
            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                Container(
                  width: double.infinity,
                  color: Colors.red,
                  child: Center(
                    child: Text(itemIndex.toString(), style: TextStyle(color: Colors.white, fontSize: 40,),),
                  ),
                ),
            options: CarouselOptions(
              height: 400,
              aspectRatio: 16/9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              onPageChanged: _onCarouselPageChanged,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(height: 20,),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {_carouselController.previousPage();},
                  child: Icon(Icons.arrow_back_ios, color: Colors.white),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                    primary: Colors.redAccent, // <-- Button color
                    // onPrimary: Colors.re, // <-- Splash color
                  ),
                ),
                SizedBox(width: 20,),
                ElevatedButton(
                  onPressed: () {_carouselController.nextPage();},
                  child: Icon(Icons.arrow_forward_ios, color: Colors.white),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                    primary: Colors.redAccent, // <-- Button color
                    // onPrimary: Colors.re, // <-- Splash color
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onCarouselPageChanged(int page, CarouselPageChangedReason reason) {
    print("page changed to $page");
  }

}

