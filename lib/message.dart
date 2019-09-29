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
      body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Icon(
                Icons.account_circle,
                size: MediaQuery.of(context).size.width/4,
                color: Colors.blue,
              ),
              new Container(
                width: MediaQuery.of(context).size.width/2,
                child: new TextFormField(
                  decoration: const InputDecoration(hintText: "Nom : "),
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
              new Container(
                width: MediaQuery.of(context).size.width,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Container(
                      margin: EdgeInsets.only(top: 30.0),
                      child: new Text("Message: ", textScaleFactor: 1.5, style: TextStyle(color: Colors.blue),),
                    ),
                    Container(
                      margin: EdgeInsets.all(8.0),
                      padding: EdgeInsets.only(bottom: 40.0),
                      child: TextField(
                        maxLines: 10,
                        cursorColor: Colors.blue,
                        decoration: InputDecoration(
                          hintText: "Comment!",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              new RaisedButton(
                onPressed: () {
                  print("Appuyé");
                },
                color: Colors.blue,
                child: new Text("Envoyer", style: TextStyle(color: Colors.white),),
              )
            ],
          )
      ),
      drawer: AppDrawer(value: nom,),
    );
  }

}