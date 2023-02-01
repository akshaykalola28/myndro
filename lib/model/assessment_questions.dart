class AssessmentQuestions {
  String? code;
  String? msg;
  String? type;
  List<AssessmentQuesList>? data;

  AssessmentQuestions({this.code, this.msg, this.type, this.data});

  AssessmentQuestions.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    type = json['type'];
    if (json['data'] != null) {
      data = <AssessmentQuesList>[];
      json['data'].forEach((v) {
        data!.add(AssessmentQuesList.fromJson(v));
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

class AssessmentQuesList {
  String? assementQuestionsId;
  String? assementQuestions;
  String? categoryId;
  String? questionCategory;
  String? dateCreated;
  String? dateModified;

  AssessmentQuesList(
      {this.assementQuestionsId,
      this.assementQuestions,
      this.categoryId,
      this.questionCategory,
      this.dateCreated,
      this.dateModified});

  AssessmentQuesList.fromJson(Map<String, dynamic> json) {
    assementQuestionsId = json['assement_questions_id'];
    assementQuestions = json['assement_questions'];
    categoryId = json['category_id'];
    questionCategory = json['question_category'];
    dateCreated = json['date_created'];
    dateModified = json['date_modified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['assement_questions_id'] = assementQuestionsId;
    data['assement_questions'] = assementQuestions;
    data['category_id'] = categoryId;
    data['question_category'] = questionCategory;
    data['date_created'] = dateCreated;
    data['date_modified'] = dateModified;
    return data;
  }
}
