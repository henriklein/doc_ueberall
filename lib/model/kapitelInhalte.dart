class KapitelzInhalte {
  String id;
  String themengebiet;
  int prio;
  String header;
  String description;
//  String bookmarkchecked;
  String iconLink;
//  bool isSeen;
//  bool isBookmarked;

  KapitelzInhalte({
    this.id,
    this.prio,
    this.themengebiet,
//    this.isSeen,
//    this.isBookmarked,
//    this.bookmarkchecked,
    this.header,
  });

  @override
  String toString() {
    return "kapitelInhaltes{ id: $id, int_artikel: $prio, themengebiet: $themengebiet,"
        " header: $header, description: $description }";
  }

  KapitelzInhalte.fromJson(Map<String, dynamic> json) {
    id = json['Tg_id'];
    prio = int.parse(json['prio']);
    themengebiet = json['themengebiet'];
//    bookmarkchecked = json['bookmarkchecked'];
    header = json['header'];
    description = json['description'] ?? "";
//    isSeen = json['is_seen'];
//    isBookmarked = json['is_bookmarked'];
    iconLink = json['icon_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Tg_id'] = this.id;
    data['prio'] = this.prio;
    data['themengebiet'] = this.themengebiet;
    data['description'] = this.description;
    data['header'] = this.header;
//    data['bookmarkchecked'] = this.bookmarkchecked;
//    data['is_seen'] = this.isSeen;
//    data['is_bookmarked'] = this.isBookmarked;
    data['icon_link'] = this.iconLink;
    return data..removeWhere((_, value) => value == null);
  }
}
