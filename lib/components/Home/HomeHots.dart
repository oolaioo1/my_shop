import 'package:flutter/material.dart';
import 'package:my_shop/viewmodels/home.dart';

class HomeHots extends StatefulWidget {
  final FlashSaleRecommend result;
  final String type;
  HomeHots({Key? key, required this.result, required this.type})
    : super(key: key);

  @override
  _HomeHotsState createState() => _HomeHotsState();
}

class _HomeHotsState extends State<HomeHots> {
  List<dynamic> _goodsItems() {
    if (widget.result.subTypes?.isEmpty ?? true) return [];
    // ?.first.goodsItems?.items
    // 取前3个断言能取到值
    return widget.result.subTypes?.first.goodsItems?.items!.take(2).toList() ??
        [];
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Text(
          widget.result.title ?? '',
          style: TextStyle(
            fontSize: 24,
            color: const Color.fromARGB(255, 86, 24, 20),
          ),
        ),
        SizedBox(width: 10),
        Text(
          widget.type == 'hot' ? '最受欢迎' : '精心优选',
          style: TextStyle(
            fontSize: 12,
            color: const Color.fromARGB(255, 86, 24, 20),
          ),
        ),
      ],
    );
  }

  List<Widget> _getChildrenList() {
    List<dynamic> goodsItems = _goodsItems();
    print(goodsItems);
    return List.generate(goodsItems.length, (int index) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),

        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset('lib/assets/images/cart.jpeg');
                },
                goodsItems[index].picture ?? '',
                width: 100,
                height: 140,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromARGB(255, 240, 96, 12),
              ),
              child: Text(
                "￥${goodsItems[index].price ?? ''}",
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
          ],
        ),
      );
    });
    // return [];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // height: 300,
      // color: Colors.blue,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: widget.type == 'hot'
            ? Colors.blue
            : const Color.fromARGB(255, 114, 170, 81),
        // border: Border.all(color: Colors.red),
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),

      child: Column(
        children: [
          _buildHeader(),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _getChildrenList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
