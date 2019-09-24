import 'package:ayf_admin/menu.dart';
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
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            centerTitle: true,
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlutterLogo(size: MediaQuery.of(context).size.width/3.5,),
                    champAuth(0, "Nom d'utilisateur"),
                    champAuth(1, "Mot de passe"),
                    SimpleRoundIconButton(
                      backgroundColor: Theme.of(context).primaryColor,
                      buttonText: Text("CONNEXION", style: TextStyle(
                          color: Colors.white
                      ),),
                      textColor: Colors.white,
                      icon: Icon(Icons.check),
                      iconAlignment: Alignment.centerRight,
                      onPressed: () {

                      },
                    ),
                    SimpleRoundIconButton(
                      backgroundColor: Colors.green,
                      buttonText: Text("EMPREINTE DIGITALE", style: TextStyle(
                          color: Colors.white
                      ),),
                      textColor: Colors.white,
                      icon: Icon(Icons.arrow_forward),
                      onPressed: _authenticate,
                    ),
                  ]),
            ),
          ),
        ));
  }

  void changementPage() {
    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext bC){
      return new Menu();
    }));
  }
}