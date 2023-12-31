
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../databases/mongo_db/mongo_connect.dart';
part 'get_total_question_count_provider.g.dart';

/// A Riverpod state provider for fetching and managing the total question count.
///
/// The [GetTotalQuestionCountP] class extends from a generated provider class (likely generated by Riverpod).
/// It is responsible for fetching and managing the total number of questions in a database.
@Riverpod(keepAlive: true)
class GetTotalQuestionCountP extends _$GetTotalQuestionCountP {
  /// Initializes the state with the total question count.
  @override
  FutureOr<int> build() {
    return _getCount();
  }

  /// Retrieves the total number of questions from the database.
  ///
  /// Returns an integer representing the total question count.
  Future<int> _getCount() async {
    final db = MongoConnect().database;
    final count = await db!.collection("Questions").count();
    return count;
  }
}
