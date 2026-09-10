import 'package:flutter/material.dart';
import 'package:my_shop/viewmodels/home.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Homeslider extends StatefulWidget {
  final List<BannerItem> bannerItems;
  Homeslider({Key? key, required this.bannerItems}) : super(key: key);

  @override
  _HomesliderState createState() => _HomesliderState();
}

class _HomesliderState extends State<Homeslider> {
  CarouselSliderController _carouselController = CarouselSliderController();
  int _currentIndex = 0;
  Widget _getSlider() {
    final double screeWidth = MediaQuery.of(context).size.width;
    return Container(
      child: CarouselSlider(
        carouselController: _carouselController,
        items: List.generate(widget.bannerItems.length, (int i) {
          return Image.network(
            widget.bannerItems[i].imageUrl ?? '',
            fit: BoxFit.cover,
            width: screeWidth,
          );
        }),
        options: CarouselOptions(
          height: 300,
          autoPlay: true,
          viewportFraction: 1,
          onPageChanged: (index, reason) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }

  // 顶部搜索栏圆角半透明
  Widget _getSearchBar() {
    return Positioned(
      top: 10,
      left: 0,
      right: 0,
      height: 50,
      child: Padding(
        padding: EdgeInsetsGeometry.all(10),

        child: Container(
          alignment: Alignment.centerLeft,
          height: 50,
          // 顶部搜索栏圆角半透明
          decoration: BoxDecoration(
            color: const Color.fromRGBO(0, 0, 0, 0.4),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            ' 搜索',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }

  Widget _getDots() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 10,
      child: SizedBox(
        height: 10,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.bannerItems.length, (int i) {
            return GestureDetector(
              onTap: () {
                _carouselController.jumpToPage(i);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: i == _currentIndex ? 40 : 20,
                height: 6,
                margin: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: i == _currentIndex
                      ? Colors.white
                      : Color.fromRGBO(0, 0, 0, 0.4),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_getSlider(), _getSearchBar(), _getDots()]);
  }
}
