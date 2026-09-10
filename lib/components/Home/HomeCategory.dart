import 'package:flutter/material.dart';

class HomeCategory extends StatefulWidget {
  HomeCategory({Key? key}) : super(key: key);

  @override
  _HomeCategoryState createState() => _HomeCategoryState();
}


class _HomeCategoryState extends State<HomeCategory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 10),
            width: 100,
            height: 100,
            color: Colors.blue,
            child: Text('分类 $index'),
          );
        },
      ),
    );
  }
}
