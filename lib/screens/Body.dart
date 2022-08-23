import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/controllers/question_cont.dart';
import 'package:untitled/screens/constant.dart';
import 'package:untitled/screens/progress.dart';
import 'package:untitled/screens/question%20card.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:untitled/screens/questionsss.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Questioncont _questionController=Get.put(Questioncont());
    return Stack(
      children: [
        WebsafeSvg.asset('abcd.png', fit: BoxFit.fill),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child :progressbar(),
              ),
              SizedBox(height: kDefaultPadding),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child:Obx(
                  ()=>Text.rich(TextSpan(
                      text:"Question ${_questionController.questionnumber.value}",
                      style: Theme.of(context).textTheme.headline4,
                      children: [
                        TextSpan(
                            text: "/${_questionController.questions.length}",
                            style: Theme.of(context).textTheme.headline5
                        )
                      ]
                  ),
                  ),
              )
              ),
              Divider(thickness: 3),
              SizedBox(height: kDefaultPadding,),
              Expanded(
                child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _questionController.pageController ,
                    onPageChanged: _questionController.updateqn,
                    itemCount: _questionController.questions.length,
                    itemBuilder: (context,index)=>QuestionCard(
                      question: _questionController.questions[index])),
              ),
            ],
          ),
        )
      ],
    );
  }
}

