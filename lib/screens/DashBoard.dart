import 'package:doc_ueberall/components/doctor_card.dart';
import 'package:doc_ueberall/components/search_bar.dart';
import 'package:doc_ueberall/constant.dart';
import 'package:doc_ueberall/screens/DetailScreen.dart';
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
    double width = MediaQuery.of(context).size.width;
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
            color: kTitleTextColor,
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
                  style: TextStyle(color: kTitleTextColor),
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
                            padding: const EdgeInsets.fromLTRB(25.0,25,25,15),
                            child: Text(
                              "Kontrollzentrum",
                              style: TextStyle(
                                  fontSize: 38,
                                  fontWeight: FontWeight.bold,
                                  color: kTitleTextColor),
                            ),
                          ),
                          Card(
                            elevation: 4.0,
                            margin: const EdgeInsets.fromLTRB(
                                20.0, 0, 20.0, 16.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  leading: Icon(
                                    Icons.history,
                                    color: kOrangeColor,
                                  ),
                                  title: Text("Zuletzt gesehen"),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {},
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.touch_app,
                                    color: kOrangeColor,
                                  ),
                                  title: Text("Deine Favouriten"),
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
                                    Icons.people_outline,
                                    color: kOrangeColor,
                                  ),
                                  title: Text("Über das Team"),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {},
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.history,
                                    color: kOrangeColor,
                                  ),
                                  title: Text("All. Geschäftsbedingugen"),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {},
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.zoom_out_map,
                                    color: kOrangeColor,
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
                                    color: kOrangeColor,
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
                              "Wir wünschen viel Spass auf der Reise",
                              style: TextStyle(
                                fontSize: 15.0,
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
    '📌 Grundausstattung',
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
                            color: kSearchBackgroundColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(22))),
                        child: Padding(
                          padding: EdgeInsets.all(
                            MediaQuery.of(context).size.height * 0.01,
                          ),
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                backgroundColor: kOrangeColor,
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
              color: kTitleTextColor,
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
        InhalteCard(
          'AlleInhalte',
          'Alle inhalte',
          'Sehen sie alle unsere Inhalte auf einen Blick',
          'assets/images/doctor3.png',
          kOrangeColor,
        ),
        SizedBox(
          height: _height * 0.02,
        ),
        InhalteCard(
          'AlleInhalte',
          'vor der Reise',
          'Erkundigen sie sich noch vor beginn der Reiße über aktuelle Umstände.',
          'assets/images/doctor2.png',
          kYellowColor,
        ),
        SizedBox(
          height: _height * 0.02,
        ),
        InhalteCard(
          'AlleInhalte',
          'Wärend der Reise',
          'Eye Specialist - Flower Hospitals',
          'assets/images/doctor3.png',
          kSearchTextColor,
        ),
        SizedBox(
          height: _height * 0.02,
        ),
        InhalteCard(
          'AlleInhalte',
          'Notfallinstruktionen',
          'Heart Surgeon - Flower Hospitals',
          'assets/images/doctor1.png',
          kBlueColor,
        ),
        SizedBox(
          height: _height * 0.02,
        ),
      ],
    );
  }
}
