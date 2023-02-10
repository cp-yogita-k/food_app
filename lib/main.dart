import 'package:flutter/material.dart';
import 'login_page.dart';

Future<void> main() async {
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
    return MaterialApp.router();
  }
}
