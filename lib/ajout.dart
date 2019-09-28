import 'package:ayf_admin/models/custom_drawer.dart';
import 'package:ayf_admin/models/custom_text.dart';
import 'package:ayf_admin/models/pronostic.dart';
import 'package:ayf_admin/models/simpleroundbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class Ajout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _Ajout();
  }
}

class _Ajout extends State<Ajout> {

  final String nom = "Ajouter un pronostic";
  final List<String> tableaux = ["Football", "Tennis", "BasketBall"];
  final List<String> bookmakers = ["Alex", "Yann", "Fabien"];
  final List<String> images = ["assets/soccer.png", "assets/tennis.png", "assets/basket.png"];
  final List<int> radios = [0, 1, 2];

  int _radioVal = 0;
  bool dateChoisi = false;
  bool switchValue = false;
  DateTime date;
  String bookmakerSelection;
  String sportSelection;
  String matchSelection;
  String pronoSelection;
  double coteSelection;
  String explicationSelection;

  var couleurDateChoisi = Colors.red;
  final f = new DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    var couleurProno = Theme.of(context).primaryColor;
    return new Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: new AppBar(
        elevation: 0.0,
        title: CustomText(nom, factor: 1.25,),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: (MediaQuery.of(context).size.width*5 / MediaQuery.of(context).size.height/3),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children : enumerate(
                      tableaux,
                          (index, item) {
                        String image = images[index];
                        int rad = radios[index];
                        return Card(
                          color: couleurProno,
                          elevation: 10.0,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Image.asset(image, height: MediaQuery.of(context).size.height/11,),
                                Radio(
                                    activeColor: Colors.blue.shade900,
                                    value: rad,
                                    groupValue: this._radioVal,
                                    onChanged: (int val) {
                                      setState(() {
                                        this._radioVal = val;
                                        couleurProno = Colors.green;
                                      });
                                    }
                                )
                              ],
                            ),
                          ),
                        );
                      }
                  ).toList(),
                ),
              ),
              SizedBox(height: 30.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomText("Bookmaker : ", factor: 1.5,),
                  DropdownButton(
                      value: bookmakerSelection,
                      hint: CustomText("Choix", factor: 1.3,),
                      items: bookmakers
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: CustomText(value, color: Colors.black, factor: 1.5,),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          bookmakerSelection = value;
                        });
                      }
                  )
                ],
              ),
              SizedBox(height: 30.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomText("Date du match : ", color: Colors.white, factor: 1.3,),
                  Visibility(
                      visible: dateChoisi,
                      child: Container(
                        margin: EdgeInsets.all(20.0),
                        child: CustomText((date != null) ? f.format(date) : "Rien", factor: 1.3,),)
                  ),
                  RaisedButton(
                    color: couleurDateChoisi,
                    child: CustomText("Choisi"),
                    onPressed: () {
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime: DateTime(2000, 1, 1),
                          maxTime: DateTime(2022, 12, 31),
                          onConfirm: (dateConfirm) {
                            setState(() {
                              couleurDateChoisi = Colors.green;
                              date = dateConfirm;
                              dateChoisi = true;
                            });
                          },
                          currentTime: DateTime.now(), locale: LocaleType.fr);},
                  ),
                ],
              ),
              SizedBox(height: 30.0,),
              champRow(0, "Match"),
              SizedBox(height: 30.0,),
              champRow(1, "Pronostic"),
              SizedBox(height: 30.0,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CustomText("Explication : ", factor: 1.3,),
                      CustomText("Non", factor: 1.3,),
                      Switch(
                          value: switchValue,
                          onChanged: (bool b) {
                            setState(() {
                              switchValue = b;
                            });
                          }
                      ),
                      CustomText("Oui", factor: 1.3,),
                    ],
                  ),
                  Visibility(
                    visible: switchValue,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Explication"
                      ),
                      maxLines: 2,
                    )
                  )
                ],
              ),
              SizedBox(height: 30.0,),
              champRow(2, "Côte"),
              Container(
                width: MediaQuery.of(context).size.width/1.5,
                child: SimpleRoundIconButton(
                  backgroundColor: Colors.green,
                  buttonText: Text("Envoyer !", maxLines: 3, style: TextStyle(
                      color: Colors.white
                  ),),
                  textColor: Colors.white,
                  icon: Icon(Icons.check_box),
                  onPressed: () {
                    Pronostic p = new Pronostic(null, bookmakerSelection, tableaux[this._radioVal], f.format(date), matchSelection, pronoSelection, coteSelection, explicationSelection, null);
                    print(p.toJson());
                    showDialog(
                      context: context,
                      builder: (BuildContext bC) => AlertDialog(
                        title: CustomText("Verification", color: Colors.black, factor: 1.5,),
                        content: Column(
                          children: <Widget>[
                            CustomText(bookmakerSelection, color: Colors.black,),
                            CustomText(tableaux[this._radioVal], color: Colors.black,),
                            CustomText(f.format(date), color: Colors.black,),
                            CustomText((matchSelection==null) ? "null" : matchSelection, color: Colors.black,),
                            CustomText((pronoSelection==null) ? "null" : pronoSelection, color: Colors.black,),
                            CustomText((coteSelection==null) ? "null" : coteSelection.toString(), color: Colors.black,),
                            CustomText((explicationSelection==null) ? "null" : explicationSelection, color: Colors.black,),
                          ],
                        ),
                      )
                    );
                    //recupDatas();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: AppDrawer(value: nom),
    );
  }

  Widget champRow(int index, String texte) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CustomText("$texte : ", factor: 1.3,),
        Container(
            width: MediaQuery.of(context).size.width/2,
            height: 40.0,
            child: TextField(
              keyboardType: (index==2) ? TextInputType.number : TextInputType.text,
              decoration: InputDecoration(
                  labelText: texte,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  )
              ),
              onChanged: (String str) {
                setState(() {
                  switch (index) {
                    case 0 :
                      matchSelection = str;
                      break;
                    case 1 :
                      pronoSelection = str;
                      break;
                    case 2 :
                      coteSelection = double.parse(str);
                      break;
                  }
                });
              },
            )
        )
      ],
    );
  }

  Iterable<E> enumerate<E, T>(
      Iterable<T> items, E Function(int index, T item) f) {
    var index = 0;
    return items.map((item) {
      final result = f(index, item);
      index = index + 1;
      return result;
    });
  }
}