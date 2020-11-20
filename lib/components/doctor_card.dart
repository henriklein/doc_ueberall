import 'package:doc_ueberall/constant.dart';
import 'package:doc_ueberall/screens/detail_screen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TopicCard extends StatefulWidget {
  var _name;
  var _description;
  var _imageUrl;
  var _bgColor;

  TopicCard(this._name, this._description, this._imageUrl, this._bgColor);

  @override
  _TopicCardState createState() => _TopicCardState();
}

class _TopicCardState extends State<TopicCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(widget._name, widget._description, widget._imageUrl),
          ),
        );
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
