class DrKeyword {
  String? code;
  String? msg;
  String? type;
  KeywordsList? data;

  DrKeyword({this.code, this.msg, this.type, this.data});

  DrKeyword.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    type = json['type'];
    data = json['data'] != null ? KeywordsList.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    data['type'] = type;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class KeywordsList {
  List<RandDoctors>? randDoctors;

  KeywordsList({this.randDoctors});

  KeywordsList.fromJson(Map<String, dynamic> json) {
    if (json['RandDoctors'] != null) {
      randDoctors = <RandDoctors>[];
      json['RandDoctors'].forEach((v) {
        randDoctors!.add(RandDoctors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (randDoctors != null) {
      data['RandDoctors'] = randDoctors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RandDoctors {
  String? doctorName;

  RandDoctors({this.doctorName});

  RandDoctors.fromJson(Map<String, dynamic> json) {
    doctorName = json['doctor_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['doctor_name'] = doctorName;
    return data;
  }
}
