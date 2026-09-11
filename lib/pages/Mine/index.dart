import 'package:flutter/material.dart';

class MienView extends StatefulWidget {
  MienView({Key? key}) : super(key: key);

  @override
  _MienViewState createState() => _MienViewState();
}

class _MienViewState extends State<MienView> {
  final String _nickname = '一二三三';
  final String _userId = 'ID: 88888888';
  final String _signature = '简约生活，从心开始';

  final List<Map<String, String>> _stats = [
    {"label": "收藏", "value": "12"},
    {"label": "关注", "value": "28"},
    {"label": "足迹", "value": "56"},
    {"label": "优惠券", "value": "5"},
  ];

  final List<Map<String, dynamic>> _orders = [
    {"icon": Icons.payment, "title": "待付款"},
    {"icon": Icons.local_shipping, "title": "待发货"},
    {"icon": Icons.inventory_2, "title": "待收货"},
    {"icon": Icons.rate_review, "title": "待评价"},
    {"icon": Icons.support_agent, "title": "售后"},
  ];

  final List<Map<String, dynamic>> _menus = [
    {"icon": Icons.location_on, "title": "收货地址"},
    {"icon": Icons.card_giftcard, "title": "优惠券"},
    {"icon": Icons.workspace_premium, "title": "会员中心"},
    {"icon": Icons.headset_mic, "title": "联系客服"},
    {"icon": Icons.settings, "title": "设置"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F6FA),
      child: ListView(
        children: [
          _buildHeader(),
          _buildOrderCard(),
          _buildMenuCard(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // Text(
  //   _nickname,
  //   style: const TextStyle(
  //     color: Colors.white,
  //     fontSize: 20,
  //     fontWeight: FontWeight.bold,
  //   ),
  // ),

  Widget _isLogin(bool isLogin) {
    if (isLogin) {
      return Text(
        _nickname,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      );
    } else {
      return TextButton(
        child: Text('去登陆'),
        onPressed: () {
          Navigator.pushNamed(context, '/login');
        },
      );
    }
  }

  Widget _buildHeader() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF5B9BFF), Color(0xFF3A86FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      margin: EdgeInsets.all(10),
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 34,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 40, color: Color(0xFF3A86FF)),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _isLogin(false),

                    const SizedBox(height: 4),
                    Text(
                      _userId,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _signature,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: _stats.map((item) {
              return Expanded(
                child: Column(
                  children: [
                    Text(
                      item["value"]!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item["label"]!,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildOrderCard() {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _buildCardTitle('我的订单', '查看全部'),
          const Divider(height: 1, color: Color(0xFFF0F0F0)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: _orders.map((item) {
                return Expanded(
                  child: Column(
                    children: [
                      Icon(
                        item["icon"] as IconData,
                        size: 26,
                        color: const Color(0xFF3A86FF),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item["title"] as String,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard() {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: _menus.map((item) {
          return Column(
            children: [
              ListTile(
                leading: Icon(item["icon"] as IconData, color: Colors.blue),
                title: Text(
                  item["title"] as String,
                  style: const TextStyle(fontSize: 15),
                ),
                trailing: const Icon(
                  Icons.chevron_right,
                  color: Colors.black26,
                ),
                onTap: () {},
              ),
              if (item != _menus.last)
                const Divider(height: 1, indent: 56, color: Colors.grey),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCardTitle(String title, String action) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Text(
                action,
                style: const TextStyle(fontSize: 13, color: Colors.black45),
              ),
              const Icon(Icons.chevron_right, size: 18, color: Colors.black26),
            ],
          ),
        ],
      ),
    );
  }
}
