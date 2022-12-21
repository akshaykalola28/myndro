class DoctorSlot {
  String? code;
  String? url;
  String? msg;
  List<DrSlots>? slots;

  DoctorSlot({this.code, this.url, this.msg, this.slots});

  DoctorSlot.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    url = json['url'];
    msg = json['msg'];
    if (json['Slots'] != null) {
      slots = <DrSlots>[];
      json['Slots'].forEach((v) {
        slots!.add(DrSlots.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['url'] = url;
    data['msg'] = msg;
    if (slots != null) {
      data['Slots'] = slots!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DrSlots {
  String? doctorSlotId;
  String? doctorsCalenderId;
  String? slots;
  String? createdDate;

  DrSlots(
      {this.doctorSlotId,
      this.doctorsCalenderId,
      this.slots,
      this.createdDate});

  DrSlots.fromJson(Map<String, dynamic> json) {
    doctorSlotId = json['doctor_slot_id'];
    doctorsCalenderId = json['doctors_calender_id'];
    slots = json['slots'];
    createdDate = json['created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['doctor_slot_id'] = doctorSlotId;
    data['doctors_calender_id'] = doctorsCalenderId;
    data['slots'] = slots;
    data['created_date'] = createdDate;
    return data;
  }
}
