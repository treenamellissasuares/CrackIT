import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/controllers/question_cont.dart';
import 'package:untitled/screens/Body.dart';
import 'package:untitled/screens/constant.dart';
import 'package:untitled/utils/colors_utils.dart';

class new_home extends StatelessWidget {
  const new_home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Questioncont _controller=Get.put(Questioncont());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          FlatButton(onPressed: _controller.nextQuestion, child: Text('Skip')),
        ],
      ),
      body:
      Body()
    );
  }
}


