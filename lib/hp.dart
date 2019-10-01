import 'package:ayf_admin/ajout.dart';
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
      backgroundColor: Colors.black,
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
                CustomText("Alex & Yann & Fab\nParis sportifs", factor: 2.0,),

              ]),
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