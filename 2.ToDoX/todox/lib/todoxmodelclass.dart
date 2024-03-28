import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

List data = [];

class WorkPlanModelClass {
  int? id;
  String title;
  String description;
  String date;

  WorkPlanModelClass(
      {this.id,
      required this.title,
      required this.description,
      required this.date});

  Map<String, dynamic> toDoXMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date,
    };
  }
}

dynamic database;

Future<void> createDatabase() async {
  database = await openDatabase(
      join(await getDatabasesPath(), "ToDoXDatabase.db"),
      version: 1, onCreate: (db, version) async {
    await db.execute('''
          CREATE TABLE ToDoXTable(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            description TEXT,
            date TEXT
          )
        ''');
  });
}

Future<void> insertData(WorkPlanModelClass obj) async {
  final localDB = await database;

  await localDB.insert(
    "ToDoXTable",
    obj.toDoXMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );

  //get daata
  data = await getData();
}

Future<void> deleteData(WorkPlanModelClass obj) async {
  final localDb = await database;

  await localDb.delete("ToDoXTable", where: "id=?", whereArgs: [obj.id]);

  data = await getData();
}

Future<void> updateData(WorkPlanModelClass obj) async {
  final localDb = await database;

  await localDb.update(
    "ToDoXTable",
    obj.toDoXMap(),
    where: "id=?",
    whereArgs: [obj.id],
  );

  data = await getData();
}

Future<List> getData() async {
  final localDb = database;

  List demoMap = await localDb.query("ToDoXTable");

  return List.generate(demoMap.length, (i) {
    return WorkPlanModelClass(
        id: demoMap[i]['id'],
        title: demoMap[i]["title"],
        description: demoMap[i]["description"],
        date: demoMap[i]["date"]);
  });
}
