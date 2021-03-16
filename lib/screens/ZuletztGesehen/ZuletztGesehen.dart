import 'package:doc_ueberall/components/Cards.dart';
import 'package:doc_ueberall/constant.dart';
import 'package:doc_ueberall/model/kapitelDetails.dart';
import 'package:doc_ueberall/screens/DetailScreen/viewModel/DetailScreenViewModel.dart';
import 'package:doc_ueberall/screens/routes.dart';
import 'package:doc_ueberall/viewModelProvider/ViewModelProvider.dart';
import 'package:flutter/material.dart';

class ZuletztGesehen extends StatefulWidget {
  @override
  _ZuletztGesehenState createState() => _ZuletztGesehenState();
}

class _ZuletztGesehenState extends State<ZuletztGesehen> {
  DetailScreenViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = ViewModelProvider.of<DetailScreenViewModel>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 50, 30, 20),
            child: Row(
              children: [
                IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                Flexible(
                    child: Text(
                  "Zuletzt Gesehen", //saved Articles
                  style: TextStyle(fontSize: 30, color: primaryTextColor),
                )),
              ],
            ),
          ),
          StreamBuilder<List<Details>>(
            stream: viewModel.outDetailScreen,
            builder:
                (BuildContext context, AsyncSnapshot<List<Details>> snapshot) {
              if (!snapshot.hasData)
                return Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CircularProgressIndicator(
                        backgroundColor: Color.fromRGBO(0, 0, 255, 1),
                        strokeWidth: 7.0,
                      ),
                    ],
                  ),
                );

              List<Details> details = snapshot.data
                  .where((element) => element.isSeen == true)
                  .toList()
                  .cast<Details>()
                    ..sort((detailA, detailB) =>
                        detailA.index.compareTo(detailB.index));
              if (details.length == 0) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.3),
                      ),
                      Text(
                        "No Articles seen",
                        style: TextStyle(
                            color: secondaryTextColor,
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
              return Expanded(
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
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: ListView.builder(
                          itemCount: details.length,
                          itemBuilder: (context, index) {
                            var detail = details[index];
                            return BuildArticleCard(
                              header: detail
                                  .text, //Header of Article inside of theee Chapter
                              discription: detail
                                  .articleText, //needs to be initializeed (add "Lorum Ipsum sentence", Ill add real data later using Firebase)
                              fun: () {
                                viewModel.justSaw(detail);
                                Navigator.of(context).pushNamed(
                                    AppRoutes.DETAILPAGE,
                                    arguments: {
                                      'detail': detail,
                                      'total_details': snapshot.data.length
                                    }); //Link to Information page
                              },
                              bookmarkchecked: IconButton(
                                icon: (details[index].isBookMarked ?? false)
                                    ? Icon(Icons.bookmark)
                                    : Icon(Icons.bookmark_outline),
                                onPressed: () {
                                  viewModel.bookMark(detail);
                                },
                              ),
                              checkbox: IconButton(
                                icon: (details[index]?.isSeen ?? false)
                                    ? Icon(Icons.check_box_outlined)
                                    : Icon(Icons.check_box_outline_blank),
                                onPressed: () {
                                  viewModel.seen(detail);
                                },
                              ),
                            );
                          })),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

//import 'package:doc_ueberall/components/Cards.dart';
//import 'package:doc_ueberall/constant.dart';
//import 'package:flutter/material.dart';
//
//class ZuletztGesehen extends StatefulWidget {
//  @override
//  _ZuletztGesehenState createState() => _ZuletztGesehenState();
//}
//
//class _ZuletztGesehenState extends State<ZuletztGesehen> {
//  @override
//  Widget build(BuildContext context) {
//    double height = MediaQuery.of(context).size.height;
//    return Scaffold(
//      backgroundColor: kBackgroundColor,
//      body: Column(
//        children: [
//          Padding(
//            padding: EdgeInsets.fromLTRB(20, 50, 30, 20),
//            child: Row(
//              children: [
//                IconButton(
//                    icon: Icon(Icons.arrow_back_ios),
//                    onPressed: () {
//                      Navigator.pop(context);
//                    }),
//                Flexible(
//                    child: Text(
//                  "Zuletzt Gesehen", //last seen / History
//                  style: TextStyle(fontSize: 30, color: primaryTextColor),
//                )),
//              ],
//            ),
//          ),
//          Expanded(
//            child: Container(
//              decoration: BoxDecoration(
//                color: Colors.white.withOpacity(1),
//                borderRadius: BorderRadius.only(
//                    topLeft: Radius.circular(30),
//                    topRight: Radius.circular(23)),
//                boxShadow: [
//                  BoxShadow(
//                    color: Colors.grey.withOpacity(0.5),
//                    spreadRadius: 3,
//                    blurRadius: 5,
//                    offset: Offset(0, 3), // changes position of shadow
//                  ),
//                ],
//              ),
//              child: Padding(
//                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
//                child: SingleChildScrollView(
//                  child: Column(children: <Widget>[
//                    SizedBox(
//                      height: height * 0.05,
//                    ),
//                    BuildInhaltCard(
//                      artikel:
//                          "Erstes ", //curreent Article Noumber as wiritten out (needs to  be initialized as "", ill add real data later)
//                      intartikel: "1", //int of current Article
//                      header: "Reisevorbereitung", //Header of Article
//                      discription: //Needs to be initialized as "lorum Ipsum sentence, Ill add real data later"
//                          "Alles was sie zum Reiseantritt wissen müssen auf einen Blick.",
//                    ),
//                    BuildInhaltCard(
//                      artikel: "Zweites ",
//                      intartikel: "2",
//                      header: "Reisen bei Vorerkrankungen",
//                      discription:
//                          "Erkundige dich über lokale Viren und möglichn Schutz.",
//                    ),
//                  ]),
//                ),
//              ),
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//}
