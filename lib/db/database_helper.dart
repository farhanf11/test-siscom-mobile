import 'package:mobile_test_siscom/models/models_barang.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _dbName = "Barang.db";
  static const table = "barang";
  static const columnId = 'id';
  static const columnNamaBarang = 'namaBarang';
  static const columnKategoriId = 'kategoriId';
  static const columnStok = 'stok';
  static const columnKelompokBarang = 'kelompokBarang';
  static const columnHarga = 'harga';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static late Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _dbName);
    return await openDatabase(path,
        version: _version, onCreate: _onCreate);
  }
  Future _onCreate(Database db, int version) async {
    await db.execute('''
  CREATE TABLE $table (
    $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
    $columnNamaBarang TEXT NOT NULL,
    $columnKategoriId INTEGER NOT NULL,
    $columnStok INTEGER NOT NULL,
    $columnKelompokBarang TEXT NOT NULL,
    $columnHarga INTEGER NOT NULL,
  )
  ''');
  }

  Future<int> insert(Barang barang) async {
    Database db = await instance.database;
    var res = await db.insert(table, barang.toMap());
    return res;
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    var res = await db.query(table, orderBy: "$columnId DESC");
    return res;
  }
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs:     [id]);
  }

  Future<List<Map<String, Object?>>> clearTable() async {
    Database db = await instance.database;
    return await db.rawQuery("DELETE FROM $table");
  }

}
