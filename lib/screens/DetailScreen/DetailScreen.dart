import 'package:doc_ueberall/components/Cards.dart';
import 'package:flutter/material.dart';

import 'package:doc_ueberall/constant.dart';

class DetailPage extends StatefulWidget {
  final String id;

  const DetailPage({Key key, this.id}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    print("id is ${widget.id}");
    return Scaffold(
      body: SafeArea(
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
                          "Anders als Versicherungsmakler können Impfungen wirklich schützen. Jedenfalls wenn sie angemessen ausgewählt und rechtzeitig begonnen werden. (siehe Kap. Malariasituation und Impfvorschriften). Die Situationen in den verschiedenen Ländern wandeln sich, teils treten Resistenzen von Erregern gegen Impfungen / Vorbeugungen auf, teils werden auch Impfungen überflüssig, so dass dem Körper eine Belastung erspart werden kann. Aktuelle Auskünfte bekommt man bei allen Impfstellen/Gesundheitsämtern oder www.tropeninstitut.de. Die tropenmedizinischen Institute und Gelbfieberimpfstellen sind zumeist aktuell informiert (siehe Kap. Impfstellen). Dort weiß man auch Bescheid über andere Gesundheitsrisiken im jeweiligen Reiseland. Die notwendigen Impfungen, die zeitliche Abfolge und Impfarten sind im Kap. Infektionskrankheiten beschrieben.",
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
                          "www.tropeninstitut.de",
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
      ),
    );
  }
}

class PlanetInfo {}