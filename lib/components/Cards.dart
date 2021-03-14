import 'package:doc_ueberall/constant.dart';
import 'package:doc_ueberall/model/kapitels.dart';
import 'package:doc_ueberall/screens/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:math';

/*
---
 right now only header and discription should be added to the database
 Add missing variables to the database as seen below, one sentence, so that i can fulfill it later
  description: "Lorum ipsum";

I think this file is pretty strait forwarded
---
*/
class TopicCard extends StatelessWidget {
  const TopicCard(
      {Key key,
      this.header, //common sence
      this.description,
      this.imgURL,
      this.bgColor,
      this.press})
      : super(key: key);

  final String header;
  final String description;
  final String imgURL;
  final Color bgColor;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        press();
        HapticFeedback.mediumImpact();
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: bgColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListTile(
            leading: Container(
                width: 70,
                // child: SvgPicture.asset(
                //   imgURL,
                //   width: 70,
                //   height: 70,
                // )
                ),
            title: Text(
              header,
              style: TextStyle(
                color: primaryTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              description,
              style: TextStyle(
                color: secondaryTextColor.withOpacity(0.7),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BuildKapitelCard extends StatelessWidget {
  const BuildKapitelCard({
    Key key,
    this.kapitel, //common sence
  }) : super(key: key);
  final Kapitel kapitel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.primaries[Random().nextInt(Colors.primaries.length)]
                .withOpacity(0.1),
            border: Border.all(width: 1, color: Colors.grey[300]),
            borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.only(right: 0, left: 0),
        padding: EdgeInsets.all(5),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // SvgPicture.asset(
                  //   "assets/SVGs/prepare.svg",
                  //   width: 50,
                  //   height: 50,
                  // ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          kapitel.kapitel ?? '',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: primaryTextColor,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          kapitel.description,
                          style: TextStyle(
                            color: secondaryTextColor,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              children: kapitel.kapitelInhaltes
                  .map((e) => InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(AppRoutes.ARTICLE_LIST, arguments: {
                            'th_id': e.id,
                            'kapitel': kapitel,
                          });
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20, top: 5, bottom: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(e.themengebiet),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 12,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ))
                  .toList()),
        ),
      ),
    );
  }
}

class BuildInhaltCard extends StatelessWidget {
  const BuildInhaltCard({
    Key key,
    this.artikel, //look top
    this.intartikel, //look top
    this.header, //look up
    this.discription, //look up

    this.fun,
  }) : super(key: key);
  final String artikel;
  final String intartikel;
  final String header;
  final String discription;
  final fun;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fun,
      child: Container(
        margin: EdgeInsets.only(bottom: 25),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 15,
                  height: 10,
                  decoration: BoxDecoration(
                      color: kRedColor,
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(5),
                      )),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: artikel,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: primaryTextColor,
                            ),
                            children: [
                              TextSpan(
                                text: " Thema",
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: secondaryTextColor,
                                ),
                              )
                            ]),
                      ),
                      Text(
                        intartikel,
                        style: TextStyle(
                            color: primaryTextColor,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey[300]),
                  borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsets.only(right: 10, left: 30),
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          header,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: primaryTextColor),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          discription ?? "",
                          style: TextStyle(
                            color: secondaryTextColor,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
//                      IconButton(
//                          icon: checkbox,
//                          color: Colors.green,
//                          onPressed: () {}),
//                      IconButton(
//                        icon: bookmarkchecked,
//                        color: Colors.orange,
//                        onPressed: () {},
//                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BuildArticleCard extends StatelessWidget {
  const BuildArticleCard({
    Key key,
    this.artikel, //look top
    this.intartikel, //look top
    this.header, //look up
    this.discription, //look up

    this.fun,
    this.bookmarkchecked, //Display as Tags on Dashboard and on GespeicherteArtikelViewModel.dart
    this.checkbox, // Display on ZuletztGesehen.dart
  }) : super(key: key);
  final String artikel;
  final String intartikel;
  final String header;
  final String discription;
  final IconButton bookmarkchecked;
  final fun;

  final IconButton checkbox;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fun,
      child: Container(
        margin: EdgeInsets.only(bottom: 25),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 15,
                  height: 10,
                  decoration: BoxDecoration(
                      color: kRedColor,
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(5),
                      )),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: artikel,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: primaryTextColor,
                            ),
                            children: [
                              TextSpan(
                                text: (artikel == "Next up") ? "" : " Thema",
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: secondaryTextColor,
                                ),
                              )
                            ]),
                      ),
                      Text(
                        intartikel ?? "",
                        style: TextStyle(
                            color: primaryTextColor,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey[300]),
                  borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsets.only(right: 10, left: 30),
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          header,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: primaryTextColor),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          discription,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: TextStyle(
                            color: secondaryTextColor,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      IconButton(
                          icon: checkbox,
                          color: Colors.green,
                          onPressed: () {}),
                      IconButton(
                        icon: bookmarkchecked,
                        color: Colors.orange,
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SearchArticleCard extends StatelessWidget {
  const SearchArticleCard({
    Key key,
    this.artikel, //look top
    this.intartikel, //look top
    this.header, //look up
    this.discription, //look up

    this.fun,
  }) : super(key: key);
  final String artikel;
  final String intartikel;
  final String header;
  final String discription;
  final fun;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fun,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        header,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: primaryTextColor),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        discription,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          color: secondaryTextColor,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider()
          ],
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    Key key,
    this.header, //common sence
    this.description,
    this.imgURL,
    this.bgColor,
    this.press,
  }) : super(key: key);

  final String header;
  final String description;
  final String imgURL;
  final Color bgColor;
  final Function press;
  // final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: bgColor.withOpacity(0.35),
      child: Padding(
        padding: EdgeInsets.all(0.0),
        child: ExpansionTile(
//          trailing: widget.trailing ?? RotationTransition(
//            turns: _iconTurns,
//            child: const Icon(Icons.expand_more),
//          ),
          title: DecoratedBox(
            decoration: BoxDecoration(
              //color: bgColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.all(0),
              child: ListTile(
                leading: Container(
                    width: 70,
                    // child: SvgPicture.asset(
                    //   imgURL,
                    //   width: 70,
                    //   height: 70,
                    // )
                    ),
                title: Text(
                  header,
                  style: TextStyle(
                    color: primaryTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  description,
                  style: TextStyle(
                    color: secondaryTextColor.withOpacity(0.7),
                  ),
                ),
              ),
            ),
          ),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Big Bang'),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 10,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Birth of the Sun'),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 10,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Earth is Born'),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 10,
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
    return InkWell(
      onTap: () {
        press();
        HapticFeedback.mediumImpact();
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: bgColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListTile(
            leading: Container(
                width: 70,
                // child: SvgPicture.asset(
                //   imgURL,
                //   width: 70,
                //   height: 70,
                // )
                ),
            title: Text(
              header,
              style: TextStyle(
                color: primaryTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              description,
              style: TextStyle(
                color: secondaryTextColor.withOpacity(0.7),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
