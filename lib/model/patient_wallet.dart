class PatientWallet {
  String? code;
  String? msg;
  Slots? slots;

  PatientWallet({this.code, this.msg, this.slots});

  PatientWallet.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    slots = json['Slots'] != null ? Slots.fromJson(json['Slots']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    if (slots != null) {
      data['Slots'] = slots!.toJson();
    }
    return data;
  }
}

class Slots {
  List<Wallet>? wallet;
  String? name;
  String? totalWalletAmount;

  Slots({this.wallet, this.name, this.totalWalletAmount});

  Slots.fromJson(Map<String, dynamic> json) {
    if (json['wallet'] != null) {
      wallet = <Wallet>[];
      json['wallet'].forEach((v) {
        wallet!.add(Wallet.fromJson(v));
      });
    }
    name = json['name'];
    totalWalletAmount = json['total_wallet_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (wallet != null) {
      data['wallet'] = wallet!.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    data['total_wallet_amount'] = totalWalletAmount;
    return data;
  }
}

class Wallet {
  String? walletId;
  String? patientId;
  String? walletType;
  String? walletAmount;
  String? dateCreated;
  String? status;
  dynamic cardId;
  String? stripeChargeResponseId;
  String? stripeAmountAmountCaptured;
  String? walletCurrency;
  String? dateModified;
  String? paymentCaptureJson;

  Wallet(
      {this.walletId,
      this.patientId,
      this.walletType,
      this.walletAmount,
      this.dateCreated,
      this.status,
      this.cardId,
      this.stripeChargeResponseId,
      this.stripeAmountAmountCaptured,
      this.walletCurrency,
      this.dateModified,
      this.paymentCaptureJson});

  Wallet.fromJson(Map<String, dynamic> json) {
    walletId = json['wallet_id'];
    patientId = json['patient_id'];
    walletType = json['wallet_type'];
    walletAmount = json['wallet_amount'];
    dateCreated = json['date_created'];
    status = json['status'];
    cardId = json['card_id'];
    stripeChargeResponseId = json['stripe_charge_response_id'];
    stripeAmountAmountCaptured = json['stripe_amount_amount_captured'];
    walletCurrency = json['wallet_currency'];
    dateModified = json['date_modified'];
    paymentCaptureJson = json['payment_capture_json'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['wallet_id'] = walletId;
    data['patient_id'] = patientId;
    data['wallet_type'] = walletType;
    data['wallet_amount'] = walletAmount;
    data['date_created'] = dateCreated;
    data['status'] = status;
    data['card_id'] = cardId;
    data['stripe_charge_response_id'] = stripeChargeResponseId;
    data['stripe_amount_amount_captured'] = stripeAmountAmountCaptured;
    data['wallet_currency'] = walletCurrency;
    data['date_modified'] = dateModified;
    data['payment_capture_json'] = paymentCaptureJson;
    return data;
  }
}
