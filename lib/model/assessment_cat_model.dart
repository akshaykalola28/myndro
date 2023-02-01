class AssessmentCatModel {
  String? code;
  String? msg;
  String? type;
  List<AssessmentCat>? data;

  AssessmentCatModel({this.code, this.msg, this.type, this.data});

  AssessmentCatModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    type = json['type'];
    if (json['data'] != null) {
      data = <AssessmentCat>[];
      json['data'].forEach((v) {
        data!.add(AssessmentCat.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    data['type'] = type;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AssessmentCat {
  String? questionId;
  String? questionName;
  String? questionShortName;
  String? bgImage;
  String? dateCreated;
  String? dateModified;

  AssessmentCat(
      {this.questionId,
      this.questionName,
      this.questionShortName,
      this.bgImage,
      this.dateCreated,
      this.dateModified});

  AssessmentCat.fromJson(Map<String, dynamic> json) {
    questionId = json['question_id'];
    questionName = json['question_name'];
    questionShortName = json['question_short_name'];
    bgImage = json['bg_image'];
    dateCreated = json['date_created'];
    dateModified = json['date_modified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question_id'] = questionId;
    data['question_name'] = questionName;
    data['question_short_name'] = questionShortName;
    data['bg_image'] = bgImage;
    data['date_created'] = dateCreated;
    data['date_modified'] = dateModified;
    return data;
  }
}
