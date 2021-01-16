class Kepitels {
  final List<Kepitol> kepitols;

  Kepitels({
    this.kepitols,
  });

  @override
  String toString() {
    return 'Kepitols{ kepitols: $kepitols }';
  }

  factory Kepitels.fromJson(Map<dynamic, dynamic> json) => new Kepitels(
        kepitols: json['kapitels']
            .map((jsn) => Kepitol.fromJson(jsn))
            .toList()
            .cast<Kepitol>(),
      );
  Map<String, dynamic> toJson() => {"kepitels": kepitols};
}

class Kepitol {
  String id;
  String kapitel;
  String int_Kapitel;
  String header;
  String description;
  String keywoerter;
  String bookmarkchecked;
  bool checkbox;

  Kepitol({
    this.id,
    this.kapitel,
    this.int_Kapitel,
    this.header,
    this.description,
    this.keywoerter,
    this.bookmarkchecked,
    this.checkbox,
  });

  @override
  String toString() {
    return "Kepitol{ id: $id, kapitel: $kapitel, int_Kapitel: $int_Kapitel, header: $header, "
        "description: $description, keywoerter: $keywoerter, bookmarkchecked: $bookmarkchecked, checkbox: $checkbox  }";
  }

  factory Kepitol.fromJson(Map<dynamic, dynamic> json) => new Kepitol(
        id: json['id'],
        kapitel: json['kapitel'],
        int_Kapitel: json['int_Kapitel'],
        header: json['header'],
        description: json['description'],
        keywoerter: json['keywoerter'],
        bookmarkchecked: json['bookmarkchecked'],
        checkbox: json['checkbox'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['kapitel'] = this.kapitel;
    data['int_Kapitel'] = this.int_Kapitel;
    data['header'] = this.header;
    data['description'] = this.description;
    data['keywoerter'] = this.keywoerter;
    data['bookmarkchecked'] = this.bookmarkchecked;
    data['checkbox'] = this.checkbox;

    return data..removeWhere((_, value) => value == null);
  }
}
