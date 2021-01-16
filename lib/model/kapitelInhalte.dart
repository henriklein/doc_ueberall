class KapitelInhalte {
  String id;
  String artikel;
  String int_artikel;
  String header;
  String discription;
  String bookmarkchecked;
  bool checkbox;

  KapitelInhalte({
    this.id,
    this.int_artikel,
    this.artikel,
    this.checkbox,
    this.bookmarkchecked,
    this.header,
    this.discription,
  });

  @override
  String toString() {
    return "kapitelInhaltes{ id: $id, int_artikel: $int_artikel, artikel: $artikel,"
        "checkbox: $checkbox, bookmarkchecked: $bookmarkchecked, header: $header, discription: $discription }";
  }

  KapitelInhalte.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    int_artikel = json['int_artikel'];
    artikel = json['artikel'];
    checkbox = json['checkbox'];
    bookmarkchecked = json['bookmarkchecked'];
    header = json['header'];
    discription = json['discription'];
  }
}
