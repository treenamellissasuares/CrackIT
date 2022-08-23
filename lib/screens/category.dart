import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/screens/questionsss.dart';

class Category {
  final String categoryName;
  final String description;
  final Color backgroundColor;
  final IconData icon;

  final String imageUrl;

  Category({
    required this.imageUrl,
    required this.categoryName,
    this.description = '',
    this.backgroundColor = Colors.orange,
    this.icon = Icons.question_mark,
  });
}