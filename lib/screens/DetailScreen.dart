import 'package:doc_ueberall/components/doctor_card.dart';
import 'package:flutter/material.dart';

import 'package:doc_ueberall/constant.dart';
class DetailPage extends StatelessWidget {
  final PlanetInfo planetInfo;
  
    const DetailPage({Key key, this.planetInfo}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: SafeArea(
          bottom: false,
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 300),
                          Text(
                            "Impfungen",
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 56,
                              color: primaryTextColor,
                              fontWeight: FontWeight.w900,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            'Alles auf eienem Blick!',
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 31,
                              color: primaryTextColor,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Divider(color: Colors.black38),
                          SizedBox(height: 32),
                          Text(
                            "Anders als Versicherungsmakler können Impfungen wirklich schützen. Jedenfalls wenn sie angemessen ausgewählt und rechtzeitig begonnen werden. (siehe Kap. Malariasituation und Impfvorschriften). Die Situationen in den verschiedenen Ländern wandeln sich, teils treten Resistenzen von Erregern gegen Impfungen / Vorbeugungen auf, teils werden auch Impfungen überflüssig, so dass dem Körper eine Belastung erspart werden kann. Aktuelle Auskünfte bekommt man bei allen Impfstellen/Gesundheitsämtern oder www.tropeninstitut.de. Die tropenmedizinischen Institute und Gelbfieberimpfstellen sind zumeist aktuell informiert (siehe Kap. Impfstellen). Dort weiß man auch Bescheid über andere Gesundheitsrisiken im jeweiligen Reiseland. Die notwendigen Impfungen, die zeitliche Abfolge und Impfarten sind im Kap. Infektionskrankheiten beschrieben.",
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 20,
                              color: contentTextColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 30),
                          Divider(color: Colors.black38),
                          Text(
                        'Subthemen',
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 25,
                          color: const Color(0xff47455f),
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.left,
                      ),

                          Divider(color: Colors.black38),
                        ],
                      ),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32,0,32, 0),
                      child: Text(
                        'ähnliche Links',
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 25,
                          color: const Color(0xff47455f),
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                   Padding(
                     padding: const EdgeInsets.all(32.0),
                     child: InhalteCard(
          'AlleInhalte',
          'Alle inhalte',
          'Sehen sie alle unsere Inhalte auf einen Blick',
          'assets/images/doctor3.png',
          kOrangeColor,
        ),
        
                   ), 
                    Padding(
                      padding: const EdgeInsets.only(left: 32.0, right: 32, bottom: 32),
                      child: Divider(color: Colors.black38),
                    ),
                    Container(
                      height: 250,
                      padding: const EdgeInsets.only(left: 32.0),
                      child: ListView.builder(
                          itemCount: 2,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Card(
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Image.network(
                                    "https://media.macphun.com/img/uploads/customer/how-to/579/15531840725c93b5489d84e9.43781620.jpg?q=85&w=1340",
                                    fit: BoxFit.cover,
                                  )),
                            );
                          }),
                    ),
                  ],
                ),
              ),
              
              Positioned(
                right: -64,
                child: Hero(
                    tag: "planetInfo.position",
                    child: Image.network("https://images.all-free-download.com/images/graphiclarge/travel_people_icons_design_camera_and_luggages_style_6826459.jpg", scale: 2,)),
              ),
              Positioned(
                top: 60,
                left: 32,
                child: Text(
                  "I",
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
  
  class PlanetInfo {
}