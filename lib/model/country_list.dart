class CountryList {
  String? status;
  List<CountryData>? data;

  CountryList({this.status, this.data});

  CountryList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <CountryData>[];
      json['data'].forEach((v) {
        data!.add(CountryData.fromJson(v));
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

class CountryData {
  String? countryId;
  String? countryName;
  String? note;
  String? dateCreated;
  String? dateModified;
  String? ipAddress;
  String? countryCode;

  CountryData(
      {this.countryId,
      this.countryName,
      this.note,
      this.dateCreated,
      this.dateModified,
      this.ipAddress,
      this.countryCode});

  CountryData.fromJson(Map<String, dynamic> json) {
    countryId = json['country_id'];
    countryName = json['country_name'];
    note = json['note'];
    dateCreated = json['date_created'];
    dateModified = json['date_modified'];
    ipAddress = json['ip_address'];
    countryCode = json['country_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country_id'] = countryId;
    data['country_name'] = countryName;
    data['note'] = note;
    data['date_created'] = dateCreated;
    data['date_modified'] = dateModified;
    data['ip_address'] = ipAddress;
    data['country_code'] = countryCode;
    return data;
  }
}
