class ExpertPackages {
  String? code;
  String? msg;
  String? type;
  PackagesData? data;

  ExpertPackages({this.code, this.msg, this.type, this.data});

  ExpertPackages.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    type = json['type'];
    data = json['data'] != null ? PackagesData.fromJson(json['data']) : null;
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

class PackagesData {
  List<MyPackagesData>? myPackagesData;

  PackagesData({this.myPackagesData});

  PackagesData.fromJson(Map<String, dynamic> json) {
    if (json['my_packages_data'] != null) {
      myPackagesData = <MyPackagesData>[];
      json['my_packages_data'].forEach((v) {
        myPackagesData!.add(MyPackagesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (myPackagesData != null) {
      data['my_packages_data'] =
          myPackagesData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MyPackagesData {
  String? packageID;
  String? doctorID;
  String? caseNo;
  String? patientName;
  String? packageTitle;
  String? noOfSession;
  String? packageDetails;
  String? sessionDuration;
  String? packagePrice;
  String? packageStatus;
  String? createdDate;
  dynamic approvedRejectDate;
  String? approvedRejectBy;

  MyPackagesData(
      {this.packageID,
      this.doctorID,
      this.caseNo,
      this.patientName,
      this.packageTitle,
      this.noOfSession,
      this.packageDetails,
      this.sessionDuration,
      this.packagePrice,
      this.packageStatus,
      this.createdDate,
      this.approvedRejectDate,
      this.approvedRejectBy});

  MyPackagesData.fromJson(Map<String, dynamic> json) {
    packageID = json['PackageID'];
    doctorID = json['DoctorID'];
    caseNo = json['CaseNo'];
    patientName = json['PatientName'];
    packageTitle = json['PackageTitle'];
    noOfSession = json['NoOfSession'];
    packageDetails = json['PackageDetails'];
    sessionDuration = json['SessionDuration'];
    packagePrice = json['PackagePrice'];
    packageStatus = json['PackageStatus'];
    createdDate = json['CreatedDate'];
    approvedRejectDate = json['Approved_RejectDate'];
    approvedRejectBy = json['Approved_RejectBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['PackageID'] = packageID;
    data['DoctorID'] = doctorID;
    data['CaseNo'] = caseNo;
    data['PatientName'] = patientName;
    data['PackageTitle'] = packageTitle;
    data['NoOfSession'] = noOfSession;
    data['PackageDetails'] = packageDetails;
    data['SessionDuration'] = sessionDuration;
    data['PackagePrice'] = packagePrice;
    data['PackageStatus'] = packageStatus;
    data['CreatedDate'] = createdDate;
    data['Approved_RejectDate'] = approvedRejectDate;
    data['Approved_RejectBy'] = approvedRejectBy;
    return data;
  }
}
