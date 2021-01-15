class Details {
  final List<DetailScreen> detailScreens;

  Details({
    this.detailScreens,
  });

  @override
  String toString() {
    return 'Details{ detailScreens : $detailScreens }';
  }

  factory Details.fromJson(Map<dynamic, dynamic> json) => new Details(
        detailScreens: json['detailScreens']
            ?.values
            ?.map((jsn) => DetailScreen.fromJson(jsn))
            ?.toList()
            ?.cast<DetailScreen>(),
      );

  Map<String, dynamic> toJson() => {"detailScreens": detailScreens};
}

class DetailScreen {
  String id;
  String kapitel;
  String int_Kapitel;
  String header;
  String description;
  String keywoerter;
  String bookmarkchecked;
  String checkbox;


  DetailScreen({
    this.id,
    this.header,
    this.bookmarkchecked,
    this.checkbox,
    this.keywoerter,
    this.description,
    this.int_Kapitel,
    this.kapitel,
  });

  @override
  String toString() {
    return "detailScreen{ id: $id, header: $header, bookmarkchecked: $bookmarkchecked, checkbox: $checkbox, keywoerter: $keywoerter,"
        "description: $description, int_Kapitel: $int_Kapitel, kapitel: $kapitel,}";
  }

  DetailScreen.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    header = json['header'];
    bookmarkchecked = json['bookmarkchecked'];
    checkbox = json['checkbox'];
    keywoerter = json['keywoerter'];
    description = json['description'];
    int_Kapitel = json['int_Kapitel'];
    kapitel = json['kapitel'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['header'] = this.header;
    data['bookmarkchecked'] = this.bookmarkchecked;
    data['checkbox'] = this.checkbox;
    data['keywoerter'] = this.keywoerter;
    data['description'] = this.description;
    data['int_Kapitel'] = this.int_Kapitel;
    data['kapitel'] = this.kapitel;

    return data..removeWhere((_, value) => value == null);
  }
}
