import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/reusable_widgets/categories.dart';
import 'package:untitled/screens/category.dart';

import '../new_home.dart';

class CategoryHeaderWidget extends StatelessWidget {

  final Category category;

  const CategoryHeaderWidget({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> Navigator.push(context,
          MaterialPageRoute(builder: (context) => new_home())),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color:category.backgroundColor,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(category.icon,color:Colors.white,size: 30),
            SizedBox(height: 12),
            Text(
              category.categoryName,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            )
          ],
        ),
      ),
    );
  }
}
