import 'package:flutter/material.dart';

class HomeMoreList extends StatefulWidget {
  HomeMoreList({Key? key}) : super(key: key);

  @override
  _HomeMoreListState createState() => _HomeMoreListState();
}

class _HomeMoreListState extends State<HomeMoreList> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
    
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          alignment: Alignment.center,
          child: Text('更多 $index'),
          color: Colors.blue,
        );
      },
    );
  }
}
