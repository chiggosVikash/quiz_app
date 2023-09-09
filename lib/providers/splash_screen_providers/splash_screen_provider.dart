
import 'package:quiz_app/databases/local_db/local_db_query.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../databases/mongo_db/mongo_connect.dart';
part 'splash_screen_provider.g.dart';
@riverpod
class SplashScreenP extends _$SplashScreenP with LocalDbQuery{

  @override
  FutureOr<int> build(){
    return Future(()async{
      await MongoConnect().connect();
      return _isIsUserLoggedIn();
    });

  }

  Future<int> _isIsUserLoggedIn()async{
    // clearDatabase();
    final newUser = await isNewUser();
    if(newUser){
      return 1;
    }else{
      return 0;
    }
  }

}