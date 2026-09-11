class BannerItem {
  String? id;
  String? imageUrl;
  BannerItem({required this.id, required this.imageUrl});
  //3.定义工厂方法
  // 从JSON字符串创建BannerItem对象 因为接口和定义数据有差异需要进行兼容
  factory BannerItem.fromJson(Map<String, dynamic> json) {
    return BannerItem(id: json['id'] ?? "", imageUrl: json['imageUrl'] ?? "");
  }
}

class CategoryItem {
  String? id;
  String? name;
  String? picture;
  List<dynamic>? children;
  List<dynamic>? goods;

  CategoryItem({
    required this.id,
    required this.name,
    required this.picture,
    this.children,
    this.goods,
  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      id: json['id'],
      name: json['name'],
      picture: json['picture'],
      children: json['children'] == null
          ? null
          : (json['children'] as List).map((item) {
              return CategoryItem.fromJson(item as Map<String, dynamic>);
            }).toList(),
      goods: json['goods'],
    );
  }
}
// []
//根据json数据编写class对象和工厂转化函数

class FlashSaleRecommend {
  String? id;
  String? title;
  List<FlashSaleSubType>? subTypes;

  FlashSaleRecommend({required this.id, required this.title, this.subTypes});

  factory FlashSaleRecommend.fromJson(Map<String, dynamic> json) {
    return FlashSaleRecommend(
      id: json['id'],
      title: json['title'],
      subTypes: json['subTypes'] == null
          ? null
          : (json['subTypes'] as List)
                .map(
                  (item) =>
                      FlashSaleSubType.fromJson(item as Map<String, dynamic>),
                )
                .toList(),
    );
  }
}

class FlashSaleSubType {
  String? id;
  String? title;
  FlashSaleGoodsItems? goodsItems;

  FlashSaleSubType({required this.id, required this.title, this.goodsItems});

  factory FlashSaleSubType.fromJson(Map<String, dynamic> json) {
    return FlashSaleSubType(
      id: json['id'],
      title: json['title'],
      goodsItems: json['goodsItems'] == null
          ? null
          : FlashSaleGoodsItems.fromJson(
              json['goodsItems'] as Map<String, dynamic>,
            ),
    );
  }
}

class FlashSaleGoodsItems {
  int? counts;
  int? pageSize;
  int? pages;
  int? page;
  List<FlashSaleGoodsItem>? items;

  FlashSaleGoodsItems({
    this.counts,
    this.pageSize,
    this.pages,
    this.page,
    this.items,
  });

  factory FlashSaleGoodsItems.fromJson(Map<String, dynamic> json) {
    return FlashSaleGoodsItems(
      counts: json['counts'],
      pageSize: json['pageSize'],
      pages: json['pages'],
      page: json['page'],
      items: json['items'] == null
          ? null
          : (json['items'] as List)
                .map(
                  (item) =>
                      FlashSaleGoodsItem.fromJson(item as Map<String, dynamic>),
                )
                .toList(),
    );
  }
}

class FlashSaleGoodsItem {
  String? id;
  String? name;
  String? desc;
  String? price;
  String? picture;
  int? orderNum;

  FlashSaleGoodsItem({
    required this.id,
    required this.name,
    this.desc,
    required this.price,
    required this.picture,
    this.orderNum,
  });

  factory FlashSaleGoodsItem.fromJson(Map<String, dynamic> json) {
    return FlashSaleGoodsItem(
      id: json['id'],
      name: json['name'],
      desc: json['desc'],
      price: json['price'],
      picture: json['picture'],
      orderNum: json['orderNum'],
    );
  }
}

// 根据json数据编写class对象和工厂转化函数
class HotRecommendItem extends FlashSaleGoodsItem {
  int payCount = 0;

  HotRecommendItem({
    required super.id,
    required super.name,
    required super.price,
    required super.picture,
    required this.payCount,
  }) : super(desc: "");

  factory HotRecommendItem.fromJson(Map<String, dynamic> json) {
    return HotRecommendItem(
      id: json['id'],
      name: json['name'],
      price: json['price']?.toString(),
      picture: json['picture'],
      payCount: json['payCount'],
    );
  }
}
