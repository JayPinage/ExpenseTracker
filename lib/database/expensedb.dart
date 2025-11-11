import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Dbhelper {
  static Database? _db;

 static Future<Database> instance() async {
    if (_db != null) return _db!;

    final dbpath = await getDatabasesPath();
    final path = join(dbpath, "expensedb.db");

    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
create table expense(

id integer primary key autoincrement,
title text,
amount real,
category text,
date text

)

 

''');
      },
    );

    return _db!;
  }
}
