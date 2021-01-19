import 'package:doc_ueberall/components/Cards.dart';
import 'package:doc_ueberall/model/kapitelDetails.dart';
import 'package:doc_ueberall/screens/DetailScreen/viewModel/DetailScreenViewModel.dart';
import 'package:doc_ueberall/viewModelProvider/ViewModelProvider.dart';
import 'package:flutter/material.dart';

import 'package:doc_ueberall/constant.dart';

class DetailPage extends StatefulWidget {
  final String id;

  const DetailPage({Key key, this.id}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  DetailScreenViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = ViewModelProvider.of<DetailScreenViewModel>(context);
    viewModel.getDetails(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: StreamBuilder<Details>(
        stream: viewModel.outDetailScreen,
        builder: (BuildContext context, AsyncSnapshot<Details> snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircularProgressIndicator(
                    backgroundColor: Color.fromRGBO(0, 0, 255, 1),
//                        value: null,
                    strokeWidth: 7.0,
                  ),
                ],
              ),
            );
          return SafeArea(
            bottom: false,
            child: Stack(
              children: <Widget>[
                Positioned(
                  right: -64,
                  child: Opacity(
                      opacity: 0.2,
                      child: Image.network(
                        "https://images.all-free-download.com/images/graphiclarge/travel_people_icons_design_camera_and_luggages_style_6826459.jpg",
                        scale: 2.2,
                      )),
                ),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 300),

                            /*
                        ---
                         Display Article Name
                        ---
                        */
                            Text(
                              "Reise-\nvorbereitung", //Trip Preporation
                              style: TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: 50,
                                color: primaryTextColor,
                                fontWeight: FontWeight.w900,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              'Alles auf eienem Blick!', //Everything oyou need to know (static)
                              style: TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: 31,
                                color: primaryTextColor,
                                fontWeight: FontWeight.w300,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Divider(color: kGreyColor),
                            SizedBox(height: 32),

                            /*
                        ---
                         Display actually Plain Article Text
                         ---
                         */
                            Text(
                              snapshot.data.articleText,
                              maxLines: 1000,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: 16,
                                color: secondaryTextColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(color: kGreyColor),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Web Links',
                              style: TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: 25,
                                color: primaryTextColor,
                                fontWeight: FontWeight.w300,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            /*
                        ---
                        Initialize a variable called Links or something where I can add links using firebase, If needed
                        Initialize as weblink = "";
                        ---
                        */
                            Text(
                              snapshot.data.link,
                              style: TextStyle(color: secondaryTextColor),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(color: kGreyColor),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Schnellaktionen', //quick actions
                              style: TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: 25,
                                color: primaryTextColor,
                                fontWeight: FontWeight.w300,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Als Gekesen Makieren", //State as Read
                                  style: TextStyle(color: secondaryTextColor),
                                ),
                                IconButton(
                                  icon: Icon(Icons.check_box_outline_blank),
                                  onPressed: () {},
                                ),
                                Text(
                                  "Speichern", //bookmark
                                  style: TextStyle(color: secondaryTextColor),
                                ),
                                IconButton(
                                    icon: Icon(Icons.bookmark_outline),
                                    onPressed: () {})
                              ],
                            ),
                            Divider(color: kGreyColor),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Nächste Themen', //next Articles
                              style: TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: 25,
                                color: primaryTextColor,
                                fontWeight: FontWeight.w300,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(
                              height: 20,
                            ),

                            /*
                        ---
                          Display all uplollowing Articles in that Chapter using BuildInhaltCard
                          Display on the bottom the next big chaptor that is following the current one
                        ---
                        */
                            TopicCard(
                              header: 'Reisen bei Vorerkrankungen',
                              description: 'Erkundige dich wie du...',
                              imgURL: 'assets/SVGs/prepare.svg',
                              bgColor: kRedColor,
                              press: () {},
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),

                      /*
                  ---
                     Display on the bottom the next big chaptor that is following the current one
                  ---
                  */
                      BuildKapitelCard(
                        kapitel: "Zweites ",
                        intKapitel: "2",
                        header: "Kleine Medikamentenkunde",
                        description:
                            "Erkundige dich über lokale Viren und möglichn Schutz.",
                        keywoerter:
                            "Kleine Medikamentenkunde, Anwendungsweisen, Medikamente, Mikrobiologische Medikamente, Schmerzmittel und fiebersenkende Mittel, Entzündungshemmende Mittel ",
                        bookmarkchecked: Icon(Icons.bookmark),
                        checkbox: Icon(Icons.check_box_outlined),
                      ),
                    ],
                  ),
                ),

                /*
            ---
              Display First Letter of Chapter
            ---
            */
                Positioned(
                  top: 60,
                  left: 32,
                  child: Text(
                    "R",
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 247,
                      color: primaryTextColor.withOpacity(0.08),
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class PlanetInfo {}
