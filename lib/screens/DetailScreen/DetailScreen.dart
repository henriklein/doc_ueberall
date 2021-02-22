import 'package:doc_ueberall/components/Cards.dart';
import 'package:doc_ueberall/model/kapitelDetails.dart';
import 'package:doc_ueberall/screens/DetailScreen/viewModel/DetailScreenViewModel.dart';
import 'package:doc_ueberall/screens/routes.dart';
import 'package:doc_ueberall/viewModelProvider/ViewModelProvider.dart';
import 'package:flutter/material.dart';

import 'package:doc_ueberall/constant.dart';

class DetailPage extends StatefulWidget {
  final Details detail;
  final int totalDetails;
  final int kapitelInt;
  final int topicInt;

  const DetailPage(
      {Key key, this.detail, this.kapitelInt, this.topicInt, this.totalDetails})
      : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  DetailScreenViewModel viewModel;
  Details detail;
  Details nextDetail;

  @override
  void initState() {
    super.initState();
    viewModel = ViewModelProvider.of<DetailScreenViewModel>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: StreamBuilder<List<Details>>(
        stream: viewModel.outDetailScreen,
        builder: (BuildContext context, AsyncSnapshot<List<Details>> snapshot) {
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
          detail = snapshot.data
              .where((element) => element.index == widget.detail.index)
              .first;
          nextDetail = snapshot.data
              .where((element) => element.index == widget.detail.index + 1)
              .first;
          return SafeArea(
            bottom: false,
            child: Stack(
              children: <Widget>[
                Positioned(
                  right: -64,
                  child: Opacity(
                      opacity: 0.2,
                      child: Image.network(
                        (detail.backgroundImg != '')
                            ? detail.backgroundImg
                            : "https://images.all-free-download.com/images/graphiclarge/travel_people_icons_design_camera_and_luggages_style_6826459.jpg",
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'widget.detail.index / ${widget.totalDetails}',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            /*
                        ---
                         Display Article Name
                        ---
                        */
                            Text(
                              detail.text, //Trip Preporation
                              style: TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: 50,
                                color: primaryTextColor,
                                fontWeight: FontWeight.w900,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              detail.subHeading ??
                                  '', //Everything oyou need to know (static)
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
                              detail.articleText,
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
                            (detail.link == '')
                                ? Container()
                                : Text(
                                    'Web Links',
                                    style: TextStyle(
                                      fontFamily: 'Avenir',
                                      fontSize: 25,
                                      color: primaryTextColor,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                            (detail.link == '')
                                ? Container()
                                : SizedBox(
                                    height: 10,
                                  ),

                            /*
                        ---
                        Initialize a variable called Links or something where I can add links using firebase, If needed
                        Initialize as weblink = "";
                        ---
                        */
                            (detail.link == '')
                                ? Container()
                                : Text(
                                    detail.link,
                                    style: TextStyle(color: secondaryTextColor),
                                  ),
                            (detail.link == '')
                                ? Container()
                                : SizedBox(
                                    height: 10,
                                  ),
                            (detail.link == '')
                                ? Container()
                                : Divider(color: kGreyColor),
                            (detail.link == '')
                                ? Container()
                                : SizedBox(
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
                                  icon: (detail.isSeen ?? false)
                                      ? Icon(Icons.check_box_outlined)
                                      : Icon(Icons.check_box_outline_blank),

//                              icon: Icon(Icons.check_box_outline_blank),
                                  onPressed: () {
                                    setState(() {
//                                      detail.isSeen != detail?.isSeen ?? false;
                                    });
                                    viewModel.seen(detail);
                                  },
                                ),
                                Text(
                                  "Speichern", //bookmark
                                  style: TextStyle(color: secondaryTextColor),
                                ),
                                IconButton(
                                    icon: (detail.isBookMarked ?? false)
                                        ? Icon(Icons.bookmark)
                                        : Icon(Icons.bookmark_outline),
                                    onPressed: () {
                                      viewModel.bookMark(detail);
                                      setState(() {
//                                        detail.isBookMarked !=
//                                                detail?.isBookMarked ??
//                                            false;
                                      });
                                    })
                              ],
                            ),
                            Divider(color: kGreyColor),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),

                      /*
                  ---
                     Display on the bottom the next big chaptor that is following the current one
                  ---
                  */
                      BuildArticleCard(
                        artikel:
                            'Next up', //Displaying Noumber of Article inside that Chapter as wirtten out (Initialize as "", Ill add real data later using firebase)
                        intartikel: '', //int of current article
                        header: nextDetail
                            .text, //Header of Article inside of theee Chapter
                        discription: nextDetail
                            .articleText, //needs to be initializeed (add "Lorum Ipsum sentence", Ill add real data later using Firebase)
                        fun: () {
//                      viewModel.justSaw(detail);
                          Navigator.of(context).pushNamed(AppRoutes.DETAILPAGE,
                              arguments: {
                                'detail': nextDetail
                              }); //Link to Information page
                        },
                        bookmarkchecked: IconButton(
                          icon: (nextDetail?.isBookMarked ?? false)
                              ? Icon(Icons.bookmark)
                              : Icon(Icons.bookmark_outline),
                          onPressed: () {
                            viewModel.bookMark(nextDetail);
//                            setState(() {});
                          },
                        ),
                        checkbox: IconButton(
                          icon: (nextDetail?.isSeen ?? false)
                              ? Icon(Icons.check_box_outlined)
                              : Icon(Icons.check_box_outline_blank),
                          onPressed: () {
                            viewModel.seen(nextDetail);
//                            setState(() {
////                              nextDetail.isSeen != nextDetail?.isSeen ?? false;
//                            });
                          },
                        ),
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
                    detail.text[0].toUpperCase(),
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 247,
                      color: primaryTextColor.withOpacity(0.08),
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.DETAILPAGE,
                            arguments: {
                              'detail': nextDetail
                            }); //Link to Information page
                      },
                    ),
                  ],
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
