import 'package:ayf_admin/models/custom_drawer.dart';
import 'package:ayf_admin/models/custom_text.dart';
import 'package:flutter/material.dart';

class Gestion extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _Gestion();
  }
}

class _Gestion extends State<Gestion> {

  final String nom = "Gestion des pronostics";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: CustomText(nom, factor: 1.25,),
        centerTitle: true,
      ),
      drawer: AppDrawer(value: nom),
    );
  }

}