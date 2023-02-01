class PackagesListModel {
  String? code;
  String? msg;
  String? type;
  List<PackagesList>? data;

  PackagesListModel({this.code, this.msg, this.type, this.data});

  PackagesListModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    type = json['type'];
    if (json['data'] != null) {
      data = <PackagesList>[];
      json['data'].forEach((v) {
        data!.add(PackagesList.fromJson(v));
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

class PackagesList {
  String? packageId;
  String? packageName;
  String? packageDesc;
  String? packageType;
  dynamic packageDiscount;
  String? packageImage;
  String? packagePrice;
  String? packageNoSession;
  String? dateCreated;
  String? dateModified;
  String? voucherId;

  PackagesList(
      {this.packageId,
      this.packageName,
      this.packageDesc,
      this.packageType,
      this.packageDiscount,
      this.packageImage,
      this.packagePrice,
      this.packageNoSession,
      this.dateCreated,
      this.dateModified,
      this.voucherId});

  PackagesList.fromJson(Map<String, dynamic> json) {
    packageId = json['package_id'];
    packageName = json['package_name'];
    packageDesc = json['package_desc'];
    packageType = json['package_type'];
    packageDiscount = json['package_discount'];
    packageImage = json['package_image'];
    packagePrice = json['package_price'];
    packageNoSession = json['package_no_session'];
    dateCreated = json['date_created'];
    dateModified = json['date_modified'];
    voucherId = json['voucher_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['package_id'] = packageId;
    data['package_name'] = packageName;
    data['package_desc'] = packageDesc;
    data['package_type'] = packageType;
    data['package_discount'] = packageDiscount;
    data['package_image'] = packageImage;
    data['package_price'] = packagePrice;
    data['package_no_session'] = packageNoSession;
    data['date_created'] = dateCreated;
    data['date_modified'] = dateModified;
    data['voucher_id'] = voucherId;
    return data;
  }
}
