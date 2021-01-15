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

  DetailScreen({
    this.id,
  });

  @override
  String toString() {
    return "detailScreen{ id: $id }";
  }

  DetailScreen.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data..removeWhere((_, value) => value == null);
  }
}
