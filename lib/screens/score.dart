import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/controllers/question_cont.dart';

class Score extends StatelessWidget {
  const Score({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Questioncont _qncontroller=Get.put(Questioncont());
    return Scaffold(
      body:Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              Spacer(flex: 3,),
              Text("Score",style: Theme.of(context).textTheme.headline3,),
              Spacer(),
              Text("${_qncontroller.correctans}/${_qncontroller.questions.length}",style: Theme.of(context).textTheme.headline4,),
              Spacer(flex: 3,),
            ],
          )
        ],
      ) ,
    );
  }
}
