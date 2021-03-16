import 'package:doc_ueberall/constant.dart';
import 'package:doc_ueberall/screens/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class SearchBar extends StatelessWidget {
  String currentStr;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.7,
          padding: EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            color: kBoxBackground,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: TextField(
              onChanged: (str) {
                currentStr = str;
              },
              decoration: InputDecoration.collapsed(
                hintText: 'Hier suchen!', //search  here
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: MaterialButton(
            onPressed: () {
              HapticFeedback.heavyImpact();
              if (currentStr != null)
                Navigator.of(context)
                    .pushNamed(AppRoutes.SEARCH_LIST, arguments: {
                  'search_string': currentStr,
                });
            },
            color: kRedColor,
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            // child: SvgPicture.asset('assets/icons/search.svg'),
          ),
        ),
      ],
    );
  }
}
