import 'package:flutter/material.dart';
import 'home_screen.dart';

class UserForm extends HomeScreen {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  UserForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {},
          ),
          title: const Text('formulario'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Idade',
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Genero',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
