import 'package:doc_ueberall/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';


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
      this.press,
      })
      : super(key: key);


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
          title:  DecoratedBox(
            decoration: BoxDecoration(
              //color: bgColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.all(0),
              child: ListTile(
                leading: Container(
                    width: 70,
                    child: SvgPicture.asset(
                      imgURL,
                      width: 70,
                      height: 70,
                    )),
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
              padding: const EdgeInsets.only(left: 20.0,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Big Bang'),
                  Icon(Icons.arrow_forward_ios,size: 10,),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Birth of the Sun'),
                  Icon(Icons.arrow_forward_ios,size: 10,),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Earth is Born'),
                  Icon( Icons.arrow_forward_ios,size: 10,)
                ]
              ),
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
                child: SvgPicture.asset(
                  imgURL,
                  width: 70,
                  height: 70,
                )),
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
    this.kapitel, //Chapter noumber written out (first (chapteer), second (chapter), etc...)
    this.intKapitel, // Chapter as Intiger
    this.header, // Chapter Name
    this.description, // Subtitle not initialized yet, just add one  "Lorum Ipsum" sentence to database
    this.keywoerter, // Article Headers inside of that Chapter shown in Row
    this.fun, //common sence
  }) : super(key: key);
  final String kapitel;
  final String intKapitel;
  final String header;
  final String keywoerter;
  final String description;
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
                            text: kapitel,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: primaryTextColor,
                            ),
                            children: [
                              TextSpan(
                                text: " Kapitel",
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: secondaryTextColor,
                                ),
                              )
                            ]),
                      ),
                      Text(
                        intKapitel,
                        style: TextStyle(
                          color: primaryTextColor,
                          fontWeight: FontWeight.bold,
                        ),
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
                          header ?? '',
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
                          description,
                          style: TextStyle(
                            color: secondaryTextColor,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.edit,
                              size: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Themengebiete", //Articles Covered
                                    style: TextStyle(
                                        fontSize: 15, color: primaryTextColor),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    keywoerter,
                                    style: TextStyle(
                                      color: secondaryTextColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
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
                                text: " Thema",
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
