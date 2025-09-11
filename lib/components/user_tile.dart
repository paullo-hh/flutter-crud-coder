import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:flutter_crud/provider/users.dart';
import 'package:flutter_crud/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  final User user;
  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    final avatar =
        user.imageUrl == null || user.imageUrl!.isEmpty
            ? CircleAvatar(
              backgroundColor: Color.fromARGB(255, 95, 196, 219),
              child: Icon(Icons.person),
            )
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
              color: const Color.fromARGB(255, 95, 196, 219),
              onPressed: () {
                Navigator.of(
                  context,
                ).pushNamed(AppRoutes.USER_FORM, arguments: user);
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              color: const Color.fromARGB(255, 179, 60, 51),
              onPressed: () {
                showDialog(
                  context: context,
                  builder:
                      (context) => AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: const Color.fromARGB(255, 82, 82, 82),
                        titleTextStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: const Color.fromARGB(255, 233, 233, 233),
                        ),
                        contentTextStyle: TextStyle(
                          fontSize: 18,
                          color: const Color.fromARGB(255, 233, 233, 233),
                        ),
                        title: const Text('DELETE USER'),
                        content: const Text('Are you sure?'),
                        actionsAlignment: MainAxisAlignment.center,
                        actions: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 10,
                              ),
                              backgroundColor: const Color.fromARGB(
                                255,
                                207,
                                98,
                                98,
                              ),
                            ),
                            child: const Text(
                              'NO',
                              style: TextStyle(
                                color: Color.fromARGB(255, 233, 233, 233),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 10,
                              ),
                              backgroundColor: const Color.fromARGB(
                                255,
                                69,
                                152,
                                46,
                              ),
                            ),
                            child: const Text(
                              'YES',
                              style: TextStyle(
                                color: Color.fromARGB(255, 233, 233, 233),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Provider.of<Users>(
                                context,
                                listen: false,
                              ).remove(user);
                            },
                          ),
                        ],
                      ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
