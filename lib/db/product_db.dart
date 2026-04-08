import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ProfileDB {

  static Database? _db;

  static Future<Database> get db async {

    if (_db != null) return _db!;

    _db = await init();
    return _db!;
  }

  static Future<Database> init() async {

    var path = join(await getDatabasesPath(), "profile.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {

        await db.execute('''
        CREATE TABLE profile(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          email TEXT,
          password TEXT,
          firstName TEXT,
          lastName TEXT,
          gender TEXT,
          phone TEXT,
          location TEXT,
          image TEXT
        )
        ''');

      },
    );
  }

  static Future signup({
    required String email,
    required String password
  }) async {

    var database = await db;

    var result = await database.query("profile");

    if(result.isEmpty){

      await database.insert("profile", {

        "email": email,
        "password": password,
        "firstName": "",
        "lastName": "",
        "gender": "",
        "phone": "",
        "location": "",
        "image": ""

      });

    }

  }

  static Future saveProfile(Map<String, dynamic> data) async {

    var database = await db;

    var result = await database.query("profile");

    if(result.isEmpty){

      await database.insert("profile", data);

    }else{

      await database.update(
        "profile",
        data,
        where: "id=?",
        whereArgs: [1],
      );

    }

  }


  static Future<Map<String, dynamic>?> getProfile() async {

    var database = await db;

    var result = await database.query("profile");

    if(result.isNotEmpty){
      return result.first;
    }
    return null;
  }
}