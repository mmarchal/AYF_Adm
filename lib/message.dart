import 'package:ayf_admin/models/custom_drawer.dart';
import 'package:ayf_admin/models/custom_text.dart';
import 'package:flutter/material.dart';

class Message extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new _Message();
  }
}

class _Message extends State<Message> {

  final String nom = "Message pour Max";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: CustomText(nom, factor: 1.25,),
        centerTitle: true,
      ),
      drawer: AppDrawer(value: nom,),
    );
  }

}