import 'package:ayf_admin/models/custom_drawer.dart';
import 'package:ayf_admin/models/custom_text.dart';
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
  DateTime date;
  String selectionBookmaker;
  String matchSelection;

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
      body: Column(
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
                            Image.asset(image, height: MediaQuery.of(context).size.height/10,),
                            Radio(
                                activeColor: Colors.blue.shade900,
                                value: rad,
                                groupValue: this._radioVal,
                                onChanged: (int val) {
                                  print(val);
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomText("Bookmaker :", factor: 1.5,),
              DropdownButton(
                  value: selectionBookmaker,
                  items: bookmakers
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: CustomText(value, color: Colors.black, factor: 1.5,),
                    );
                  }).toList(),
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      value = value;
                    });
                  }
              )
            ],
          ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomText("Match : ", factor: 1.3,),
              Container(
                width: MediaQuery.of(context).size.width/2,
                  height: 40.0,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Match",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        )
                    ),
                    onChanged: (String str) {
                      setState(() {
                        matchSelection = str;
                      });
                    },
                  )
              )
            ],
          )
        ],
      ),
      drawer: AppDrawer(value: nom),
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