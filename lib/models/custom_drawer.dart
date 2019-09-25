import 'package:ayf_admin/ajout.dart';
import 'package:ayf_admin/gestion.dart';
import 'package:ayf_admin/menu.dart';
import 'package:ayf_admin/message.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {

  final String value;

  AppDrawer({Key key, @required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: FlutterLogo(),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          containerWithNumber(context, "Menu", 0, Icons.desktop_mac),
          containerWithNumber(context, "Ajouter un pronostic", 1, Icons.add),
          containerWithNumber(context, "Gestion des pronostics", 2, Icons.gesture),
          containerWithNumber(context, "Message pour Max", 3, Icons.mail)
        ],
      ),
    );
  }

  Widget containerWithNumber(BuildContext context, String titre, int redirection, IconData icone) {
    return Container(
      color: (this.value==titre) ? Colors.blue : Colors.transparent,
      child: ListTile(
        leading: Icon(icone, color: (this.value==titre) ? Colors.white : Colors.grey.shade800),
        title: Text(titre, style: TextStyle(color: (this.value==titre) ? Colors.white : Colors.black),),
        onTap: () {
          Navigator.push(context, new MaterialPageRoute(builder: (BuildContext bC) {
            switch (redirection) {
              case 0 :
                return new Menu();
                break;
              case 1 :
                return new Ajout();
                break;
              case 2 :
                return new Gestion();
                break;
              case 3 :
                return new Message();
                break;
              default :
                return new Menu();
                break;
            }
          }));
        },
      ),
    );
  }
}