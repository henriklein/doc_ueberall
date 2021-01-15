class KapitelInhaltes {
  final List<KapitelInhalte> kapitelInhaltes;

  KapitelInhaltes({
    this.kapitelInhaltes,

  });

  @override
  String toString() {
    return 'kapitelInhaltes{ kapitelInhaltes : $kapitelInhaltes }';
  }

  factory KapitelInhaltes.fromJson(Map<dynamic, dynamic> json) => new KapitelInhaltes(
        kapitelInhaltes: json['kapitelInhaltes']
            ?.values
            ?.map((jsn) => KapitelInhalte.fromJson(jsn))
            ?.toList()
            ?.cast<KapitelInhalte>(),
      );

  Map<String, dynamic> toJson() => {"kapitelInhaltes": kapitelInhaltes};
}

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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['int_artikel'] = this.int_artikel;
    data['artikel'] = this.artikel;
    data['checkbox'] = this.checkbox;
    data['bookmarkchecked'] = this.bookmarkchecked;
    data['header'] = this.header;
    data['discription'] = this.discription;

    return data..removeWhere((_, value) => value == null);
  }
}
