import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lista de usuarios'),
          centerTitle: true,
          backgroundColor: Colors.green[700],
        ),
      ),
    );
  }
}
