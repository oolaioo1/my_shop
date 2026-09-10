import 'package:flutter/material.dart';

class MienView extends StatefulWidget {
  MienView({Key? key}) : super(key: key);

  @override
  _MienViewState createState() => _MienViewState();
}

class _MienViewState extends State<MienView> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('Mine'));
  }
}
