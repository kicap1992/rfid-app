class PenyewaModel {
  String? nik;
  String? nama;
  String? rfid;
  int? saldo;
  int? idTempatSerwa;
  String? namaTempatSewa;
  int? hargaSewa;
  String? date;
  String? jenis;
  String? ket;

  PenyewaModel(
      {this.nik,
      this.nama,
      this.rfid,
      this.saldo,
      this.idTempatSerwa,
      this.namaTempatSewa,
      this.hargaSewa,
      this.date,
      this.jenis,
      this.ket});

  PenyewaModel.fromJson(Map<String, dynamic> json) {
    nik = json['nik'];
    nama = json['nama'];
    rfid = json['rfid'];
    saldo = json['saldo'];
    idTempatSerwa = json['id_tempat_serwa'];
    namaTempatSewa = json['nama_tempat_sewa'];
    hargaSewa = json['harga_sewa'];
    date = json['date'];
    jenis = json['jenis'];
    ket = json['ket'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nik'] = nik;
    data['nama'] = nama;
    data['rfid'] = rfid;
    data['saldo'] = saldo;
    data['id_tempat_serwa'] = idTempatSerwa;
    data['nama_tempat_sewa'] = namaTempatSewa;
    data['harga_sewa'] = hargaSewa;
    data['date'] = date;
    data['jenis'] = jenis;
    data['ket'] = ket;
    return data;
  }
}

class DetailPenyewaModel {
  String? nik;
  String? nama;
  String? rfid;
  int? saldo;

  DetailPenyewaModel({this.nik, this.nama, this.rfid, this.saldo});

  DetailPenyewaModel.fromJson(Map<String, dynamic> json) {
    nik = json['nik'];
    nama = json['nama'];
    rfid = json['rfid'];
    saldo = json['saldo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nik'] = nik;
    data['nama'] = nama;
    data['rfid'] = rfid;
    data['saldo'] = saldo;
    return data;
  }
}
