
import 'package:flutter/cupertino.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:quiz_app/databases/mongo_db/mongo_connect.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/leader_board/leader_board_model.dart';
part 'leader_board_provider.g.dart';
@riverpod
class LeaderBoardP extends _$LeaderBoardP{
  late final ScrollController _scrollController;
  bool _isBusy = false;
  int _reqCount = 0;
  final _dataLimit = 20;
  final _db = MongoConnect().database!;
  @override
  FutureOr<List<LeaderBoardModel>> build(){
    _reqCount = 0;
    _isBusy = false;
    return [];
  }

  Future<void> getUsers()async{
    if(_reqCount == 0){
      state = const AsyncValue.loading();
    }
    final pipeLine = AggregationPipelineBuilder()
        ..addStage(Group(id: {
        "email":const Field("email"),
          "name":const Field("name"),
          "imageUrl":const Field("imageUrl")

      },
        fields: {
          "totalCount":Sum(const Field("correctQuestions")),
            }
        ))
        ..addStage(Sort({"totalCount":-1}))
      // ..addStage(Project({"name":1,"totalCount":1,"email":1}))
        ..addStage(Skip(_dataLimit * _reqCount))
        ..addStage(Limit(_dataLimit))


        .build();
    final response = await DbCollection(_db,"quizResult").modernAggregate(pipeLine).toList();
    final leaderBoardData = response.map((e) => LeaderBoardModel.fromJson(e)).toList();

    state = AsyncValue.data([...state.value ??[], ...leaderBoardData]);



  }

  Future<void> lazyLoading({required ScrollController scrollController})async{
    _scrollController = scrollController;
    _scrollController.addListener(() async{

      if(_scrollController.position.maxScrollExtent >= _scrollController.offset){
        if(_isBusy == false){
          _isBusy = true;
          await getUsers();
          _reqCount++;
          _isBusy = false;
        }
      }
    });
  }





}