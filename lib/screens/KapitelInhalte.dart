import 'package:doc_ueberall/components/Cards.dart';
import 'package:doc_ueberall/constant.dart';
import 'package:flutter/material.dart';


class KapitelInhalte extends StatefulWidget {
  @override
  _KapitelInhalteState createState() => _KapitelInhalteState();
}

class _KapitelInhalteState extends State<KapitelInhalte> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20,50,30,20),
            child: Row(
              children: [
                IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                Flexible(
                    child: Text(
                  "Reise",
                  style: TextStyle(fontSize: 30, color: primaryTextColor),
                )),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(1),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(23)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: SingleChildScrollView(
                  child: Column(children: <Widget>[
                    SizedBox(
                      height: height * 0.05,
                    ),
                    BuildInhaltCard(
                      kapitel: "Erstes ",
                      intKapitel: "1",
                      header: "Reisevorbereitung",
                      subtitle:
                          "Alles was sie zum Reiseantritt wissen müssen auf einen Blick.",
                          keywoerter: "Word1, word 2, word3, etc..",
                      bookmarkchecked: Icon(Icons.bookmark_outline),
                      checkbox: Icon(Icons.check_box_outlined),
                    ),
                    BuildInhaltCard(
                      kapitel: "Zweites ",
                      intKapitel: "2",
                      header: "Reisen bei Vorerkrankungen",
                      subtitle: "Erkundige dich über lokale Viren und möglichn Schutz.",
                      keywoerter: "Word1, word 2, word3, etc..",
                      bookmarkchecked: Icon(Icons.bookmark),
                      checkbox: Icon(Icons.check_box_outlined),
                    ),
                   
                    
                  ]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
