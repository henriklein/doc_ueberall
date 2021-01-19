class Details {
  String id;
  String kapitelId;
  String kapitel;
  String themengebietId;
  String themengebiet;
  String articleText;
  String text;
  String link;

  Details(
      {this.kapitelId,
      this.themengebiet,
      this.themengebietId,
      this.articleText,
      this.link,
      this.text,
      this.kapitel,
      this.id});

  @override
  String toString() {
    return "Details{ id: $id, kapitel_id: $kapitelId, article_text: $articleText, link: $link,"
        "text: $text,  kapitel: $kapitel,}";
  }

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kapitelId = json['kapitel_id'];
    themengebiet = json['themengebiet'];
    themengebietId = json['themengebiet_id'];
    articleText = json['article_text'];
    link = json['link'];
    text = json['text'];
    kapitel = json['kapitel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['kapitel_id'] = this.kapitelId;
    data['themengebiet'] = this.themengebiet;
    data['themengebiet_id'] = this.themengebietId;
    data['article_text'] = this.articleText;
    data['link'] = this.link;
    data['text'] = this.text;
    data['kapitel'] = this.kapitel;
    return data..removeWhere((_, value) => value == null);
  }
}
