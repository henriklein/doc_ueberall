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

  KapitelInhalte({
    this.id,
  });

  @override
  String toString() {
    return "kapitelInhaltes{ id: $id }";
  }

  KapitelInhalte.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data..removeWhere((_, value) => value == null);
  }
}
