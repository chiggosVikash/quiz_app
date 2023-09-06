
import 'package:flutter/foundation.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoConnect{
  static final MongoConnect  _instance = MongoConnect._internal();
   Db? database;
   final _url = "mongodb+srv://Vikash:91tD9uU3IqUGae5B@cluster0.nstrt.mongodb.net/QuizApp?retryWrites=true&w=majority";

  /// Factory constructor to return the single instance of [LocalDbSetup].
  factory MongoConnect() {
    return _instance;
  }

  /// Private constructor to enforce singleton pattern.
  MongoConnect._internal();

  Future<void> connect()async{
    if(database != null) return;
    try{
      database = await Db.create(_url);

      if(database == null) return;
      await database!.open();
      if(kDebugMode){
        print("Database state ${database?.state}");
      }
    }catch(e){
      if(kDebugMode){
        print(e);
          rethrow;

      }

    }

  }


}