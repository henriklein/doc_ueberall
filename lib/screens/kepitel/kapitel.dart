import 'package:doc_ueberall/components/Cards.dart';
import 'package:doc_ueberall/constant.dart';
import 'package:doc_ueberall/model/kapitels.dart';
import 'package:doc_ueberall/screens/kepitel/viewModel/kepitelViewModel.dart';
import 'package:doc_ueberall/screens/routes.dart';
import 'package:doc_ueberall/viewModelProvider/ViewModelProvider.dart';
import 'package:flutter/material.dart';

class KapitolScreen extends StatefulWidget {
  @override
  _KapitolScreenState createState() => _KapitolScreenState();
}

class _KapitolScreenState extends State<KapitolScreen> {
  KepitolsViewModel viewModel;
  @override
  void initState() {
    super.initState();
    viewModel = ViewModelProvider.of<KepitolsViewModel>(context);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: StreamBuilder<Kepitels>(
        stream: viewModel.outKepitols,
        builder: (BuildContext context, AsyncSnapshot<Kepitels> snapshot) {
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
          final int chatsCount = snapshot.data.kepitols?.length ?? 0;
          if (chatsCount == 0) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
//                        Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.3),),
//                  Image.asset(
//                    "assets/no_chats.png",
////                    color: AppColors.darkBlue[900],
//                    height: 120,
//                    fit: BoxFit.fitHeight,
//                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.3),
                  ),
                  Text(
                    "All Chapter will appear here",
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
          return Column(
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
                      "Alle Kapitel", //ALL Chaptors
                      style: TextStyle(fontSize: 30, color: primaryTextColor),
                    )),
                  ],
                ),
              ),
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
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: ListView.builder(
                          itemCount: chatsCount,
                          itemBuilder: (context, index) {
                            var chapter = snapshot.data.kepitols[index];
                            return BuildKapitelCard(
                              kapitel: chapter
                                  .header, //number of chapter written out. Needs to be initialized in the Databease as "" (Ill add real dara later)
                              intKapitel: chapter.prio, //in of current Chapter
                              header: chapter.kapitel, //Header of Chapter
                              description: chapter
                                  .description, //Discription needs to be initialized. Add One sentence of Lorum Ipsum or something, Ill add real data later
                              keywoerter:
                                  "Resevorbereitung, Reisen bei Vorerkrankungen", //Displaying all Headers of Articles inside that Chapter
                              fun: () {
                                Navigator.of(context).pushNamed(
                                    AppRoutes.KAPITELINHALTE,
                                    arguments: {
                                      'kapitel': snapshot.data.kepitols[index]
                                    }); //Link to Information page
                              },
                              bookmarkchecked: Icon(Icons.bookmark_outline),
                              checkbox: Icon(Icons.check_box_outlined),
                            );
                          })),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
