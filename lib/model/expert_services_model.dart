class ExpertServicesModel {
  String? status;
  List<ServicesModel>? data;

  ExpertServicesModel({this.status, this.data});

  ExpertServicesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <ServicesModel>[];
      json['data'].forEach((v) {
        data!.add(ServicesModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ServicesModel {
  String? id;
  String? name;
  String? createdDate;
  String? createdBy;
  String? dateModified;

  ServicesModel(
      {this.id,
      this.name,
      this.createdDate,
      this.createdBy,
      this.dateModified});

  ServicesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdDate = json['created_date'];
    createdBy = json['created_by'];
    dateModified = json['date_modified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_date'] = createdDate;
    data['created_by'] = createdBy;
    data['date_modified'] = dateModified;
    return data;
  }
}
