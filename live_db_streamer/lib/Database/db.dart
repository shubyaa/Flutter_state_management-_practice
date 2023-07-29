import 'dart:async';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mongo_dart/mongo_dart.dart';

class DatabaseMongo {
  String url;
  DatabaseMongo({required this.url});
  static var db, userCollection;
  static String USER_COLLECTION = "users";

  static connect() async {
    await dotenv.load();
    db = await Db.create(
        dotenv.get('MONGO_URL')); // Add your own Database Mongo Url here.
    await db.open();
    userCollection = db.collection(USER_COLLECTION);
  }

  static Future<List<Map<String, dynamic>>> getDocuments() async {
    final users = await userCollection.find().toList();
    return users;
  }
}
