import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/user.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'outes',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text('just playing'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, '/user-form');
              },
            ),
          ],
        ),
        body: StreamBuilder<List<User>>(
          stream: readUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('something wrong ${snapshot.error}');
            } else if (snapshot.hasData) {
              final users = snapshot.data!;
              return ListView(
                children: users.map(buildUser).toList(),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

Widget buildUser(User user) => ListTile(
      leading: CircleAvatar(child: Text(user.age)),
      title: Text(user.name),
      subtitle: Text(user.gender),
    );

Stream<List<User>> readUsers() =>
    FirebaseFirestore.instance.collection('users').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
