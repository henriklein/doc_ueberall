import 'dart:math';

import 'package:doc_ueberall/components/Cards.dart';
import 'package:doc_ueberall/constant.dart';
import 'package:doc_ueberall/model/kapitelDetails.dart';
import 'package:doc_ueberall/model/kapitels.dart';
import 'package:doc_ueberall/screens/DashBoard/viewModel/DashBoardViewModel.dart';
import 'package:doc_ueberall/screens/routes.dart';
import 'package:doc_ueberall/viewModelProvider/ViewModelProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_tags/flutter_tags.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

import 'package:percent_indicator/percent_indicator.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller = TextEditingController();
  DashBoardViewModel viewModel;
  bool searching = false;
  String currentStr = '';
  int totalDetails;
  int totalSeen;
  List<Details> searchResults;
  double progressValue = 0;

  Details nextArticle;

  @override
  void initState() {
    super.initState();
    viewModel = ViewModelProvider.of<DashBoardViewModel>(context);
  }

  String text =
      'Hallo. Ich benutze seit neustem die App DocÜberall um mich auf meine kommenden Resen vorzubrereite. Vielleicht ist das ja auch was für dich. Hier ist der link: https://www.doc-überall.de/';
  String subject = 'Doc Überall';

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
            totalDetails = snapshot.data.length;
            searchResults = snapshot.data
                    .where((element) => element.text
                        .toLowerCase()
                        .contains(currentStr.toLowerCase()))
                    .toList()
                    .cast<Details>() +
                snapshot.data
                    .where((element) => element.articleText
                        .toLowerCase()
                        .contains(currentStr.toLowerCase()))
                    .toList()
                    .cast<Details>();

            snapshot.data.sort((articleOne, articleTwo) =>
                articleOne.index.compareTo(articleTwo.index));
            nextArticle =
                snapshot.data.where((element) => element.isSeen == false).first;
            totalSeen = snapshot.data
                    .where((element) => element.isSeen == true)
                    ?.length ??
                0;
            progressValue =
                nextArticle.index / ((totalDetails == 0) ? 1 : totalDetails);
          }
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(children: <Widget>[
                SizedBox(
                  height: height * 0.05,
                ),
                header(context),

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
                  height: height * 0.03,
                ),

                /*
            ---
              Displaying first card a all Chaptors (alleInhalte)
              The other ones are just going to be shortcuts to spesific Articles
            ---
            */
                searching && searchResults != null
                    ? Column(
                        children: searchResultsList(context, searchResults))
                    : Column(children: [
                        showProsess(),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        kapitalsList(),
                      ]),
                links()
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
                                    Navigator.of(context)
                                        .pushNamed(AppRoutes.ZULETST_GESEHEN);
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
                                      Icons.info_outline,
                                      color: kRedColor,
                                    ),
                                    title: Text("Über uns"),
                                    trailing: Icon(Icons.keyboard_arrow_right),
                                    onTap: () async {
                                      final url =
                                          'https://www.xn--doc-berall-deb.de/doc-ueberall/ueber-uns/';
                                      if (await canLaunch(url)) {
                                        await launch(
                                          url,
                                          forceSafariVC: true,
                                        );
                                      }
                                    }),
                                SizedBox(
                                  height: 10,
                                ),
                                ListTile(
                                    leading: Icon(
                                      Icons.chat_bubble_outline,
                                      color: kRedColor,
                                    ),
                                    title: Text("Oft gestellte fragen"),
                                    trailing: Icon(Icons.keyboard_arrow_right),
                                    onTap: () async {
                                      final url =
                                          'https://www.xn--doc-berall-deb.de/';
                                      if (await canLaunch(url)) {
                                        await launch(
                                          url,
                                          forceSafariVC: true,
                                        );
                                      }
                                    }),
                                SizedBox(
                                  height: 10,
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.share_outlined,
                                    color: kRedColor,
                                  ),
                                  title: Text("App weiter empfehlen"),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {
                                    final RenderBox box =
                                        context.findRenderObject();
                                    Share.share(text,
                                        subject: subject,
                                        sharePositionOrigin:
                                            box.localToGlobal(Offset.zero) &
                                                box.size);
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
                                    Icons.settings,
                                    color: kRedColor,
                                  ),
                                  title: Text("App zurücksetzen"),
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
                width: MediaQuery.of(context).size.width * 0.9,
                padding: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  color: kBoxBackground,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: TextFormField(
                    controller: controller,
                    onChanged: (str) {
                      setState(() {
                        currentStr = str;
                      });
                      if (str != "") {
//                        viewModel.search(str);
                      } else {
                        setState(() {
                          searching = false;
                          FocusScope.of(context).unfocus();
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
              controller?.text != '' || searching == true
                  ? Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          controller.text = '';
                          setState(() {
                            currentStr = '';
                            searching = false;
                          });
                          FocusScope.of(context).unfocus();
                        },
                      ),
                    )
                  : Container(),
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
                              'detail': tags[index],
                              'total_details': totalDetails
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

  List<Widget> searchResultsList(BuildContext context, List<Details> details) {
    return details
        .map((detail) => SearchArticleCard(
              header: detail.text, //Header of Article inside of theee Chapter
              discription: detail
                  .articleText, //needs to be initializeed (add "Lorum Ipsum sentence", Ill add real data later using Firebase)
              fun: () {
                Navigator.of(context).pushNamed(AppRoutes.DETAILPAGE,
                    arguments: {
                      'detail': detail,
                      'total_details': totalDetails
                    }); //Link to Information page
              },
            ))
        .toList();
  }

  Widget showProsess() {
    return Container(
      padding: EdgeInsets.only(left: 10),
      height: 120,
      child: Center(
        child: Row(
          children: [
            Container(
                width: 110,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: CircularPercentIndicator(
                          radius: 100,
                          lineWidth: 7.0,
                          progressColor: kBoxBackground,
                          startAngle: 260,
                          percent: 0.5555 * 1,
                          animation: false,
                          backgroundColor: Colors.transparent,
                          center: Text(
                            ' ${nextArticle?.index ?? ""}/ ${totalDetails ?? ""}',
                            style: TextStyle(fontSize: 11),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: CircularPercentIndicator(
                        radius: 100,
                        lineWidth: 7.0,
                        progressColor: kRedColor,
                        startAngle: 260,
                        percent: progressValue ?? 0.0,
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ],
                )
//
                ),
            SizedBox(width: 10),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    (nextArticle?.index == 1)
                        ? "start reading"
                        : (nextArticle?.index == totalDetails)
                            ? "well done"
                            : "Weiterlesen", //our Articles
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: primaryTextColor,
                      fontSize: 18,
                    ),
                  ),
                  Text(nextArticle == null
                      ? ''
                      : "${nextArticle.index}. ${nextArticle.kapitel} / ${nextArticle.themengebiet}"),
                  Container(
                    // width: double.infinity,
                    child: RaisedButton.icon(
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.DETAILPAGE,
                            arguments: {
                              'detail': nextArticle,
                              'total_details': totalDetails
                            }); //Link to next article
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      label: Text(
                        '${nextArticle?.text ?? ''}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white),
                      ),
                      icon: Icon(
                        Icons.next_plan,
                        color: Colors.white,
                      ),
                      textColor: Colors.white,
                      color: kRedColor,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget kapitalsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Alle Inhalte", //our Articles
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: primaryTextColor,
            fontSize: 18,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        StreamBuilder<Kapitels>(
          stream: viewModel.outKepitols,
          builder: (BuildContext context, AsyncSnapshot<Kapitels> snapshot) {
            if (!snapshot.hasData) return Container();
            final int chatsCount = snapshot.data.kepitols?.length ?? 0;
            if (chatsCount == 0) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.3),
                    ),
                    Text(
                      "",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.05),
                    ),
                  ],
                ),
              );
            }
            return Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Column(
                  children: snapshot.data.kepitols
                      .map((chapter) => BuildKapitelCard(
                            kapitel: chapter,
                          ))
                      .toList()),
//
            );
          },
        ),
      ],
    );
  }

  Widget links() {
    String text =
        'Hallo. Ich benutze seit neustem die App DocÜberall um mich auf meine kommenden Resen vorzubrereite. Vielleicht ist das ja auch was für dich. Hier ist der link: https://www.doc-überall.de/';
    String subject = 'Doc Überall';
    return Column(
      children: [
        Divider(),
        ListTile(
          leading: Icon(
            Icons.check_box_outlined,
            color: Colors.green,
          ),
          title: Text(
            'Zuletzt Gesehen',
            style: TextStyle(color: Colors.black),
          ),
          onTap: () {
            Navigator.of(context).pushNamed(AppRoutes.ZULETST_GESEHEN);
          },
        ),
        ListTile(
          leading: Icon(
            Icons.bookmark,
            color: Colors.orange,
          ),
          title: Text(
            'Gespeicherte Artikel',
            style: TextStyle(color: Colors.black),
          ),
          onTap: () {
            Navigator.of(context).pushNamed(
                AppRoutes.GESPEICHERTE_ARTIKELS); //Link to Information page
//                                    Navigator.push(
//                                      context,
//                                      MaterialPageRoute(
//                                          builder: (context) =>
//                                              GespeicherteArtikels()), //Link to Information page
//                                    );
          },
        ),
        Divider(),
        ListTile(
            leading: Icon(
              Icons.info,
            ),
            title: Text(
              'Über Uns',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () async {
              final url =
                  'https://www.xn--doc-berall-deb.de/doc-ueberall/ueber-uns/';
              if (await canLaunch(url)) {
                await launch(
                  url,
                  forceSafariVC: true,
                );
              }
            }),
        ListTile(
            leading: Icon(Icons.question_answer),
            title: Text(
              'Oft gestellte Fragen ',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () async {
              final url = 'https://www.xn--doc-berall-deb.de/';
              if (await canLaunch(url)) {
                await launch(
                  url,
                  forceSafariVC: true,
                );
              }
            }),
        ListTile(
          leading: Icon(Icons.share),
          title: Text(
            'App Teilen',
            style: TextStyle(color: Colors.black),
          ),
          onTap: () {
            final RenderBox box = context.findRenderObject();
            Share.share(text,
                subject: subject,
                sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
          },
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
