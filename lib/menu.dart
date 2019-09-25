import 'package:ayf_admin/models/custom_drawer.dart';
import 'package:ayf_admin/models/custom_text.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Menu();
  }
}

class _Menu extends State<Menu> {

  final String nom = "Menu";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: CustomText(nom, factor: 1.25,),
        centerTitle: true,
      ),
      body: new Center(

      ),
      drawer: AppDrawer(value: nom,),
    );
  }

}