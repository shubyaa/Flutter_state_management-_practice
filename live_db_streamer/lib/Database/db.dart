import 'dart:async';

import 'package:mongo_dart/mongo_dart.dart';

class DatabaseMongo {
  static var db, userCollection;
  static String USER_COLLECTION = "users";

  static connect() async {
    db = await Db.create(
        "mongodb+srv://shubhped:8451841454aA%40@cluster0.ej3rhfh.mongodb.net/test");
    await db.open();
    userCollection = db.collection(USER_COLLECTION);
  }

  static Future<List<Map<String, dynamic>>> getDocuments() async {
    final users = await userCollection.find().toList();
    return users;
  }
}


// mongodb+srv://shubhped:8451841454aA%40@cluster0.ej3rhfh.mongodb.net/test