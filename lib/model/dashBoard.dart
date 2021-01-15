class DashBoard {
  final List<DashBoards> dashBoards;

  DashBoard({
    this.dashBoards,
  });

  @override
  String toString() {
    return 'dashBoards{ dashBoards: $dashBoards }';
  }

  factory DashBoard.fromJson(Map<dynamic, dynamic> json) => new DashBoard(
        dashBoards: json['dashBoards']
            ?.values
            ?.map((jsn) => DashBoards.fromJson(jsn))
            ?.toList()
            ?.cast<DashBoards>(),
      );

  Map<String, dynamic> toJson() => {"dashBoards": dashBoards};
}

class DashBoards {
  String id;

  DashBoards({
    this.id,
  });

  @override
  String toString() {
    return "dashBoards{ id: $id }";
  }

  DashBoards.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data..removeWhere((_, value) => value == null);
  }
}
