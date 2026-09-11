import 'package:flutter/material.dart';

import 'package:my_shop/components/Home/HomeSlider.dart';
import 'package:my_shop/components/Home/HomeCategory.dart';
import 'package:my_shop/components/Home/HomeHots.dart';
import 'package:my_shop/components/Home/HomeSuggestion.dart';
import 'package:my_shop/components/Home/HomeMoreList.dart';

import 'package:my_shop/viewmodels/home.dart';

import 'package:my_shop/api/home.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<BannerItem> _bannerItems = [];
  List<CategoryItem> _categoryItems = [];
  FlashSaleRecommend _flashSaleRecommendItems = FlashSaleRecommend(
    id: "",
    title: "",
    subTypes: [],
  );
  FlashSaleRecommend _hotInVogueItems = FlashSaleRecommend(
    id: "",
    title: "",
    subTypes: [],
  );
  FlashSaleRecommend _hotOnestopItems = FlashSaleRecommend(
    id: "",
    title: "",
    subTypes: [],
  );
  List<HotRecommendItem> _hotRecommendItems = [];

  List<Widget> _getScrollChildren() {
    // 首页轮播图
    return [
      SliverToBoxAdapter(child: Homeslider(bannerItems: _bannerItems)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: HomeCategory(categoryItems: _categoryItems)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: Homesuggestion(
          flashSaleRecommendItems: _flashSaleRecommendItems,
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              child: HomeHots(result: _hotInVogueItems, type: 'hot'),
            ),
            SizedBox(width: 10),
            Expanded(
              child: HomeHots(result: _hotOnestopItems, type: 'step'),
            ),
          ],
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // hotRecommendItems: _hotRecommendItems
      HomeMoreList(hotRecommendItems: _hotRecommendItems),
    ];
  }

  void initState() {
    super.initState();
    _getBannerList();
    _getCategoryList();
    _getFlashSaleRecommendList();
    _getHotInVogueItems();
    _getHotOnestopItems();
    _getHotRecommendItems();
  }

  void _getBannerList() async {
    _bannerItems = await getBannerItems();
    setState(() {});
  }

  void _getCategoryList() async {
    _categoryItems = await getCategoryItems();
    setState(() {});
  }

  void _getFlashSaleRecommendList() async {
    _flashSaleRecommendItems = await getFlashSaleRecommendItems();

    setState(() {});
  }

  void _getHotInVogueItems() async {
    _hotInVogueItems = await getHotInVogueItems();
    setState(() {});
  }

  void _getHotOnestopItems() async {
    _hotOnestopItems = await getHotOnestopItems();
    setState(() {});
  }

  void _getHotRecommendItems() async {
    _hotRecommendItems = await getHotRecommendItems({"limit": 10});

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScrollChildren());
  }
}
