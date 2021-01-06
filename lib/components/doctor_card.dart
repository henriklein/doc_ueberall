import 'package:doc_ueberall/constant.dart';
import 'package:flutter/material.dart';
import 'package:doc_ueberall/screens/alleInhalte.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class InhalteCard extends StatefulWidget {
  var _search;
  var _name;
  var _description;
  var _imageUrl;
  var _bgColor;

  InhalteCard(this._search, this._name, this._description, this._imageUrl,
      this._bgColor);

  @override
  _InhalteCardState createState() => _InhalteCardState();
}

class _InhalteCardState extends State<InhalteCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AlleThemen()), //Link to Information page
        );
        HapticFeedback.mediumImpact();
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: widget._bgColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListTile(
            leading: Image.asset(widget._imageUrl),
            title: Text(
              widget._name,
              style: TextStyle(
                color: kTitleTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              widget._description,
              style: TextStyle(
                color: kTitleTextColor.withOpacity(0.7),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
