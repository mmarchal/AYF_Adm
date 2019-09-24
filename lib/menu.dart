import 'package:ayf_admin/message.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Menu();
  }
}

class _Menu extends State<Menu> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Menu"),
        centerTitle: true,
      ),
      body: new Center(

      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: FlutterLogo(),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            ListTile(
              leading: Icon(Icons.desktop_mac),
              title: Text('Menu'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Ajouter un pronostic'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.gesture),
              title: Text('Gestion base de données'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.mail),
              title: Text('Message pour Max'),
              onTap: () {
                Navigator.push(context, new MaterialPageRoute(builder: (BuildContext bC){
                  return new Message();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }

}