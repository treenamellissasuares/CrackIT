import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/controllers/question_cont.dart';
import 'package:untitled/screens/questionsss.dart';

import 'constant.dart';
import 'options.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    required this.question
      }) : super(key: key);

  final Question question;



  @override
  Widget build(BuildContext context) {
    Questioncont _controller=Get.put(Questioncont());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding) ,
        padding: EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25)
        ),
        child: Column(
          children: [
            Text(question.question,style: Theme.of(context).textTheme.headline6,),
            SizedBox(height: kDefaultPadding/2),
            ...List.generate(question.options.length, (index) => Option(text: question.options[index], index: index, press: ()=>
            _controller.checkAns(question, index)))
          ],
        )
    );
  }
}