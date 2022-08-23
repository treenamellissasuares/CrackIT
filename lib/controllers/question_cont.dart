import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:untitled/screens/questionsss.dart';
import 'package:untitled/screens/score.dart';

class Questioncont extends GetxController with GetSingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation _animation;
  // so that we can access our animation outside
  Animation get animation => this._animation;


  List<Question> _questions= sample_data.map(
        (question)=> Question(id: question['id'], question: question['question'], answer:question['answer_index'] , options: question['options']),
  ).toList();

  List<Question> get questions=>this._questions;
  bool _isAnswered=false;
  bool get isAnswered=>this._isAnswered;

  int? _correctans;
  int? get correctans=>this._correctans;

  int? _selectedans;
  int? get selectedans=>this._selectedans;

  RxInt _questionnumber=1.obs;
  RxInt get questionnumber=>this._questionnumber;

   int _numofcrans=0;
int get numofcrans=>this._numofcrans;

PageController? _pageController;
  PageController? get pageController => this._pageController;

  @override
  void onInit(){
    _animationController=AnimationController(duration: Duration(seconds: 20),vsync:this );
    _animation=Tween(begin: 0.0,end: 1.0).animate(_animationController)
      ..addListener(() {
        update();
      });

      _animationController.forward().whenComplete(nextQuestion);

      _pageController=PageController();
      super.onInit();
    }
    @override
    void onClose(){
    super.onClose();
    _animationController.dispose();
    _pageController?.dispose();
    }

    void checkAns(Question question,int selectedIndex){
    _isAnswered=true;
    _correctans=question.answer;
    _selectedans=selectedIndex;

    if(_correctans==_selectedans)_numofcrans++;

    _animationController.stop();
    update();

    Future.delayed(Duration(seconds: 2),(){
      nextQuestion();
    });
    }
  void nextQuestion(){
    if(_questionnumber.value!=_questions.length){
      _isAnswered=false;
      _pageController?.nextPage(duration: Duration(milliseconds: 250), curve: Curves.ease);

      _animationController.reset();

      _animationController.forward().whenComplete(nextQuestion);
    }
    else{
      Get.to(Score());
    }

  }



  void updateqn(int index){
    _questionnumber.value=index+1;
  }
}