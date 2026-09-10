import 'package:flutter/material.dart';

class HomeHots extends StatefulWidget {
  HomeHots({Key? key}) : super(key: key);

  @override
  _HomeHotsState createState() => _HomeHotsState();
}

class _HomeHotsState extends State<HomeHots> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300, 
      alignment: Alignment.center,
      child: Text('HomeHots'),
      color: Colors.blue,
    );
  }
}
