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
        kepitols: json['kepitols']
            ?.values
            ?.map((jsn) => Kepitol.fromJson(jsn))
            ?.toList()
            ?.cast<Kepitol>(),
      );

  Map<String, dynamic> toJson() => {"kepitols": kepitols};
}

class Kepitol {
  String id;

  Kepitol({
    this.id,
  });

  @override
  String toString() {
    return "Kepitol{ id: $id }";
  }

  Kepitol.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data..removeWhere((_, value) => value == null);
  }
}
