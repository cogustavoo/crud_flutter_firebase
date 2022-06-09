import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_firebase_project/model/user.dart';
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
                final isValid = _form.currentState?.validate();

                if (isValid == true) {
                  _form.currentState?.save();
                  final user = User(
                      name: _formData['name'] ?? 'Undefined',
                      age: _formData['age'] ?? '00',
                      gender: _formData['gender'] ?? 'Undefined');
                  createUser(user);
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _form,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nome invalido';
                    }
                    if (value.trim().length < 4) {
                      return 'Nome muito pequeno. Minimo 4 letras';
                    }
                    return null;
                  },
                  onSaved: (value) => _formData['name'] = value!,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Idade'),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length > 3) {
                      return 'Idade invalida';
                    }
                    return null;
                  },
                  onSaved: (value) => _formData['age'] = value!,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Orientacao Sexual',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().length < 2) {
                      return 'Minimo 2 letras';
                    }
                    return null;
                  },
                  onSaved: (value) => _formData['gender'] = value!,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future createUser(User user) async {
  final docUser = FirebaseFirestore.instance.collection('users').doc();

  user.id = docUser.id;

  final json = user.toJson();

  await docUser.set(json);
}
