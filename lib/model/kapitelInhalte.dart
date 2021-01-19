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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['prio'] = this.prio;
    data['themengebiet'] = this.themengebiet;
    data['description'] = this.description;
    data['header'] = this.header;
    data['bookmarkchecked'] = this.bookmarkchecked;
    data['checkbox'] = this.checkbox;
    return data..removeWhere((_, value) => value == null);
  }
}
