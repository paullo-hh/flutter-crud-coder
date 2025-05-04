import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    final avatar =
        user.imageUrl == null || user.imageUrl!.isEmpty
            ? CircleAvatar(child: Icon(Icons.person))
            : CircleAvatar(backgroundImage: NetworkImage(user.imageUrl!));

    return ListTile(
      leading: avatar,
      title: Text(
        user.name!,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(user.email!),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              color: const Color.fromARGB(255, 255, 213, 74),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              color: const Color.fromARGB(255, 199, 56, 46),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
