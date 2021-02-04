import 'package:doc_ueberall/model/kapitelInhalte.dart';

class Kapitels {
  List<Kapitel> kepitols;

  Kapitels({
    this.kepitols,
  });

  @override
  String toString() {
    return 'Kapitels{ kapitels: $kepitols }';
  }

  factory Kapitels.fromJson(Map<dynamic, dynamic> json) => new Kapitels(
        kepitols: json['kapitels']
            .map((jsn) => Kapitel.fromJson(jsn))
            .toList()
            .cast<Kapitel>(),
      );

  update(Kapitels kapitels) {
    for (var kapitel in this.kepitols) {
      var kapitelLocal =
          kapitels.kepitols.where((element) => element.id == kapitel.id)?.first;
      kapitel.isSeen = kapitelLocal.isSeen;
      kapitel.isBookmarked = kapitelLocal.isBookmarked;
    }
//    var kepitols = kapitels;
//    this.kepitols = kapitels.kepitols
//        .map((kapital) => this
//            .kepitols
//            .firstWhere((element) => element.id == kapital.id)
//            ?.update(kapital))
//        ?.toList()
//        ?.cast<Kapitel>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kapitels'] = kepitols?.map((kapitel) => kapitel.toJson())?.toList();
    return data..removeWhere((_, value) => value == null);
  }
}

class Kapitel {
  String id;
  String kapitel;
  String prio;
  String header;
  String description;
  bool isSeen;
  bool isBookmarked;
  List<KapitelzInhalte> kapitelInhaltes;

  Kapitel(
      {this.id,
      this.kapitel,
      this.prio,
      this.header,
      this.description,
      this.isSeen,
      this.isBookmarked,
      this.kapitelInhaltes});

  @override
  String toString() {
    return "Kepitol{ id: $id, kapitel: $kapitel, int_Kapitel: $prio, header: $header, "
        "description: $description,  checkbox: $isSeen  }";
  }

  factory Kapitel.fromJson(Map<dynamic, dynamic> json) {
    return Kapitel(
      id: json['id'],
      kapitel: json['kapitel'],
      prio: json['prio'] ?? "",
      header: json['header'],
      description: json['description'] ?? "",
      isSeen: json['is_seen'],
      isBookmarked: json['is_bookmarked'],
      kapitelInhaltes: json['kapitel_inhaltes']
          .map((jsn) => KapitelzInhalte.fromJson(jsn))
          .toList()
          .cast<KapitelzInhalte>(),
    );
  }

  update(Kapitel kapitel) {
    return Kapitel(
        kapitel: kapitel.kapitel,
        prio: kapitel.prio,
        header: kapitel.header,
        description: kapitel.description,
        kapitelInhaltes: kapitel.kapitelInhaltes,
        isSeen: this.isSeen ?? false,
        isBookmarked: this.isBookmarked ?? false);
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
    data['is_seen'] = this.isSeen;
    data['is_bookmarked'] = this.isBookmarked;
    return data..removeWhere((_, value) => value == null);
  }
}
