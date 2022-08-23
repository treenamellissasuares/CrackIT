import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:untitled/controllers/question_cont.dart';

import 'constant.dart';

class Option extends StatelessWidget {
  const Option(
      {Key? key, required this.text, required this.index, required this.press})
      : super(key: key);

  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Questioncont>(
        init: Questioncont(),
        builder: (qnController) {
          Color gettherightcolor() {
            if (qnController.isAnswered) {
              if (index == qnController.correctans) {
                return kGreenColor;
              } else if (index == qnController.selectedans &&
                  qnController.selectedans != qnController.correctans) {
                return kRedColor;
              }
            }
            return kGrayColor;
          }
          IconData gettherighticon(){
            return gettherightcolor()==kRedColor?Icons.close:Icons.done;
          }
          return InkWell(
              onTap: press,
              child: Container(
                margin: EdgeInsets.only(top: kDefaultPadding),
                padding: EdgeInsets.all(kDefaultPadding),
                decoration: BoxDecoration(
                    border: Border.all(color: gettherightcolor()),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${index+1}. $text",
                      style: TextStyle(color: gettherightcolor(), fontSize: 18),
                    ),
                    Container(
                      height: 26,
                      width: 26,
                      decoration: BoxDecoration(
                        color: gettherightcolor()==kGrayColor?Colors.transparent: gettherightcolor(),
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: gettherightcolor())
                      ),
                      child: gettherightcolor()== kGrayColor? null:Icon(gettherighticon(),size:16),
                    )
                  ],
                ),
              )
          );
        }
    );
  }
}

