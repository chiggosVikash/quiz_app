
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../databases/mongo_db/mongo_connect.dart';
part 'get_total_question_count_provider.g.dart';

@Riverpod(keepAlive: true)
class GetTotalQuestionCountP extends _$GetTotalQuestionCountP{

  @override
  FutureOr<int> build(){
    return _getCount();
  }

  Future<int> _getCount()async{
    final db = MongoConnect().database;
    final count = await db!.collection("Questions").count();
    return count;
  }


}