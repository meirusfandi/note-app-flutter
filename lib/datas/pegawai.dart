// ignore_for_file: non_constant_identifier_names

class Pegawai {
  late int? id;
  late String nama;
  late String alamat;
  late String email;
  late String phone;
  late String jabatan;
  late String penghasilan;

  Pegawai({
    this.id,
    required this.nama,
    required this.alamat,
    required this.email,
    required this.phone,
    required this.jabatan,
    required this.penghasilan
  });

  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'nama': nama,
      'alamat': alamat,
      'email': email,
      'phone': phone,
      'jabatan': jabatan,
      'penghasilan': penghasilan
    };
  }

  Pegawai.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nama = map['nama'];
    alamat = map['alamat'];
    email = map['email'];
    phone = map['phone'];
    jabatan = map['jabatan'];
    penghasilan = map['penghasilan'];
  }
}