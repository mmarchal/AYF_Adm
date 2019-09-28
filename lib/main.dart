import 'package:ayf_admin/hp.dart';
import 'package:ayf_admin/menu.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AYF Admin',
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      debugShowCheckedModeBanner: false,
      // home: MyHomePage(title: 'AYF Admin'),
      home: Menu(),
    );
  }
}
