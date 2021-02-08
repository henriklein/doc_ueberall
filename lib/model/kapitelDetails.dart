class Details {
  String id;
  String kapitelId;
  String kapitel;
  String themengebietId;
  String themengebiet;
  String header;
  String prio;
  String articleText;
  String text;
  String link;
  String icon;
  DateTime lastSeen;
  bool isSeen;
  bool isBookMarked;
  int index;

  Details(
      this.kapitel,
      this.kapitelId,
      this.themengebietId,
      this.themengebiet,
      this.header,
      this.prio,
      this.text,
      this.articleText,
      this.link,
      this.index);

  @override
  String toString() {
    return "Details{ id: $id, kapitel_id: $kapitelId, article_text: $articleText, link: $link,"
        "text: $text,  kapitel: $kapitel,}";
  }

  update(Details details) {
    this.isSeen = details.isSeen;
    this.lastSeen = details.lastSeen;
    this.isBookMarked = details.isBookMarked;
    return this;
  }

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kapitelId = json['kapitel_id'];
    themengebiet = json['themengebiet'];
    themengebietId = json['themengebiet_id'];
    articleText = json['article_text'];
    link = json['link'];
    text = json['text'];
    prio = json['prio'];
    header = json['header'];
    kapitel = json['kapitel'];
    icon = json['icon'];
    lastSeen = json['last_seen'] == null
        ? null
        : DateTime.fromMillisecondsSinceEpoch(json['last_seen']);
    isSeen = json['is_seen'];
    isBookMarked = json['is_bookmarked'];
    index = json['index'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['kapitel_id'] = this.kapitelId;
    data['themengebiet'] = this.themengebiet;
    data['themengebiet_id'] = this.themengebietId;
    data['article_text'] = this.articleText;
    data['header'] = this.header;
    data['prio'] = this.prio;
    data['link'] = this.link;
    data['text'] = this.text;
    data['kapitel'] = this.kapitel;
    data['icon'] = this.icon;
    data['last_seen'] = this.lastSeen?.millisecondsSinceEpoch;
    data['is_seen'] = this.isSeen;
    data['is_bookmarked'] = this.isSeen;
    data['index'] = this.index;
    return data..removeWhere((_, value) => value == null);
  }
}
