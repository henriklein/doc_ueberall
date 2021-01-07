import 'package:doc_ueberall/components/Cards.dart';
import 'package:doc_ueberall/constant.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class KapitelScreen extends StatefulWidget {
  @override
  _KapitelScreenState createState() => _KapitelScreenState();
}

class _KapitelScreenState extends State<KapitelScreen> {
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
                  "Alle Kapitel",
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
                    BuildKapitelCard(
                      kapitel: "Erstes ",
                      intKapitel: "1",
                      header: "Reise",
                      subtitle:
                          "Alles was sie zum Reiseantritt wissen müssen auf einen Blick.",
                          keywoerter: "Word1, word 2, word3, etc..",
                      bookmarkchecked: Icon(Icons.bookmark_outline),
                      checkbox: Icon(Icons.check_box_outlined),
                    ),
                    BuildKapitelCard(
                      kapitel: "Zweites ",
                      intKapitel: "2",
                      header: "Kleine Medikamentenkunde",
                      subtitle: "Erkundige dich über lokale Viren und möglichn Schutz.",
                      keywoerter: "Word1, word 2, word3, etc..",
                      bookmarkchecked: Icon(Icons.bookmark),
                      checkbox: Icon(Icons.check_box_outlined),
                    ),
                    BuildKapitelCard(
                      kapitel: "Drittes ",
                      intKapitel: "3",
                      header: "Tiere und Pflanzen",
                      subtitle: "Welech Tiere sind vor Ort zu finden?",
                      keywoerter: "Word1, word 2, word3, etc..",
                      bookmarkchecked: Icon(Icons.bookmark_outline),
                      checkbox: Icon(Icons.check_box_outline_blank),
                    ),
                    BuildKapitelCard(
                      kapitel: "Viertes ",
                      intKapitel: "4",
                      header: "Sport",
                      subtitle: "Welche Sportarten sind etabliert",
                      keywoerter: "Word1, word 2, word3, etc..",
                      bookmarkchecked: Icon(Icons.bookmark_outline),
                      checkbox: Icon(Icons.check_box_outline_blank),
                    ),
                    BuildKapitelCard(
                      kapitel: "Fünftes ",
                      intKapitel: "5",
                      header: "Physikalische Beeinträchtigungen",
                      subtitle: "Was weiß ich",
                      keywoerter: "Word1, word 2, word3, etc..",
                      bookmarkchecked: Icon(Icons.bookmark_outline),
                      checkbox: Icon(Icons.check_box_outline_blank),
                    ),
                    BuildKapitelCard(
                      kapitel: "Sechste",
                      intKapitel: "6",
                      header: "Infektionen Erkältungen & Entzündungen",
                      subtitle: "You havent seen Leyla in 12 days",
                      keywoerter: "Word1, word 2, word3, etc..",
                      bookmarkchecked: Icon(Icons.bookmark_outline),
                      checkbox: Icon(Icons.check_box_outline_blank),
                    ),
                    BuildKapitelCard(
                      kapitel: "Siebte ",
                      intKapitel: "7",
                      header: "Schmerzen",
                      subtitle: "You havent seen Leyla in 12 days",
                      keywoerter: "Word1, word 2, word3, etc..",
                      bookmarkchecked: Icon(Icons.bookmark_outline),
                      checkbox: Icon(Icons.check_box_outline_blank),
                    ),
                    BuildKapitelCard(
                      kapitel: "Achte",
                      intKapitel: "8",
                      header: "Verletzungen",
                      subtitle: "You havent seen Leyla in 12 days",
                      keywoerter: "Word1, word 2, word3, etc..",
                      bookmarkchecked: Icon(Icons.bookmark_outline),
                      checkbox: Icon(Icons.check_box_outline_blank),
                    ),
                    BuildKapitelCard(
                      kapitel: "Neunte ",
                      intKapitel: "9",
                      header: "Kreislaufstörungen / Schwindel",
                      subtitle: "You havent seen Leyla in 12 days",
                      keywoerter: "Word1, word 2, word3, etc..",
                      bookmarkchecked: Icon(Icons.bookmark_outline),
                      checkbox: Icon(Icons.check_box_outline_blank),
                    ),
                    BuildKapitelCard(
                      kapitel: "Zehnte ",
                      intKapitel: "10",
                      header: "Infektionskrankheiten und Impfungen",
                      subtitle: "You havent seen Leyla in 12 days",
                      keywoerter: "Word1, word 2, word3, etc..",
                      bookmarkchecked: Icon(Icons.bookmark_outline),
                      checkbox: Icon(Icons.check_box_outline_blank),
                    ),
                    BuildKapitelCard(
                      kapitel: "Elfte ",
                      intKapitel: "11",
                      header: "Notfälle",
                      subtitle: "You havent seen Leyla in 12 days",
                      keywoerter: "Word1, word 2, word3, etc..",
                      bookmarkchecked: Icon(Icons.bookmark_outline),
                      checkbox: Icon(Icons.check_box_outline_blank),
                    ),
                    BuildKapitelCard(
                      kapitel: "Zwölfte ",
                      intKapitel: "12",
                      header: "Techniken und Handgriffe",
                      subtitle: "You havent seen Leyla in 12 days",
                      keywoerter: "Word1, word 2, word3, etc..",
                      bookmarkchecked: Icon(Icons.bookmark_outline),
                      checkbox: Icon(Icons.check_box_outline_blank),
                    ),
                    BuildKapitelCard(
                      kapitel: "Dreizehnte ",
                      intKapitel: "13",
                      header: "Erste Hilfe",
                      subtitle: "You havent seen Leyla in 12 days",
                      keywoerter: "Word1, word 2, word3, etc..",
                      bookmarkchecked: Icon(Icons.bookmark_outline),
                      checkbox: Icon(Icons.check_box_outline_blank),
                    ),
                    BuildKapitelCard(
                      kapitel: "Vierzehnte ",
                      intKapitel: "14",
                      header: "Regionale Gesundheitsrisiken",
                      subtitle: "You havent seen Leyla in 12 days",
                      keywoerter: "Word1, word 2, word3, etc..",
                      bookmarkchecked: Icon(Icons.bookmark_outline),
                      checkbox: Icon(Icons.check_box_outline_blank),
                    ),
                    BuildKapitelCard(
                      kapitel: "Fünfzehnte ",
                      intKapitel: "15",
                      header:
                          "Malariasituation und Impfvorschriften nach Ländern",
                      subtitle: "You havent seen Leyla in 12 days",
                      keywoerter: "Word1, word 2, word3, etc..",
                      bookmarkchecked: Icon(Icons.bookmark_outline),
                      checkbox: Icon(Icons.check_box_outline_blank),
                    ),
                    BuildKapitelCard(
                      kapitel: "sechzehnte",
                      intKapitel: "16",
                      header: "Autorisierte Gelbfieberimpfstellen",
                      subtitle: "You havent seen Leyla in 12 days",
                      keywoerter: "Word1, word 2, word3, etc..",
                      bookmarkchecked: Icon(Icons.bookmark_outline),
                      checkbox: Icon(Icons.check_box_outline_blank),
                    ),
                    SizedBox(
                      height: height * 0.02,
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
