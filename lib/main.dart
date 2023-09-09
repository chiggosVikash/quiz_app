import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/databases/local_db/local_db_setup.dart';
import 'package:quiz_app/databases/mongo_db/mongo_connect.dart';
import 'package:quiz_app/screen_route/screen_route.dart';


Future<void> main() async{
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  await MongoConnect().connect();
  await LocalDbSetup().setup();
  runApp(const ProviderScope(child: MyApp()));
  FlutterNativeSplash.remove();
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final screenRoute = ScreenRoute();
    return MaterialApp(
      onGenerateRoute: screenRoute.onGenerateRoute,
      title: 'Quiz App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
