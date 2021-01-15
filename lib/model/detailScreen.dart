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
