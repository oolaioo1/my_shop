import 'package:flutter/material.dart';
import 'package:my_shop/viewmodels/home.dart';

class HomeMoreList extends StatefulWidget {
  final List<HotRecommendItem> hotRecommendItems;

  HomeMoreList({Key? key, required this.hotRecommendItems}) : super(key: key);

  @override
  _HomeMoreListState createState() => _HomeMoreListState();
}

class _HomeMoreListState extends State<HomeMoreList> {
  Widget _getChildern(int index) {
    return Container(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: AspectRatio(
              aspectRatio: 1.0,
              child: Image.network(
                widget.hotRecommendItems[index].picture ?? '',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset('lib/assets/images/cart.jpeg');
                },
              ),
            ),
          ),
          SizedBox(height: 6),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              widget.hotRecommendItems[index].name ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
          SizedBox(height: 6),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "￥${widget.hotRecommendItems[index].price}",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                      fontWeight: FontWeight.w800,
                    ),
                    children: [
                      TextSpan(text: ''),
                      TextSpan(
                        text: '￥${widget.hotRecommendItems[index].price}',
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      TextSpan(
                        text: "  ",

                        // text: "${widget.hotRecommendItems[index].payCount ?? '0'}人付款",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // color: Colors.blue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.75,
      ),
      itemCount: widget.hotRecommendItems.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: _getChildern(index),
        );
      },
    );
  }
}
