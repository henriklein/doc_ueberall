import 'package:doc_ueberall/components/Cards.dart';
import 'package:doc_ueberall/constant.dart';
import 'package:flutter/material.dart';

class KapitolScreen extends StatefulWidget {
  @override
  _KapitolScreenState createState() => _KapitolScreenState();
}

class _KapitolScreenState extends State<KapitolScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 50, 30, 20),
            child: Row(
              children: [
                IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                Flexible(
                    child: Text(
                  "Alle Kapitel", //ALL Chaptors
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
                    /*
                    ---
                      Displaying all Chaptors probably as an listview.bulder (do whatever you think would be best)
                      ---
                    */
                    BuildKapitelCard(
                      kapitel:
                          "Erstes", //number of chapter written out. Needs to be initialized in the Databease as "" (Ill add real dara later)
                      intKapitel: "1", //in of current Chapter
                      header: "Reise", //Header of Chapter
                      description: //Discription needs to be initialized. Add One sentence of Lorum Ipsum or something, Ill add real data later
                          "Alles was sie zum Reiseantritt wissen müssen auf einen Blick.",
                      keywoerter:
                          "Resevorbereitung, Reisen bei Vorerkrankungen", //Displaying all Headers of Articles inside that Chapter
                      bookmarkchecked: Icon(Icons.bookmark_outline),
                      checkbox: Icon(Icons.check_box_outlined),
                    ),
                    BuildKapitelCard(
                      kapitel: "Zweites",
                      intKapitel: "2",
                      header: "Kleine Medikamentenkunde",
                      description:
                          "Erkundige dich über lokale Viren und möglichen Schutz.",
                      keywoerter:
                          "Kleine Medikamentenkunde, Anwendungsweisen, Medikamente, Mikrobiologische Medikamente, Schmerzmittel und fiebersenkende Mittel, Entzündungshemmende Mittel ",
                      bookmarkchecked: Icon(Icons.bookmark),
                      checkbox: Icon(Icons.check_box_outlined),
                    ),
//                    BuildKapitelCard(
//                      kapitel: "Drittes",
//                      intKapitel: "3",
//                      header: "Tiere und Pflanzen",
//                      description: "Was tun bei Kontakt mit örtlichen Tieren",
//                      keywoerter:
//                          "Tiere und Pflanzen', Insektenstiche und -bisse, Verletzungen durch Meerestiere, Pflanzen",
//                      bookmarkchecked: Icon(Icons.bookmark_outline),
//                      checkbox: Icon(Icons.check_box_outline_blank),
//                    ),
//                    BuildKapitelCard(
//                      kapitel: "Viertes",
//                      intKapitel: "4",
//                      header: "Sport",
//                      description: "Welche Sportarten sind etabliert",
//                      keywoerter: "Word1, word 2, word3, etc..",
//                      bookmarkchecked: Icon(Icons.bookmark_outline),
//                      checkbox: Icon(Icons.check_box_outline_blank),
//                    ),
//                    BuildKapitelCard(
//                      kapitel: "Fünftes",
//                      intKapitel: "5",
//                      header: "Physikalische Beeinträchtigungen",
//                      description: "Was weiß ich",
//                      keywoerter: "Word1, word 2, word3, etc..",
//                      bookmarkchecked: Icon(Icons.bookmark_outline),
//                      checkbox: Icon(Icons.check_box_outline_blank),
//                    ),
//                    BuildKapitelCard(
//                      kapitel: "Sechste",
//                      intKapitel: "6",
//                      header: "Infektionen Erkältungen & Entzündungen",
//                      description: "You havent seen Leyla in 12 days",
//                      keywoerter: "Word1, word 2, word3, etc..",
//                      bookmarkchecked: Icon(Icons.bookmark_outline),
//                      checkbox: Icon(Icons.check_box_outline_blank),
//                    ),
//                    BuildKapitelCard(
//                      kapitel: "Siebte",
//                      intKapitel: "7",
//                      header: "Schmerzen",
//                      description: "You havent seen Leyla in 12 days",
//                      keywoerter: "Word1, word 2, word3, etc..",
//                      bookmarkchecked: Icon(Icons.bookmark_outline),
//                      checkbox: Icon(Icons.check_box_outline_blank),
//                    ),
//                    BuildKapitelCard(
//                      kapitel: "Achte",
//                      intKapitel: "8",
//                      header: "Verletzungen",
//                      description: "You havent seen Leyla in 12 days",
//                      keywoerter: "Word1, word 2, word3, etc..",
//                      bookmarkchecked: Icon(Icons.bookmark_outline),
//                      checkbox: Icon(Icons.check_box_outline_blank),
//                    ),
//                    BuildKapitelCard(
//                      kapitel: "Neunte",
//                      intKapitel: "9",
//                      header: "Kreislaufstörungen / Schwindel",
//                      description: "You havent seen Leyla in 12 days",
//                      keywoerter: "Word1, word 2, word3, etc..",
//                      bookmarkchecked: Icon(Icons.bookmark_outline),
//                      checkbox: Icon(Icons.check_box_outline_blank),
//                    ),
//                    BuildKapitelCard(
//                      kapitel: "Zehnte",
//                      intKapitel: "10",
//                      header: "Infektionskrankheiten und Impfungen",
//                      description: "You havent seen Leyla in 12 days",
//                      keywoerter: "Word1, word 2, word3, etc..",
//                      bookmarkchecked: Icon(Icons.bookmark_outline),
//                      checkbox: Icon(Icons.check_box_outline_blank),
//                    ),
//                    BuildKapitelCard(
//                      kapitel: "Elfte",
//                      intKapitel: "11",
//                      header: "Notfälle",
//                      description: "You havent seen Leyla in 12 days",
//                      keywoerter: "Word1, word 2, word3, etc..",
//                      bookmarkchecked: Icon(Icons.bookmark_outline),
//                      checkbox: Icon(Icons.check_box_outline_blank),
//                    ),
//                    BuildKapitelCard(
//                      kapitel: "Zwölfte",
//                      intKapitel: "12",
//                      header: "Techniken und Handgriffe",
//                      description: "You havent seen Leyla in 12 days",
//                      keywoerter: "Word1, word 2, word3, etc..",
//                      bookmarkchecked: Icon(Icons.bookmark_outline),
//                      checkbox: Icon(Icons.check_box_outline_blank),
//                    ),
//                    BuildKapitelCard(
//                      kapitel: "Dreizehnte",
//                      intKapitel: "13",
//                      header: "Erste Hilfe",
//                      description: "You havent seen Leyla in 12 days",
//                      keywoerter: "Word1, word 2, word3, etc..",
//                      bookmarkchecked: Icon(Icons.bookmark_outline),
//                      checkbox: Icon(Icons.check_box_outline_blank),
//                    ),
//                    BuildKapitelCard(
//                      kapitel: "Vierzehnte",
//                      intKapitel: "14",
//                      header: "Regionale Gesundheitsrisiken",
//                      description: "You havent seen Leyla in 12 days",
//                      keywoerter: "Word1, word 2, word3, etc..",
//                      bookmarkchecked: Icon(Icons.bookmark_outline),
//                      checkbox: Icon(Icons.check_box_outline_blank),
//                    ),
//                    BuildKapitelCard(
//                      kapitel: "Fünfzehnte",
//                      intKapitel: "15",
//                      header:
//                          "Malariasituation und Impfvorschriften nach Ländern",
//                      description: "You havent seen Leyla in 12 days",
//                      keywoerter: "Word1, word 2, word3, etc..",
//                      bookmarkchecked: Icon(Icons.bookmark_outline),
//                      checkbox: Icon(Icons.check_box_outline_blank),
//                    ),
//                    BuildKapitelCard(
//                      kapitel: "sechzehnte",
//                      intKapitel: "16",
//                      header: "Autorisierte Gelbfieberimpfstellen",
//                      description: "You havent seen Leyla in 12 days",
//                      keywoerter: "Word1, word 2, word3, etc..",
//                      bookmarkchecked: Icon(Icons.bookmark_outline),
//                      checkbox: Icon(Icons.check_box_outline_blank),
//                    ),
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
