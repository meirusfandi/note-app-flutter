import 'package:flutter/foundation.dart';
import 'package:notes_app_flutter/datas/database_helper.dart';
import 'package:notes_app_flutter/datas/pegawai.dart';

class DBProvider extends ChangeNotifier {
  
  List<Pegawai> _pegawai = [];
  late DatabaseHelper _dbhelper;

  List<Pegawai> get pegawai => _pegawai;

  DBProvider() {
    _dbhelper = DatabaseHelper();
    _getAllData();
  }

  void _getAllData() async {
    _pegawai = await _dbhelper.getAllData();
    notifyListeners();
  }

  Future<void> insertPegawai(Pegawai pegawai) async {
    await _dbhelper.insertData(pegawai);
    _getAllData();
  }

  Future<List<Pegawai>> getAll() async {
    return await _dbhelper.getAllData();
  }

  Future<Pegawai> getDetail(int id) async {
    return await _dbhelper.getDetailData(id);
  }

  void updateData(Pegawai pegawai) async {
    await _dbhelper.updateData(pegawai);
    _getAllData();
  }

  void deleteData(int id) async {
    await _dbhelper.deleteData(id);
    _getAllData();
  }

}