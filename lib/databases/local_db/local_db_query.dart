
import 'package:quiz_app/databases/local_db/local_db_setup.dart';
import 'package:quiz_app/models/user_models/user_model.dart';

mixin class LocalDbQuery {

  final _db = LocalDbSetup().database;

  Future<bool> isNewUser() async {
    final users = await _db.userModels.buildQuery().findAll();
    return users.isEmpty;
  }

  Future<void> clearDatabase() async {
    await _db.writeTxn(() {
      return _db.userModels.buildQuery().deleteAll();
    });
  }

  Future<int?> saveUser({required UserModel userModel}) async {
    final response = await _db.writeTxn(() async {
      final user = await _db.userModels.buildQuery().findAll();
      if (user.isEmpty) {
        return _db.userModels.put(userModel);
      }
    });
    return response;
  }

  Future<String> imageUrl()async{
    final user = await _db.writeTxn(() {
      return _db.collection<UserModel>().buildQuery<UserModel>().findFirst();

    });
    return user!.imageUrl;
  }


  Future<({String email, String name})> userEmailName() async {
    final user = await _db.writeTxn(() {
      return _db.collection<UserModel>().buildQuery<UserModel>().findFirst();

    });
    return (email:user?.email ?? "",name:user?.name ?? "" );
  }


}