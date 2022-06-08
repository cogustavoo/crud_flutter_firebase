import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amber,
            title: const Text('just playing'),
            centerTitle: true,
          ),
          body: Center(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('button testing 1'),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('button testing 2'),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('button testing 3'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
