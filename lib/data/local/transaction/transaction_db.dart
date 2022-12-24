import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/transaction_models.dart';

class TransactionDatabase {
  static final TransactionDatabase instance = TransactionDatabase._init();

  static Database? _database;
  static String tableName = "transaction";

  TransactionDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('$tableName.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT  NULL';
    final doubleType = 'DOUBLE  NULL';

    await db.execute('''
      CREATE TABLE $tableName ( 
        ${TransactionModelFields.id} $idType, 
        ${TransactionModelFields.openTime} $textType,
        ${TransactionModelFields.closeTime} $textType,
        ${TransactionModelFields.type} $textType,
        ${TransactionModelFields.size} $doubleType,
        ${TransactionModelFields.symbol} $textType,
        ${TransactionModelFields.priceOpen} $doubleType,
        ${TransactionModelFields.stopLoss} $doubleType,
        ${TransactionModelFields.takeProfit} $doubleType,
        ${TransactionModelFields.priceClose} $doubleType,
        ${TransactionModelFields.commision} $doubleType,
        ${TransactionModelFields.profit} $doubleType,
        ${TransactionModelFields.comment} $textType,
        )
      ''');
  }

  Future<TransactionModel> create(TransactionModel note) async {
    final db = await instance.database;

    // final json = note.toJson();
    // final columns =
    //     '${TransactionModelFields.title}, ${TransactionModelFields.description}, ${TransactionModelFields.time}';
    // final values =
    //     '${json[TransactionModelFields.title]}, ${json[TransactionModelFields.description]}, ${json[TransactionModelFields.time]}';
    // final id = await db
    //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id = await db.insert(tableName, note.toJson());
    return note.copy(id: id);
  }

  Future<TransactionModel> readTransactionModel(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableName,
      columns: TransactionModelFields.values,
      where: '${TransactionModelFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return TransactionModel.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<TransactionModel>> readAllTransactionModels() async {
    final db = await instance.database;

    final orderBy = '${TransactionModelFields.openTime} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableTransactionModels ORDER BY $orderBy');

    final result = await db.query(tableName, orderBy: orderBy);

    return result.map((json) => TransactionModel.fromJson(json)).toList();
  }

  Future<int> update(TransactionModel note) async {
    final db = await instance.database;

    return db.update(
      tableName,
      note.toJson(),
      where: '${TransactionModelFields.id} = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableName,
      where: '${TransactionModelFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
