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
  Map<String, dynamic> toJson() => {"kepitels": kepitols};
}

class Kepitol {
  String id;
  String kapitel;
  String prio;
  String header;
  String description;
  String bookmarkchecked;
  bool checkbox;
  List<KapitelInhalte> kapitelInhaltes;

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
      prio: json['prio'],
      header: json['header'],
      description: json['description'] ?? "",
      kapitelInhaltes: json['kapitel_inhaltes']
          .map((jsn) => KapitelInhalte.fromJson(jsn))
          .toList()
          .cast<KapitelInhalte>(),
      bookmarkchecked: json['bookmarkchecked'],
      checkbox: json['checkbox'],
    );
  }
}
