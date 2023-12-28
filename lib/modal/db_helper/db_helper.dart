import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task/modal/data_modal.dart/data.dart';

class MyDBHelper {
  /// table name
  var TasksTable = "note";

  /// field names
  var columnNoteId = "note_id";

  /// primary
  var columnUserName = "userName";
  var columnDepartment = "userDeportment";
  var columnDueDate = 'dueDate';
  var columnDueTime = "dueTime";
  var columnTitle = "title";
  var columnDesc = "desc";
  var columnStatus = 'status';

  Future<Database> openDB() async {
    var mDirectory = await getApplicationDocumentsDirectory();
    await mDirectory.create(recursive: true);
    var dbpath = "$mDirectory/notedb.db";

    return await openDatabase(dbpath, version: 1, onCreate: (db, version) {
      var createTableQuery =
          "create table $TasksTable($columnNoteId integer primary key autoincrement, $columnUserName text, $columnDepartment text, $columnTitle text, $columnDesc text, $columnStatus integer, $columnDueDate integer, $columnDueTime integer)";
      db.execute(createTableQuery);
    });
  }

  /// status of task
  /// 1 == pending
  /// 2 == ongoing
  /// 3 == completed
  Future<bool> addNote(
      {required String title,
      required String desc,
      required int status,
      required String userName,
      required String department,
      required int dueDate,
      required int dueDateTime}) async {
    var db = await openDB();
    var check = await db.insert(TasksTable, {
      columnTitle: title,
      columnDesc: desc,
      columnStatus: status,
      columnUserName: userName,
      columnDepartment: department,
      columnDueDate: dueDate,
      columnDueTime: dueDateTime
    });
    return check > 0;
  }

  Future<List<DataModal>> fetchAllNotes() async {
    var db = await openDB();
    List<Map<String, dynamic>> notes = await db.query(TasksTable);

    List data = notes;
    return data.map((e) => DataModal.formMap(e)).toList();
  }

  Future<List<DataModal>> fetchAllPending() async {
    var db = await openDB();
    List<Map<String, dynamic>> notes = await db.query(TasksTable,
        columns: [
          'userName',
          'userDeportment',
          'dueDate',
          'dueTime',
          'title',
          'desc',
          'status',
        ],
        where: 'status = ?',
        whereArgs: [1]);
    List data = notes;
    return data.map((e) => DataModal.formMap(e)).toList();
  }

  Future<List<DataModal>> fetchAllOngoing() async {
    var db = await openDB();
    List<Map<String, dynamic>> notes = await db.query(TasksTable,
        columns: [
          'userName',
          'userDeportment',
          'dueDate',
          'dueTime',
          'title',
          'desc',
          'status',
        ],
        where: 'status = ?',
        whereArgs: [2]);
    List data = notes;
    return data.map((e) => DataModal.formMap(e)).toList();
  }

  Future<List<DataModal>> fetchAllCompleted() async {
    var db = await openDB();
    List<Map<String, dynamic>> notes = await db.query(TasksTable,
        columns: [
          'userName',
          'userDeportment',
          'dueDate',
          'dueTime',
          'title',
          'desc',
          'status',
        ],
        where: 'status = ?',
        whereArgs: [3]);
    List data = notes;
    return data.map((e) => DataModal.formMap(e)).toList();
  }

  Future<bool> updateNotes(
      {required int id,
      required String title,
      required String desc,
      required int status,
      required String userName,
      required String department,
      required int dueDate,
      required int dueDateTime}) async {
    print('update for id == $id');
    print('update for status == $status');
    var db = await openDB();
    var chack = await db.update(
        TasksTable,
        {
          columnTitle: title,
          columnDesc: desc,
          columnStatus: status,
          columnUserName: userName,
          columnDepartment: department,
          columnDueDate: dueDate,
          columnDueTime: dueDateTime
        },
        where: "$columnNoteId = ?",
        whereArgs: ["$id"]);

    print('update check $chack');
    return chack > 0;
  }

  Future<bool> deletNotes(String id) async {
    var db = await openDB();
    var check = await db
        .delete(TasksTable, where: "$columnNoteId = ?", whereArgs: ["$id"]);
    return check > 0;
  }
}
