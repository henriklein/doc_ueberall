import 'package:doc_ueberall/screens/DetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:doc_ueberall/constant.dart';
import 'package:doc_ueberall/data.dart';
import 'package:flutter/services.dart';

class AlleThemen extends StatefulWidget {
  @override
  _AlleThemenState createState() => _AlleThemenState();
}

class _AlleThemenState extends State<AlleThemen> {
  List<String> inhalte = [
    ' Grundausstattung',
    '💊Reiseapotheke ',
    ' Impfungen'
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: Column(
          children: [
            SafeArea(
                child: Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Row(children: [
                IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                Flexible(
                    child: Text(
                  "Durchstöbere unsere ganze Datenbank",
                  style: TextStyle(fontSize: 20),
                )),
              ]),
            )),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(23)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: alleInhalte.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.0),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [],
                          border: Border.all(
                              color: Colors.grey.shade100, // set border color
                              width: 3.0), // set border width
                        ),
                        child: ListTile(
                          leading: Container(
                              width: 50,
                              child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    alleInhalte[index]['kapitel'].toString(),
                                    style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ))),
                          title: Text(alleInhalte[index]['kapitelThema']),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            HapticFeedback.lightImpact();
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
