class CollectionOverviewModel {
  int? series;
  int? oVA;
  int? movie;
  int? special;
  int? web;
  int? other;
  int? none;

  CollectionOverviewModel(
      {this.series,
      this.oVA,
      this.movie,
      this.special,
      this.web,
      this.other,
      this.none});

  CollectionOverviewModel.fromJson(Map<String, dynamic> json) {
    series = json['Series'];
    oVA = json['OVA'];
    movie = json['Movie'];
    special = json['Special'];
    web = json['Web'];
    other = json['Other'];
    none = json['None'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Series'] = series;
    data['OVA'] = oVA;
    data['Movie'] = movie;
    data['Special'] = special;
    data['Web'] = web;
    data['Other'] = other;
    data['None'] = none;
    return data;
  }
}
