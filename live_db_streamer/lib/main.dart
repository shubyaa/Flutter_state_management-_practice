import 'package:flutter/material.dart';
import 'package:live_db_streamer/Database/db.dart';
import 'package:live_db_streamer/Features/home/ui/first_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseMongo.connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FirstScreen(),
    );
  }
}
