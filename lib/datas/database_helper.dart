import 'package:notes_app_flutter/datas/pegawai.dart';
import 'package:notes_app_flutter/datas/response.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {

  static late Database _database;
  static DatabaseHelper? _databaseHelper;

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initializeDB();
    return _database;
  }

  static final String _tableName = "pegawai";

  Future<Database> _initializeDB() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      join(path, "pegawai_db.db"),
      onCreate: (db, version) async {
        await db.execute(
          '''
            CREATE TABLE $_tableName(
              id INTEGER PRIMARY KEY,
              nama TEXT, jabatan TEXT, alamat TEXT,
              email TEXT, phone TEXT, penghasilan TEXT
            )
          ''',
        );
      },
      version: 1
    );

    return db;
  }

  Future<Response> insertData(Pegawai pegawai) async {
    final Database db = await database;
    await db.insert(_tableName, pegawai.toMap());

    final response = Response(status: true, message: "Data Berhasil Disimpan");
    return response;
  }

  Future<List<Pegawai>> getAllData() async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(_tableName);
    return results.map((res) => Pegawai.fromMap(res)).toList();
  }

  Future<Pegawai> getDetailData(int id) async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id]
    );

    return results.map((res) => Pegawai.fromMap(res)).first;
  }

  Future<Response> updateData(Pegawai pegawai) async{
    final db = await database;

    await db.update(
      _tableName, 
      pegawai.toMap(),
      where: 'id = ?',
      whereArgs: [pegawai.id]
    );
    return Response(status: true, message: "Data berhasil diubah!");
  }

  Future<Response> deleteData(int id) async {
    final db = await database;

    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id]
    );

    return Response(status: true, message: "Data berhasil dihapus!");
  }
  
}