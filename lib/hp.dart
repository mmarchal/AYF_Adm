import 'package:ayf_admin/ajout.dart';
import 'package:ayf_admin/gestion.dart';
import 'package:ayf_admin/message.dart';
import 'package:ayf_admin/models/custom_drawer.dart';
import 'package:ayf_admin/models/custom_text.dart';
import 'package:ayf_admin/models/simpleroundbutton.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool inputIsValid = true;
  String username = "";
  String password = "";
  final LocalAuthentication auth = LocalAuthentication();

  Widget champAuth(int i, String label) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: new TextField(
        decoration: new InputDecoration(
          labelText: label,
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: new BorderSide(
            ),
          ),
        ),
        onChanged: (String str) {
          setState(() {
            if(i==0) {
              username = str;
            } else {
              password = str;
            }
          });
        },
        keyboardType: TextInputType.emailAddress,
        style: new TextStyle(
          fontFamily: "Poppins",
        ),
      ),
    );
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticateWithBiometrics(
          localizedReason: 'Scan your fingerprint to authenticate',
          useErrorDialogs: true,
          stickyAuth: true);
      changementPage();
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade300,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                /*FlatButton(
                    onPressed: _authenticate,
                    padding: EdgeInsets.all(0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset('assets/finger.png', width: MediaQuery.of(context).size.width/2,),
                        SizedBox(height: 20.0,),
                        CustomText("Clique sur l'empreinte !", color: Colors.blue, factor: 3.0,)
                      ],
                    )
                )*/
                Image.asset("assets/cover.jpg", fit: BoxFit.contain,),
                SizedBox(height: 20.0,),
                CustomText("Alex & Yann & Fab\nParis sportifs", factor: 2.0,),
                SizedBox(height: 20.0,),
                RaisedButton(
                    color: Colors.white,
                    child: new Container(
                      width: MediaQuery.of(context).size.width/1.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Image.asset("assets/soccer.png", width: MediaQuery.of(context).size.width/5,),
                          CustomText("Ajouter un pronostic",factor: 1.8, color: Colors.blue,)
                        ],
                      ),
                    ),
                    shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                    onPressed: () {
                      Navigator.push(context, new MaterialPageRoute(builder: (BuildContext bC){
                        return new Ajout();
                      }));
                    }
                ),
                SizedBox(height: 30.0,),
                RaisedButton(
                    color: Colors.white,
                    child: new Container(
                      width: MediaQuery.of(context).size.width/1.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          CustomText("Gestion des pronos", factor: 1.8, color: Colors.blue,),
                          Image.asset("assets/tennis.png", width: MediaQuery.of(context).size.width/7,),
                        ],
                      ),
                    ),
                    shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                    onPressed: () {
                      Navigator.push(context, new MaterialPageRoute(builder: (BuildContext bC){
                        return new Gestion();
                      }));
                    }
                ),
                SizedBox(height: 30.0,),
                RaisedButton(
                    color: Colors.white,
                    child: new Container(
                      width: MediaQuery.of(context).size.width/1.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Image.asset("assets/basket.png", width: MediaQuery.of(context).size.width/7,),
                          CustomText("Contact Max", factor: 1.8, color: Colors.blue,)
                        ],
                      ),
                    ),
                    shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                    onPressed: () {
                      Navigator.push(context, new MaterialPageRoute(builder: (BuildContext bC){
                        return new Message();
                      }));
                    }
                ),
              ]
          ),
        ),
      ),
    );
  }

  void changementPage() {
    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext bC){
      return new Ajout();
    }));
  }
}