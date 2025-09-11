import 'package:flutter/material.dart';
import 'package:flutter_crud/data/dummy_users.dart';
import 'package:flutter_crud/models/user.dart';

class Users with ChangeNotifier {
  final Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int id) {
    return _items.values.elementAt(id);
  }

  void put(User user) {
    if (user.id != null &&
        user.id!.trim().isNotEmpty &&
        _items.containsKey(user.id)) {
      // Atualiza usuário existente
      _items.update(
        user.id!,
        (_) => User(
          id: user.id,
          name: user.name,
          email: user.email,
          imageUrl: user.imageUrl,
        ),
      );
    } else {
      // Adiciona novo usuário
      final id = DateTime.now().millisecondsSinceEpoch.toString();
      _items.putIfAbsent(
        id,
        () => User(
          id: id,
          name: user.name,
          email: user.email,
          imageUrl:
              user.imageUrl ??
              'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png',
        ),
      );
    }
    notifyListeners();
  }

  void remove(User user) {
    if (user != null && user.id != null) {
      _items.remove(user.id);
      notifyListeners();
    }
  }
}
