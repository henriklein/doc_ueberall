import 'package:doc_ueberall/components/Cards.dart';
import 'package:doc_ueberall/components/search_bar.dart';
import 'package:doc_ueberall/constant.dart';
import 'package:doc_ueberall/screens/GespeicherteArtikel.dart';
import 'package:doc_ueberall/screens/ZuletztGesehen.dart';
import 'package:doc_ueberall/screens/Kapitel.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tags/flutter_tags.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(children: <Widget>[
            SizedBox(
              height: height * 0.05,
            ),
            Header(),
            Search(),
            SizedBox(
              height: height * 0.02,
            ),
            Cards(),
          ]),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Doc\nüberall',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 38,
            color: primaryTextColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: Container(
              height: MediaQuery.of(context).size.height * 0.08,
              child: Column(children: [
                Expanded(
                  child: IconButton(
                    iconSize: 30,
                    icon: new Icon(Icons.person),
                    highlightColor: Colors.white,
                    enableFeedback: true,
                    onPressed: () {
                      _showSearch(context);
                      HapticFeedback.mediumImpact(); //here
                    },
                  ),
                ),
                Text(
                  "Mehr",
                  style: TextStyle(color: secondaryTextColor),
                )
              ])),
        )
      ],
    );
  }

  void _showSearch(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.0),
                topLeft: Radius.circular(85.0))),
        isScrollControlled: true,
        isDismissible: true,
        context: context,
        builder: (builder) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    SingleChildScrollView(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(25.0, 25, 25, 15),
                            child: Text(
                              "Kontrollzentrum",
                              style: TextStyle(
                                  fontSize: 38,
                                  fontWeight: FontWeight.bold,
                                  color: primaryTextColor),
                            ),
                          ),
                          Card(
                            elevation: 4.0,
                            margin:
                                const EdgeInsets.fromLTRB(20.0, 0, 20.0, 16.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  leading: Icon(
                                    Icons.history,
                                    color: kRedColor,
                                  ),
                                  title: Text("Zuletzt gesehen"),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ZuletztGesehen()), //Link to Information page
                                    );
                                  },
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.touch_app,
                                    color: kRedColor,
                                  ),
                                  title: Text("Gespeicherte Artikel"),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {
                                     Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              GespeicherteArtikel()), //Link to Information page
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          Card(
                            elevation: 4.0,
                            margin: const EdgeInsets.fromLTRB(
                                20.0, 8.0, 20.0, 16.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  leading: Icon(
                                    Icons.people_outline,
                                    color: kRedColor,
                                  ),
                                  title: Text("Über DocÜberall"),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {},
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.history,
                                    color: kRedColor,
                                  ),
                                  title: Text("All. Geschäftsbedingungen"),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {},
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.zoom_out_map,
                                    color: kRedColor,
                                  ),
                                  title: Text("Unsere Website"),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ),
                          Card(
                            elevation: 4.0,
                            margin: const EdgeInsets.fromLTRB(
                                20.0, 8.0, 20.0, 16.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  leading: Icon(
                                    Icons.settings,
                                    color: kRedColor,
                                  ),
                                  title: Text("Weitere Enstellungen"),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Center(
                            child: Text(
                              "Wir wünschen viel Spaß auf der Reise",
                              style: TextStyle(
                                fontSize: 15.0,
                                color: primaryTextColor
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Center(
                            child: Text(
                              "DocÜberall v0.7 ",
                              style: TextStyle(
                                fontSize: 15.0,
                                color: secondaryTextColor
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 20.0),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}

class Search extends StatelessWidget {
  final List<String> tags = [
   '😷 Vorerkrankugnen ',
    '💊 Reiseapotheke ',
    '💉 Impfungen',
    "👔 Versicherungen",
    "🤕 Asthma"
  ];
  final List<String> icons = ['Icons.settings'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.015,
          ),
          SearchBar(),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Center(
              child: Tags(
                itemCount: tags.length,
                itemBuilder: (index) {
                  return GestureDetector(
                    onTap: () {
                      HapticFeedback.mediumImpact();
                    },
                    child: UnconstrainedBox(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            color: kBoxBackground,
                            borderRadius:
                                BorderRadius.all(Radius.circular(22))),
                        child: Padding(
                          padding: EdgeInsets.all(
                            MediaQuery.of(context).size.height * 0.01,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                backgroundColor: kRedColor,
                                maxRadius: 0,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                tags[index],
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Cards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "unsere Inhalte",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: primaryTextColor,
              fontSize: 18,
            ),
          ),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        buildShortCuts(context),
      ],
    );
  }

  buildShortCuts(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return Column(
      children: <Widget>[
        TopicCard(
          header: 'Alle Kapitel',
          description: 'Sehen sie alle unsere Inhalte auf einen Blick',
          imgURL: 'assets/SVGs/allChapters.svg',
          bgColor: kRedColor,
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      KapitelScreen()), //Link to Information page
            );
          },
        ),
        SizedBox(
          height: _height * 0.02,
        ),
        TopicCard(
          header: 'Reisevorbereitungen',
          description:
              'Erkundigen sie sich noch vor beginn der Reiße über aktuelle Umstände.',
          imgURL: 'assets/SVGs/prepare.svg',
          bgColor: kPurpleColor,
          press: () {},
        ),
        SizedBox(
          height: _height * 0.02,
        ),
        TopicCard(
          header: 'Kleine Medikamentenrunde',
          description: 'Alles was sie über Ihre Reseapotheke wissen müssen.',
          imgURL: 'assets/SVGs/medecine.svg',
          bgColor: kYellowColor,
          press: () {},
        ),
        SizedBox(
          height: _height * 0.02,
        ),
        TopicCard(
          header: 'Notfallinstruktionen',
          description: 'Notfallinstruktionen in Kriesensituationen.',
          imgURL: 'assets/SVGs/firstAID.svg',
          bgColor: kBlueColor,
          press: () {},
        ),
        SizedBox(
          height: _height * 0.02,
        ),
      ],
    );
  }
}
