import 'package:flutter/material.dart';
import 'package:my_shop/viewmodels/home.dart';

class HomeCategory extends StatefulWidget {
  final List<CategoryItem> categoryItems;
  HomeCategory({Key? key, required this.categoryItems}) : super(key: key);

  @override
  _HomeCategoryState createState() => _HomeCategoryState();
}

class _HomeCategoryState extends State<HomeCategory> {
  List<CategoryItem> categoryItems = [];

  @override
  Widget build(BuildContext context) {
    categoryItems = widget.categoryItems;
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: categoryItems.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          CategoryItem item = categoryItems[index];
          return Container(
            alignment: Alignment.center,
            width: 100,
            height: 100,
            margin: EdgeInsetsGeometry.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 216, 216, 216),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              children: [
                Image.network(item.picture ?? '', fit: BoxFit.cover, width: 50),
                Text(
                  item.name ?? '',
                  maxLines: 1,
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
