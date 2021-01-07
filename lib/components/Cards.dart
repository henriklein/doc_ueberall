import 'package:doc_ueberall/constant.dart';
import 'package:doc_ueberall/screens/DetailScreen.dart';
import 'package:doc_ueberall/screens/KapitelInhalte.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class TopicCard extends StatelessWidget {
  const TopicCard(
      {Key key,
      this.header,
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
            leading: Image.asset(imgURL),
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
    this.kapitel,
    this.intKapitel,
    this.subtitle,
    this.header,
    this.keywoerter,
    this.bookmarkchecked,
    this.checkbox,
  }) : super(key: key);
  final String kapitel;
  final String intKapitel;
  final String header;
  final String keywoerter;

  final String subtitle;
  final Icon bookmarkchecked;

  final Icon checkbox;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  KapitelInhalte()), //Link to Information page
        );
      },
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
                          color: primaryTextColor, fontWeight: FontWeight.bold,
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
                          header,
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
                          subtitle,
                          style: TextStyle(
                            color: secondaryTextColor,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(
                          height: 15,
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Keywörter",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: primaryTextColor
                                  ),
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
                            )
                          ],
                        )
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

class BuildInhaltCard extends StatelessWidget {
  const BuildInhaltCard({
    Key key,
    this.kapitel,
    this.intKapitel,
    this.subtitle,
    this.header,
    this.keywoerter,
    this.bookmarkchecked,
    this.checkbox,
  }) : super(key: key);
  final String kapitel;
  final String intKapitel;
  final String header;
  final String keywoerter;

  final String subtitle;
  final Icon bookmarkchecked;

  final Icon checkbox;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  DetailPage()), //Link to Information page
        );
      },
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
                                text: " Thema",
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
                          fontWeight: FontWeight.bold
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
                          header,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: primaryTextColor
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          subtitle,
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
                          icon: checkbox, color: Colors.green, onPressed: () {}),
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
