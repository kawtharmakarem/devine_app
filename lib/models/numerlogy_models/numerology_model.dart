class Numerology {
  List<Dob>? dob;

  Numerology({this.dob});

  Numerology.fromJson(Map<String, dynamic> json) {
    if (json['dob'] != null) {
      dob = <Dob>[];
      json['dob'].forEach((v) {
        dob!.add(new Dob.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dob != null) {
      data['dob'] = this.dob!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dob {
  int? id;
  String? heading1;
  String? heading2;
  String? heading3;
  String? heading4;
  String? heading5;
  String? heading6;
  String? heading7;
  String? luckyNumber;
  String? luckyColor;
  String? luckyDays;
  String? luckyGems;
  String? para1;
  String? para2;
  String? para3;
  String? para4;
  String? para5;
  String? para6;
  String? para7;

  Dob(
      {this.id,
      this.heading1,
      this.heading2,
      this.heading3,
      this.heading4,
      this.heading5,
      this.heading6,
      this.heading7,
      this.luckyNumber,
      this.luckyColor,
      this.luckyDays,
      this.luckyGems,
      this.para1,
      this.para2,
      this.para3,
      this.para4,
      this.para5,
      this.para6,
      this.para7});

  Dob.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    heading1 = json['heading1'];
    heading2 = json['heading2'];
    heading3 = json['heading3'];
    heading4 = json['heading4'];
    heading5 = json['heading5'];
    heading6 = json['heading6'];
    heading7 = json['heading7'];
    luckyNumber = json['LuckyNumber'];
    luckyColor = json['LuckyColor'];
    luckyDays = json['LuckyDays'];
    luckyGems = json['LuckyGems'];
    para1 = json['para1'];
    para2 = json['para2'];
    para3 = json['para3'];
    para4 = json['para4'];
    para5 = json['para5'];
    para6 = json['para6'];
    para7 = json['para7'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['heading1'] = this.heading1;
    data['heading2'] = this.heading2;
    data['heading3'] = this.heading3;
    data['heading4'] = this.heading4;
    data['heading5'] = this.heading5;
    data['heading6'] = this.heading6;
    data['heading7'] = this.heading7;
    data['LuckyNumber'] = this.luckyNumber;
    data['LuckyColor'] = this.luckyColor;
    data['LuckyDays'] = this.luckyDays;
    data['LuckyGems'] = this.luckyGems;
    data['para1'] = this.para1;
    data['para2'] = this.para2;
    data['para3'] = this.para3;
    data['para4'] = this.para4;
    data['para5'] = this.para5;
    data['para6'] = this.para6;
    data['para7'] = this.para7;
    return data;
  }
}