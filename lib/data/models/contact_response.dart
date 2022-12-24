class ContactResponse {
  List<String>? errorString;
  List<String>? inputerror;
  String? message;
  int? status;
  List<ContactModel>? data;

  ContactResponse({
    this.errorString,
    this.inputerror,
    this.message,
    this.status,
    this.data,
  });

  ContactResponse.fromJson(Map<String, dynamic> json) {
    errorString = json['error_string'].cast<String>();
    inputerror = json['inputerror'].cast<String>();
    message = json['message'] as String?;
    status = json['status'] as int?;
    if (json['data'] != null) {
      data = <ContactModel>[];
      for (final v in json['data']) {
        data!.add(ContactModel.fromJson(v));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error_string'] = errorString;
    data['inputerror'] = inputerror;
    data['message'] = message;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ContactModel {
  String? idContact;
  String? namaContact;
  String? contact;
  String? logo;

  ContactModel({this.idContact, this.namaContact, this.contact, this.logo});

  ContactModel.fromJson(Map<String, dynamic> json) {
    idContact = json['id_contact'] as String?;
    namaContact = json['nama_contact'] as String?;
    contact = json['contact'] as String?;
    logo = json['logo'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_contact'] = idContact;
    data['nama_contact'] = namaContact;
    data['contact'] = contact;
    data['logo'] = logo;
    return data;
  }
}
