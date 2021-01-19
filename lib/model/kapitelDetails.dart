class Details {
  String id;
  String kapitelId;
  String kapitel;
  String themengebietId;
  String themengebiet;
  String articleText;
  String text;
  String link;

  Details({
    this.kapitelId,
    this.themengebiet,
    this.themengebietId,
    this.articleText,
    this.link,
    this.text,
    this.kapitel,
  });

  @override
  String toString() {
    return "Details{ id: $id, kapitel_id: $kapitelId, article_text: $articleText, link: $link,"
        "text: $text,  kapitel: $kapitel,}";
  }

  Details.fromJson(Map<String, dynamic> json) {
    kapitelId = json['kapitel_id'];
    themengebiet = json['themengebiet'];
    themengebietId = json['themengebiet_id'];
    articleText = json['article_text'];
    link = json['link'];
    text = json['text'];
    kapitel = json['kapitel'];
  }
}
