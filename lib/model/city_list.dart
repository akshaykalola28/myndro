class CityList {
  String? status;
  List<CityData>? data;

  CityList({this.status, this.data});

  CityList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <CityData>[];
      json['data'].forEach((v) {
        data!.add( CityData.fromJson(v));
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

class CityData {
  String? cityId;
  String? cityName;
  String? countryId;
  String? stateId;
  String? note;
  String? dateCreated;
  String? dateModified;
  String? ipAddress;

  CityData(
      {this.cityId,
        this.cityName,
        this.countryId,
        this.stateId,
        this.note,
        this.dateCreated,
        this.dateModified,
        this.ipAddress});

  CityData.fromJson(Map<String, dynamic> json) {
    cityId = json['city_id'];
    cityName = json['city_name'];
    countryId = json['country_id'];
    stateId = json['state_id'];
    note = json['note'];
    dateCreated = json['date_created'];
    dateModified = json['date_modified'];
    ipAddress = json['ip_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city_id'] = cityId;
    data['city_name'] = cityName;
    data['country_id'] = countryId;
    data['state_id'] = stateId;
    data['note'] = note;
    data['date_created'] = dateCreated;
    data['date_modified'] = dateModified;
    data['ip_address'] = ipAddress;
    return data;
  }
}
