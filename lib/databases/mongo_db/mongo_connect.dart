
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

// db.quizResult.aggregate([{$group:{_id:"$email",totalCorrect:{$sum:"$correctQuestions"}}},{$setWindowFields:{sortBy:{totalCorrect:-1},output:{rankwise:{$rank:{}}}}},{$project:{email:"$_id",_id:0,rankwise:1}},{$match:{email:"abc@gmail.com"}},{$project:{email:0}}]).pretty()
// db.quizResult.aggregate([{$group:{_id:"$email",totalCorrect:{$sum:"$correctQuestions"}}},{$setWindowFields:{sortBy:{totalCorrect:-1},output:{rankwise:{$rank:{}}}}},{$match:{_id:"abc@gmail.com"}},{$project:{rankwise:1,_id:0}}]).pretty()
