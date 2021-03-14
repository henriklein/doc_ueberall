class Details {
  String id;
  String kapitelId;
  String kapitel;
  String themengebietId;
  String themengebiet;
  String backgroundImg;
  String prio;
  String articleText;
  String text;
  String link;
  String icon;
  String subHeading;
  DateTime lastSeen;
  bool isSeen;
  bool isBookMarked;
  int index;

  Details(
      this.subHeading,
      this.kapitel,
      this.kapitelId,
      this.themengebietId,
      this.themengebiet,
      this.backgroundImg,
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
    id = json['L_id'];
    kapitelId = json['J_kapitel_id'];
    themengebiet = json['C_themengebiet'];
    themengebietId = json['K_themengebiet_id'];
    articleText =
        (json['E_article_text'] as String)?.replaceAll('<br/>', '\n\n');
    link = json['F_link'];
    subHeading = json['N_sub_heading'];
    text = json['D_article_header'];
    prio = json['M_prio'];
    backgroundImg = json['I_img'];
    kapitel = json['B_kapitel'];
    icon = json['H_icon'];
    lastSeen = json['last_seen'] == null
        ? null
        : DateTime.fromMillisecondsSinceEpoch(json['last_seen']);
    isSeen = json['is_seen'] ?? false;
    isBookMarked = json['is_bookmarked'];
    index = json['A_index'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['L_id'] = this.id;
    data['J_kapitel_id'] = this.kapitelId;
    data['C_themengebiet'] = this.themengebiet;
    data['K_themengebiet_id'] = this.themengebietId;
    data['E_article_text'] = this.articleText;
    data['I_img'] = this.backgroundImg;
    data['M_prio'] = this.prio;
    data['N_sub_heading'] = this.subHeading;
    data['F_link'] = this.link;
    data['D_article_header'] = this.text;
    data['B_kapitel'] = this.kapitel;
    data['H_icon'] = this.icon;
    data['last_seen'] = this.lastSeen?.millisecondsSinceEpoch;
    data['is_seen'] = this.isSeen;
    data['is_bookmarked'] = this.isBookMarked;
    data['A_index'] = this.index;
    return data..removeWhere((_, value) => value == null);
  }
}
