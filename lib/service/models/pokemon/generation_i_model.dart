class GenerationI {
  RedBlue? redBlue;
  RedBlue? yellow;

  GenerationI({this.redBlue, this.yellow});

  GenerationI.fromJson(Map<String, dynamic> json) {
    redBlue =
        json['red-blue'] != null ? RedBlue.fromJson(json['red-blue']) : null;
    yellow = json['yellow'] != null ? RedBlue.fromJson(json['yellow']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (redBlue != null) {
      data['red-blue'] = redBlue!.toJson();
    }
    if (yellow != null) {
      data['yellow'] = yellow!.toJson();
    }
    return data;
  }
}

class RedBlue {
  String? backDefault;
  String? backGray;
  String? backTransparent;
  String? frontDefault;
  String? frontGray;
  String? frontTransparent;

  RedBlue(
      {this.backDefault,
      this.backGray,
      this.backTransparent,
      this.frontDefault,
      this.frontGray,
      this.frontTransparent});

  RedBlue.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'];
    backGray = json['back_gray'];
    backTransparent = json['back_transparent'];
    frontDefault = json['front_default'];
    frontGray = json['front_gray'];
    frontTransparent = json['front_transparent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['back_default'] = backDefault;
    data['back_gray'] = backGray;
    data['back_transparent'] = backTransparent;
    data['front_default'] = frontDefault;
    data['front_gray'] = frontGray;
    data['front_transparent'] = frontTransparent;
    return data;
  }
}
