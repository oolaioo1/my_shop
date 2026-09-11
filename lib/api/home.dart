import 'package:my_shop/contants/index.dart';
import 'package:my_shop/viewmodels/home.dart';
import 'package:my_shop/utils/DioRequest.dart';

//4.定义获取轮播图列表接口
Future<List<BannerItem>> getBannerItems() async {
  return (await dioRequest.get(HttpConstants.BANNER_LIST) as List).map((item) {
    return BannerItem.fromJson(item as Map<String, dynamic>);
  }).toList();
}

// 分类列表
Future<List<CategoryItem>> getCategoryItems() async {
  return (await dioRequest.get(HttpConstants.CATEGORY_LIST) as List).map((
    item,
  ) {
    return CategoryItem.fromJson(item as Map<String, dynamic>);
  }).toList();
}

// 特惠推荐
// FlashSaleRecommend
Future<FlashSaleRecommend> getFlashSaleRecommendItems() async {
  return FlashSaleRecommend.fromJson(
    await dioRequest.get(HttpConstants.PRODUCT_LIST),
  );
}

Future<FlashSaleRecommend> getHotInVogueItems() async {
  return FlashSaleRecommend.fromJson(
    await dioRequest.get(HttpConstants.HOT_INVOGUE),
  );
}

Future<FlashSaleRecommend> getHotOnestopItems() async {
  return FlashSaleRecommend.fromJson(
    await dioRequest.get(HttpConstants.HOT_ONESTOP),
  );
}

Future<List<HotRecommendItem>> getHotRecommendItems(
  Map<String, dynamic> params,
) async {
  final list =
      await dioRequest.get(HttpConstants.HOT_RECOMMEND, params: params) as List;
  return list.map((item) {
    return HotRecommendItem.fromJson(item as Map<String, dynamic>);
  }).toList();
}
