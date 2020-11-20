import 'package:doc_ueberall/components/doctor_card.dart';
import 'package:doc_ueberall/components/search_bar.dart';
import 'package:doc_ueberall/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

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
          padding: EdgeInsets.fromLTRB(
              width * 0.05, height * 0.05, width * 0.05, height * 0.01),
          child: Column(children: <Widget>[
            Header(),
            Search(),
          ]),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  List tags = [];

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
        Container(
            height: MediaQuery.of(context).size.height * 0.08,
            child: Column(children: [
              Image.asset(
                'assets/languages/germany.png',
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Text(
                "Sprache",
                style: TextStyle(color: kTitleTextColor),
              )
            ]))
      ],
    );
  }
}

class Search extends StatelessWidget {
  final tags = List<String>.generate(10000, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            "zuletzt gesucht",
            style: TextStyle(
              color: kTitleTextColor,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.015,
        ),
        SearchBar(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: Tags(
              itemCount: tags.length,
              itemBuilder: (
                int index,
              ) {
                return Tooltip(
                    message: tags[index],
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                child: Icon(
                                  Icons.person_outlined,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                backgroundColor: kOrangeColor,
                                maxRadius: 13,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(tags[index])
                            ],
                          ),
                        ),
                      ),
                    ));
              },
            ),
          ),
        ),
      ],
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
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
                height: _height * 0.01,
              ),
              buildDoctorList(context),
            ],
          ),
        ),
      ),
    );
  }

  buildDoctorList(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        children: <Widget>[
          TopicCard(
            'Notfallinstruktionen',
            'Heart Surgeon - Flower Hospitals',
            'assets/images/doctor1.png',
            kBlueColor,
          ),
          SizedBox(
            height: _height * 0.02,
          ),
          TopicCard(
            'Alle inhalte',
            'Eye Specialist - Flower Hospitals',
            'assets/images/doctor3.png',
            kOrangeColor,
          ),
          SizedBox(
            height: _height * 0.02,
          ),
          TopicCard(
            'vor der Reise',
            'Dental Surgeon - Flower Hospitals',
            'assets/images/doctor2.png',
            kYellowColor,
          ),
          SizedBox(
            height: _height * 0.02,
          ),
          TopicCard(
            'Wärend der Reise',
            'Eye Specialist - Flower Hospitals',
            'assets/images/doctor3.png',
            kOrangeColor,
          ),
          SizedBox(
            height: _height * 0.02,
          ),
        ],
      ),
    );
  }
}
