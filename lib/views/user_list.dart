import 'package:flutter/material.dart';
import 'package:flutter_crud/components/user_tile.dart';
import 'package:flutter_crud/provider/users.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users List',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: const Icon(Icons.person_add_rounded),
              onPressed: () {
                Navigator.of(context).pushNamed('/user-form');
              },
            ),
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 42, 42, 42),
        foregroundColor: const Color.fromARGB(255, 233, 233, 233),
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
      ),
    );
  }
}
