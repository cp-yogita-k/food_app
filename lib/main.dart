import 'package:flutter/material.dart';
import 'package:navi2_0/List_food.dart';
import 'package:navi2_0/ragister_page.dart';
import 'package:navi2_0/route/route.dart';

import 'login_page.dart';

void main() {
  runApp(MaterialApp(home:
    login(),));
  }

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // routeInformationParser: MyRoute().router.routeInformationParser,
      // routerDelegate: MyRoute().router.routerDelegate,
        );
  }
}
