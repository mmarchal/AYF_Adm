import 'package:ayf_admin/ajout.dart';
import 'package:ayf_admin/models/custom_drawer.dart';
import 'package:ayf_admin/models/custom_text.dart';
import 'package:ayf_admin/models/pronostic.dart';
import 'package:ayf_admin/models/simpleroundbutton.dart';
import 'package:flutter/material.dart';

class CheckSend extends StatefulWidget {

  CheckSend({Key key, this.pronostic}) : super(key: key);
  final Pronostic pronostic;

  @override
  State<StatefulWidget> createState() {
    return _CheckSend();
  }
}

class _CheckSend extends State<CheckSend> {

  String nom = "Publication Facebook";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: CustomText(nom, factor: 1.25,),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width/1.5,
              child: CustomText("Pronostic envoyé en base de données !", factor: 2.5, color: Colors.green,)
            ),
            SizedBox(height: 30.0,),
            Container(
              margin: EdgeInsets.only(left: 20.0, right: 20.0),
              decoration: BoxDecoration(
                border: Border.all(width: 5.0, color: Colors.black),
                borderRadius: BorderRadius.circular(50.0),
                color: Colors.blue.shade600,
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width/4,
                        child: Image.asset("assets/facebook.png", fit: BoxFit.cover,),
                      ),
                      CustomText("Voici la publication Facebook", factor: 1.5,)
                    ],
                  ),
                  SizedBox(height: 30.0,),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Text("""
                      Salut l équipe ;)
                      Match : ${widget.pronostic.match_prono}
                      Pronostic : ${widget.pronostic.pronostic} => ${widget.pronostic.cote}
                      Bonne chance à tous !!
                    """, style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
                  ),
                  SizedBox(height: 30.0,),
                  SimpleRoundIconButton(
                    buttonText: CustomText("Publier !", factor: 2.0,),
                    icon: Icon(Icons.check),
                    backgroundColor: Colors.blue.shade900,
                    onPressed: () {
                      Navigator.push(context, new MaterialPageRoute(builder: (BuildContext bC){
                        return new Ajout();
                      }));
                    },
                  )
                ],
              ),
            ),
            SizedBox(height: 30.0,),
            SimpleRoundIconButton(
              buttonText: CustomText("Retour", factor: 2.0,),
              icon: Icon(Icons.backspace),
              backgroundColor: Colors.red.shade900,
              onPressed: () {

              },
            )
          ],
        ),
      ),
      drawer: AppDrawer(value: nom,),
    );
  }
}