import 'dart:math';

import 'package:doc_ueberall/components/Cards.dart';
import 'package:doc_ueberall/constant.dart';
import 'package:doc_ueberall/model/kapitelDetails.dart';
import 'package:doc_ueberall/screens/DashBoard/viewModel/DashBoardViewModel.dart';

import 'package:doc_ueberall/screens/ZuletztGesehen/ZuletztGesehen.dart';
import 'package:doc_ueberall/screens/routes.dart';
import 'package:doc_ueberall/viewModelProvider/ViewModelProvider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tags/flutter_tags.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DashBoardViewModel viewModel;
  bool searching = false;
  String currentStr = '';

  List<Details> searchResults;
  @override
  void initState() {
    super.initState();
    viewModel = ViewModelProvider.of<DashBoardViewModel>(context);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: StreamBuilder<List<Details>>(
        stream: viewModel.outDetailScreen,
        builder: (BuildContext context, AsyncSnapshot<List<Details>> snapshot) {
          var list = snapshot.data
                  ?.where((element) => element.isBookMarked == true)
                  ?.toList()
                  ?.cast<Details>() ??
              [];
          if (snapshot.data != null) {
            searchResults = snapshot.data
                .where((element) =>
                    element.articleText.contains(currentStr) ||
                    element.text.contains(currentStr))
                .toList()
                .cast<Details>()
                  ..sort((detailA, detailB) =>
                      detailA.index.compareTo(detailB.index));
          }
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(children: <Widget>[
                SizedBox(
                  height: height * 0.05,
                ),
                searching ? Container() : header(context),

                /*
            ---
             Display Search bar:
              On input display best ranking, going first headers, then scraping the whole database for results

            Display Tags:
              Displaying latestz five bookmarks as Tags (see below). RN just as plain text, once you got the database running, I will add emojis that shoud be displayed upfront
            ---
            */
                search(
                  context,
                  searching ? [] : list.sublist(0, min(list.length, 5)),
                ),
                SizedBox(
                  height: height * 0.02,
                ),

                /*
            ---
              Displaying first card a all Chaptors (alleInhalte)
              The other ones are just going to be shortcuts to spesific Articles
            ---
            */
                searching ? Container() : Cards(),
              ]),
            ),
          );
        },
      ),
    );
  }

  Widget header(BuildContext context) {
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
                  "Optionen",
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
                              "Kontrollzentrum", //Controlcenter
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
                                /*
                                --
                                 Link to page (ZuletstGesehen.dart) all Articles checked off as seen schould be displayed using the BuildInhaltCard
                                ---
                                */
                                ListTile(
                                  leading: Icon(
                                    Icons.history,
                                    color: kRedColor,
                                  ),
                                  title: Text("Zuletzt gesehen"), //last seen
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

                                /*
                                ---
                                 Link to PageGespeicherteArtikel.dart; all articles that are bookmarked should be displayed on that screen
                                ---
                                */
                                ListTile(
                                  leading: Icon(
                                    Icons.touch_app,
                                    color: kRedColor,
                                  ),
                                  title:
                                      Text("Gespeicherte Artikel"), //bookmarked
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {
                                    Navigator.of(context).pushNamed(AppRoutes
                                        .GESPEICHERTE_ARTIKELS); //Link to Information page
//                                    Navigator.push(
//                                      context,
//                                      MaterialPageRoute(
//                                          builder: (context) =>
//                                              GespeicherteArtikels()), //Link to Information page
//                                    );
                                  },
                                ),
                              ],
                            ),
                          ),

                          /*
                          ---
                           This is Static, no Backend required
                          ---
                          */
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
                                  title: Text("Allg. Geschäftsbedingungen"),
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
                                  title: Text("Weitere Einstellungen"),
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
                                  fontSize: 15.0, color: primaryTextColor),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Center(
                            child: Text(
                              "DocÜberall v0.7 ",
                              style: TextStyle(
                                  fontSize: 15.0, color: secondaryTextColor),
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

  Widget search(BuildContext context, List<Details> tags) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.015,
          ),
          Stack(
            children: <Widget>[
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.7,
                padding: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  color: kBoxBackground,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: TextField(
                    onSubmitted: (str) {
                      currentStr = str;
                      if (str != "") {
//                        viewModel.search(str);
                      } else {
                        setState(() {
                          searching = false;
                        });
                      }
                    },
                    onTap: () {
                      setState(() {
                        searching = true;
                      });
                    },
                    decoration: InputDecoration.collapsed(
                      hintText: 'Hier suchen!', //search  here
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: MaterialButton(
                  onPressed: () {
                    HapticFeedback.heavyImpact();
                    if (currentStr != null)
                      Navigator.of(context)
                          .pushNamed(AppRoutes.SEARCH_LIST, arguments: {
                        'search_string': currentStr,
                      });
                  },
                  color: kRedColor,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: SvgPicture.asset('assets/icons/search.svg'),
                ),
              ),
            ],
          ),

          /*
          ---
            Tags should display the latest 5 bookmarked articles - Also GestureDetector should be added to link to the pages of the Tags you click
            a list of all bookmarked articles should be in GeespeicherteArtikel.dart
          ---
          */
          (tags != null)
              ? Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Center(
                    child: Tags(
                      itemCount: tags.length,
                      itemBuilder: (index) {
                        return GestureDetector(
                          onTap: () {
                            HapticFeedback.mediumImpact();

                            Navigator.of(context)
                                .pushNamed(AppRoutes.DETAILPAGE, arguments: {
                              'detail': tags[index]
                            }); //Link to Information page
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: kRedColor,
                                      maxRadius: 0,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "${tags[index].icon ?? ""} ${tags[index].text}",
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
                )
              : Container(),
        ],
      ),
    );
  }

//  Widget searchResults(BuildContext context, List<Details> details) {
//    return Padding(
//        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
//        child: ListView.builder(
//            itemCount: details.length,
//            itemBuilder: (context, index) {
//              var detail = details[index];
//              return SearchArticleCard(
//                header: detail.text, //Header of Article inside of theee Chapter
//                discription: detail
//                    .articleText, //needs to be initializeed (add "Lorum Ipsum sentence", Ill add real data later using Firebase)
//                fun: () {
//                  Navigator.of(context).pushNamed(AppRoutes.DETAILPAGE,
//                      arguments: {'detail': detail}); //Link to Information page
//                },
//              );
//            }));
//  }
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
            "Unsere Inhalte", //our Articles
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
        /*
        ---
          Alle Kapitel should open up Kapitel.dart which schould display some kind of Listview displaying all Chapters using the BuildKapitelCard component
        ---
        */
        DashboardCard(
          header: 'Alle Kapitel',
          description: 'Sehen sie alle unsere Inhalte auf einen Blick',
          imgURL: 'assets/SVGs/allChapters.svg',
          bgColor: kRedColor,
          press: () {
            Navigator.of(context).pushNamed(AppRoutes.KEPITOL);
            //todo: remove this line
//            Navigator.push(
//              context,
//              MaterialPageRoute(
//                  builder: (context) =>
//                      KapitolScreen()), //Link to Information page
//            );
          },
        ),
        TopicCard(
          header: 'Alle Kapitel',
          description: 'Sehen sie alle unsere Inhalte auf einen Blick',
          imgURL: 'assets/SVGs/allChapters.svg',
          bgColor: kRedColor,
          press: () {
            Navigator.of(context).pushNamed(AppRoutes.KEPITOL);
            //todo: remove this line
//            Navigator.push(
//              context,
//              MaterialPageRoute(
//                  builder: (context) =>
//                      KapitolScreen()), //Link to Information page
//            );
          },
        ),
        SizedBox(
          height: _height * 0.02,
        ),
        /*
        ---
          shortcut to first Chaptor about the Article "Reisevorbereitungen"
        */
        TopicCard(
          header: 'Reisevorbereitungen',
          description:
              'Erkundigen sie sich noch vor Beginn der Reise über aktuelle Umstände.',
          imgURL: 'assets/SVGs/prepare.svg',
          bgColor: kPurpleColor,
          press: () {},
        ),
        SizedBox(
          height: _height * 0.02,
        ),

        /*
        ---
        shortcut to second Cpator Article about Kleine Medikamentenrunfe
        ---
        */
        TopicCard(
          header: 'Kleine Medikamentenkunde',
          description: 'Alles was sie über Ihre Reseapotheke wissen müssen.',
          imgURL: 'assets/SVGs/medecine.svg',
          bgColor: kYellowColor,
          press: () {},
        ),
        SizedBox(
          height: _height * 0.02,
        ),

        /*
        ---
          Shortcut to Chaptor 16, Article 1
        ---
        */
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
