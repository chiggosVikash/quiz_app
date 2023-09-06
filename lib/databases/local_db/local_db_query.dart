
import 'package:quiz_app/databases/local_db/local_db_setup.dart';
import 'package:quiz_app/models/user_models/user_model.dart';

mixin class LocalDbQuery{

  Future<bool> isNewUser()async{
    final db = LocalDbSetup().database;
    final users = await db.userModels.buildQuery().findAll();
    return users.isEmpty;
  }

  Future<void> clearDatabase()async{
    final db = LocalDbSetup().database;
    await db.writeTxn(() {
      return db.userModels.buildQuery().deleteAll();
    });
  }

  Future<int?> saveUser({required UserModel userModel})async{
    final db = LocalDbSetup().database;
    final response = await db.writeTxn(() async{
      final user = await db.userModels.buildQuery().findAll();
      if(user.isEmpty){
        return db.userModels.put(userModel);
      }
    });
    return response;
  }



}