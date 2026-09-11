import 'package:flutter/material.dart';
import 'package:my_shop/viewmodels/home.dart';

class Homesuggestion extends StatefulWidget {
  final FlashSaleRecommend flashSaleRecommendItems;

  const Homesuggestion({Key? key, required this.flashSaleRecommendItems})
    : super(key: key);

  @override
  _HomesuggestionState createState() => _HomesuggestionState();
}

class _HomesuggestionState extends State<Homesuggestion> {
  List<dynamic> _goodsItems() {
    if (widget.flashSaleRecommendItems.subTypes?.isEmpty ?? true) return [];
    // ?.first.goodsItems?.items
    // 取前3个断言能取到值
    return widget.flashSaleRecommendItems.subTypes?.first.goodsItems?.items!
            .take(3)
            .toList() ??
        [];
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Text(
          "特惠推荐",
          style: TextStyle(
            fontSize: 24,
            color: const Color.fromARGB(255, 86, 24, 20),
          ),
        ),
        SizedBox(width: 10),
        Text(
          "精选省攻略",
          style: TextStyle(
            fontSize: 12,
            color: const Color.fromARGB(255, 86, 24, 20),
          ),
        ),
      ],
    );
  }

  Widget _buildLeft() {
    return Container(
      width: 100,
      height: 140,
      margin: EdgeInsets.only(left: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // 半透明红色
        color: Colors.red.withOpacity(0.5),
        // image:DecorationImage(image: AssetImage("assets/images/flash_sale_recommend.png"))
      ),
    );
  }

  List<Widget> _getChildrenList() {
    List<dynamic> goodsItems = _goodsItems();
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
        border: Border.all(color: Colors.red),
      ),
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          _buildHeader(),
          SizedBox(height: 10),
          Row(
            children: [
              _buildLeft(),
              SizedBox(width: 10),
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
