import 'package:flutter/material.dart';
import 'package:my_shop/pages/Main/index.dart';
import 'package:my_shop/pages/Login/index.dart';


Widget getRootWidget() {
  return MaterialApp(routes: getRootRoutes());
}

Map<String, Widget Function(BuildContext)> getRootRoutes() {
  return {
    "/": (context) => MainPage(), 
  "/login": (context) => LoginPage()
  };
}
