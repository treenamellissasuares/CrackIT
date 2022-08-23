import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import '../screens/category.dart';



final categories = <Category>[
  Category(

    categoryName: 'Flutter',
    imageUrl: 'assets/abcd.png',
    backgroundColor: Colors.blue,
    icon: FontAwesomeIcons.computer,
    description: 'Practice questions from various chapters in physics',
  ),
  Category(

    imageUrl: 'assets/chemistry.png',
    categoryName: 'Chemistry',
    backgroundColor: Colors.orange,
    icon: FontAwesomeIcons.atom,
    description: 'Practice questions from various chapters in chemistry',
  ),
  Category(

    imageUrl: 'assets/maths.png',
    categoryName: 'Maths',
    backgroundColor: Colors.purple,
    icon: FontAwesomeIcons.squareRootAlt,
    description: 'Practice questions from various chapters in maths',
  ),
  Category(

    imageUrl: 'assets/biology.png',
    categoryName: 'Biology',
    backgroundColor: Colors.lightBlue,
    icon: FontAwesomeIcons.dna,
    description: 'Practice questions from various chapters in biology',
  ),
];