import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quiz_app/models/user_models/user_model.dart';

/// A singleton class to set up and provide access to a local Isar database.

class LocalDbSetup{

  static final LocalDbSetup  _instance = LocalDbSetup._internal();
  late Isar database;

  /// Factory constructor to return the single instance of [LocalDbSetup].
  factory LocalDbSetup() {
    return _instance;
  }

  /// Private constructor to enforce singleton pattern.
  LocalDbSetup._internal();

  /// Sets up the local Isar database by opening it with the required schema.
  ///
  /// This asynchronous function initializes the database by providing the required schema,
  /// which is represented by the [StudentLDBModelSchema] in this case.
  ///
  /// Note: The function assumes the existence of the [Isar] database and the [StudentLDBModelSchema]
  /// class representing the schema for the database. The database is opened in the application's
  /// documents directory.
  Future<void> setup()async{
    final dir = await getApplicationDocumentsDirectory();
    database = await Isar.open([UserModelSchema], directory: dir.path);
  }

}