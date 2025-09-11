import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:flutter_crud/provider/users.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  _loadFormData(User user) {
    _formData['id'] = user.id!;
    _formData['name'] = user.name!;
    _formData['email'] = user.email!;
    _formData['avatarUrl'] = user.imageUrl!;
  }

  @override
  Widget build(BuildContext context) {
    final User? user = ModalRoute.of(context)!.settings.arguments as User?;

    if (user != null) {
      _loadFormData(user);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('User Form', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(255, 42, 42, 42),
        foregroundColor: const Color.fromARGB(255, 233, 233, 233),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _formData['name'],
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a name';
                  }

                  if (value.trim().length < 3) {
                    return 'Name must be at least 3 characters long';
                  }

                  return null;
                },
                onSaved: (value) => _formData['name'] = value!,
              ),
              TextFormField(
                initialValue: _formData['email'],
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a email';
                  }

                  return null;
                },
                onSaved: (value) => _formData['email'] = value!,
              ),
              TextFormField(
                initialValue: _formData['avatarUrl'],
                decoration: InputDecoration(labelText: 'Image URL'),
                onSaved: (value) => _formData['avatarUrl'] = value!,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final isValid = _formKey.currentState?.validate();

                  if (isValid ?? false) {
                    _formKey.currentState?.save();

                    Provider.of<Users>(context, listen: false).put(
                      User(
                        id: _formData['id'],
                        name: _formData['name'],
                        email: _formData['email'],
                        imageUrl: _formData['avatarUrl'],
                      ),
                    );

                    Navigator.of(context).pop();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 95, 196, 219),
                  foregroundColor: const Color.fromARGB(255, 42, 42, 42),

                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.save_rounded, size: 20),
                    SizedBox(width: 10),
                    Text(
                      'SAVE',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
