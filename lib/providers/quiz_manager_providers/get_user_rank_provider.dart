

import 'package:mongo_dart/mongo_dart.dart';
import 'package:quiz_app/databases/local_db/local_db_query.dart';
import 'package:quiz_app/databases/mongo_db/mongo_connect.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'get_user_rank_provider.g.dart';
@riverpod
class GetUserRankP extends _$GetUserRankP with LocalDbQuery{

  @override
  FutureOr<int> build(){
    return _rank();
  }
  
  Future<int> _rank()async{
    print("in Rank finder");
    final user = await userEmailName();
    final db = MongoConnect().database!;
    final pipeLine = AggregationPipelineBuilder()

      ..addStage(Match(where.eq("email", user.email)))
      ..addStage(Group(id: null,fields: {
        "totalCorrect":Sum(const Field("correctQuestions")),
      }))
      ..addStage(Lookup(from: "quizResult", localField: "totalCorrect" ,
          foreignField:"totalCorrect", as: "rankedUsers"))
      ..addStage(Unwind(const Field("rankedUsers")))
      ..addStage(ReplaceRoot(const Field("rankedUsers")))
      ..addStage(Sort({"totalCorrect": -1}))
      ..addStage(Limit(1))
    .build();
    final response = await DbCollection(db,"quizResult").modernAggregate(pipeLine).toList();
    print("Database response $response");



    // final rank = await AsyncValue.guard(() {
      // final pipeLine = AggregationPipelineBuilder()
      // ..addStage(Group(id: const Field("email"),fields: {
      //   "totalCorrect":Sum(const Field("correctQuestions")),
      // }))
      // ..addStage(
      //   {}
      // )

    //
    // final pipeline = [
    //   {
    //     r'$group': {
    //       '_id': null,
    //       'totalCorrectQuestions': {
    //         r'$sum': r'$correctQuestions',
    //       },
    //     },
    //   },
    //   {
    //     r'$lookup': {
    //       'from': 'quizResult',
    //       'localField': 'totalCorrectQuestions',
    //       'foreignField': 'totalCorrectQuestions',
    //       'as': 'rankedUsers',
    //     },
    //   },
    //   {
    //     r'$unwind': 'rankedUsers',
    //   },
    //   {
    //     r'$replaceRoot': {
    //       'newRoot': r'$rankedUsers',
    //     },
    //   },
    //   {
    //     r'$sort': {
    //       'totalCorrectQuestions': -1,
    //     },
    //   },
    //   // {
    //   //   r'$limit': 1,
    //   // },
    //   {
    //     r'$project': {
    //       'email': 1,
    //       'totalCorrectQuestions': 1,
    //       'rank': {
    //         r'$indexOfArray': ['\$totalCorrectQuestions', '\$totalCorrectQuestions'],
    //       },
    //     },
    //   },
    // ];
    //
    // final result = await DbCollection(db, "quizResult").aggregate(pipeline);
    // print("Data result $result");
    return 1;
  }

}