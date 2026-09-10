import 'package:flutter/material.dart';

import 'package:my_shop/components/Home/HomeSlider.dart';
import 'package:my_shop/components/Home/HomeCategory.dart';
import 'package:my_shop/components/Home/HomeHots.dart';
import 'package:my_shop/components/Home/HomeSuggestion.dart';
import 'package:my_shop/components/Home/HomeMoreList.dart';

import 'package:my_shop/viewmodels/home.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<BannerItem> _bannerItems = [
    BannerItem(
      id: '1',
      imageUrl:
          'https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/1.jpg',
    ),
    BannerItem(
      id: '2',
      imageUrl:
          'https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/3.jpg',
    ),
    BannerItem(
      id: '3',
      imageUrl:
          'https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/3.jpg',
    ),
  ];

  List<Widget> _getScrollChildren() {
    // 首页轮播图
    return [
      SliverToBoxAdapter(child: Homeslider(bannerItems: _bannerItems)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: HomeCategory()),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: Homesuggestion()),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(child: HomeHots()),
            SizedBox(width: 10),
            Expanded(child: HomeHots()),
          ],
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      HomeMoreList(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScrollChildren());
  }
}
