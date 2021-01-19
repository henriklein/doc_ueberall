import 'package:doc_ueberall/model/kapitelInhalte.dart';

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
  Map<String, dynamic> toJson() =>
      {"kepitels": kepitols?.map((kapitel) => kapitel.toJson())?.toList()};
}

class Kepitol {
  String id;
  String kapitel;
  String prio;
  String header;
  String description;
  String bookmarkchecked;
  bool checkbox;
  List<KapitelzInhalte> kapitelInhaltes;

  Kepitol(
      {this.id,
      this.kapitel,
      this.prio,
      this.header,
      this.description,
      this.bookmarkchecked,
      this.checkbox,
      this.kapitelInhaltes});

  @override
  String toString() {
    return "Kepitol{ id: $id, kapitel: $kapitel, int_Kapitel: $prio, header: $header, "
        "description: $description, bookmarkchecked: $bookmarkchecked, checkbox: $checkbox  }";
  }

  factory Kepitol.fromJson(Map<dynamic, dynamic> json) {
    return Kepitol(
      id: json['id'],
      kapitel: json['kapitel'],
      prio: json['prio'] ?? "",
      header: json['header'],
      description: json['description'] ?? "",
      kapitelInhaltes: json['kapitel_inhaltes']
          .map((jsn) => KapitelzInhalte.fromJson(jsn))
          .toList()
          .cast<KapitelzInhalte>(),
      bookmarkchecked: json['bookmarkchecked'],
      checkbox: json['checkbox'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['kapitel'] = this.kapitel;
    data['prio'] = this.prio;
    data['header'] = this.header;
    data['description'] = this.description;
    data['kapitel_inhaltes'] =
        this.kapitelInhaltes.map((inhalte) => inhalte.toJson())?.toList();
    data['bookmarkchecked'] = this.bookmarkchecked;
    data['checkbox'] = this.checkbox;
    return data..removeWhere((_, value) => value == null);
  }
}
