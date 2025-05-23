import 'package:flutter/material.dart';

class User {
  final String? id;
  final String? name;
  final String? email;
  final String? imageUrl;

  const User({
    this.id,
    @required this.name,
    @required this.email,
    @required this.imageUrl,
  });
}
