class StateList {
  String? status;
  String? messages;
  List<StateData>? data;

  StateList({this.status, this.messages, this.data});

  StateList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    messages = json['messages'];
    if (json['data'] != null) {
      data = <StateData>[];
      json['data'].forEach((v) {
        data!.add(StateData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['messages'] = messages;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StateData {
  String? stateId;
  String? stateName;
  String? countryId;
  String? note;
  String? dateCreated;
  String? dateModified;
  String? ipAddress;

  StateData(
      {this.stateId,
      this.stateName,
      this.countryId,
      this.note,
      this.dateCreated,
      this.dateModified,
      this.ipAddress});

  StateData.fromJson(Map<String, dynamic> json) {
    stateId = json['state_id'];
    stateName = json['state_name'];
    countryId = json['country_id'];
    note = json['note'];
    dateCreated = json['date_created'];
    dateModified = json['date_modified'];
    ipAddress = json['ip_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['state_id'] = stateId;
    data['state_name'] = stateName;
    data['country_id'] = countryId;
    data['note'] = note;
    data['date_created'] = dateCreated;
    data['date_modified'] = dateModified;
    data['ip_address'] = ipAddress;
    return data;
  }
}
