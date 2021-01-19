class KapitelzInhalte {
  String id;
  String themengebiet;
  String prio;
  String header;
  String description;
  String bookmarkchecked;
  bool checkbox;

  KapitelzInhalte({
    this.id,
    this.prio,
    this.themengebiet,
    this.checkbox,
    this.bookmarkchecked,
    this.header,
  });

  @override
  String toString() {
    return "kapitelInhaltes{ id: $id, int_artikel: $prio, themengebiet: $themengebiet,"
        "checkbox: $checkbox, bookmarkchecked: $bookmarkchecked, header: $header, description: $description }";
  }

  KapitelzInhalte.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    prio = json['prio'];
    themengebiet = json['themengebiet'];
    checkbox = json['checkbox'];
    bookmarkchecked = json['bookmarkchecked'];
    header = json['header'];
    description = json['description'] ?? "";
  }
}
