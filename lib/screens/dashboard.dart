import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../reusable_widgets/categories.dart';
import '../reusable_widgets/category_header.dart';

class dashboard extends StatelessWidget {
  const dashboard({Key? key}) : super(key: key);


  Widget buildWelcome( String username) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Hello',
          style: TextStyle(fontSize: 16,color:Colors.white ),
        ),
        Text(
          username,
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        )
      ],
    );
  }

  Widget buildCategories(){
    return Container(
      height: 250,
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2
        ,childAspectRatio: 4 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        children: categories
            .map((category) => CategoryHeaderWidget(category: category))
            .toList(),
        
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String username = "Vinol";
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        elevation: 0,
        title: Text('CrackIT'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child:Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.centerLeft,
           child: buildWelcome(username),
          ),

        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red,Colors.blue],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft
            )
          ),
        ),
        actions: [
          Icon(Icons.search),
          SizedBox(width: 12,)
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        children: [
          SizedBox(height: 8,),
          buildCategories()
        ],

      ),
    );

  }
}
