class TipValues {
  int content1;
  int content2;
  int content3;
  int content4;
  int content5;

  TipValues({this.content1, this.content2, this.content3, this.content4, this.content5});

  factory TipValues.fromJson(Map<String, dynamic> json) {
    return TipValues(
      content1: json['content1'],
      content2: json['content2'],
      content3: json['content3'],
      content4: json['content4'],
      content5: json['content5'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content1'] = this.content1;
    data['content2'] = this.content2;
    data['content3'] = this.content3;
    data['content4'] = this.content4;
    data['content5'] = this.content5;
    return data;
  }
}
