class LoginResponse {
  User? user;
  List<String>? errorString;
  List<String>? inputerror;
  int? status;
  String? token;
  String? message;

  LoginResponse(
      {this.user,
      this.errorString,
      this.inputerror,
      this.status,
      this.token,
      this.message});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    errorString = json['error_string'].cast<String>();
    inputerror = json['inputerror'].cast<String>();
    status = json['status'];
    token = json['token'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['error_string'] = this.errorString;
    data['inputerror'] = this.inputerror;
    data['status'] = this.status;
    data['token'] = this.token;
    data['message'] = this.message;
    return data;
  }
}

class User {
  String? idMember;
  String? usernameMember;
  String? password;
  String? email;
  String? noHp;
  String? namaBank;
  String? namaRekening;
  String? nomorRekening;
  String? saldoMember;
  String? idRefferal;
  String? registerDate;
  String? statusMember;
  String? token;
  String? lastlogin;
  String? ipAddr;
  String? deletedAt;
  String? group;

  User(
      {this.idMember,
      this.usernameMember,
      this.password,
      this.email,
      this.noHp,
      this.namaBank,
      this.namaRekening,
      this.nomorRekening,
      this.saldoMember,
      this.idRefferal,
      this.registerDate,
      this.statusMember,
      this.token,
      this.lastlogin,
      this.ipAddr,
      this.deletedAt,
      this.group});

  User.fromJson(Map<String, dynamic> json) {
    idMember = json['id_member'];
    usernameMember = json['username_member'];
    password = json['password'];
    email = json['email'];
    noHp = json['no_hp'];
    namaBank = json['nama_bank'];
    namaRekening = json['nama_rekening'];
    nomorRekening = json['nomor_rekening'];
    saldoMember = json['saldo_member'];
    idRefferal = json['id_refferal'];
    registerDate = json['register_date'];
    statusMember = json['status_member'];
    token = json['token'];
    lastlogin = json['lastlogin'];
    ipAddr = json['ip_addr'];
    deletedAt = json['deleted_at'];
    group = json['group'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_member'] = this.idMember;
    data['username_member'] = this.usernameMember;
    data['password'] = this.password;
    data['email'] = this.email;
    data['no_hp'] = this.noHp;
    data['nama_bank'] = this.namaBank;
    data['nama_rekening'] = this.namaRekening;
    data['nomor_rekening'] = this.nomorRekening;
    data['saldo_member'] = this.saldoMember;
    data['id_refferal'] = this.idRefferal;
    data['register_date'] = this.registerDate;
    data['status_member'] = this.statusMember;
    data['token'] = this.token;
    data['lastlogin'] = this.lastlogin;
    data['ip_addr'] = this.ipAddr;
    data['deleted_at'] = this.deletedAt;
    data['group'] = this.group;
    return data;
  }
}
