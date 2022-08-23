import 'package:flutter/material.dart';
import 'package:untitled/utils/colors_utils.dart';
import 'answer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Icon> _scoreTracker = [];
  int _questionIndex = 0;
  int _totalScore = 0;
  bool answerWasSelected = false;
  bool endOfQuiz = false;
  bool correctAnswerSelected = false;


  // Color _sett(){
  //   if(answerWasSelected){
  //     if(_questions['answers']['score'] as bool){
  //       return Colors.green;
  //     }
  //     else{
  //       return Colors.red;
  //     }
  //   }
  //   else{
  //     return null;
  //   }
  // }

  void _questionAnswered(bool answerScore) {
    setState(() {
      // answer was selected
      answerWasSelected = true;
      // check if answer was correct
      if (answerScore) {
        _totalScore++;
        correctAnswerSelected = true;
      }
      // adding to the score tracker on top
      _scoreTracker.add(
        answerScore
            ? Icon(
          Icons.check_circle,
          color: Colors.green,
        )
            : Icon(
          Icons.clear,
          color: Colors.red,
        ),
      );
      //when the quiz ends
      if (_questionIndex + 1 == _questions.length) {
        endOfQuiz = true;
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      _questionIndex++;
      answerWasSelected = false;
      correctAnswerSelected = false;
    });
    // what happens at the end of the quiz
    if (_questionIndex >= _questions.length) {
      _resetQuiz();
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      _scoreTracker = [];
      endOfQuiz = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        title: Text(
          'CrackIT Quiz App',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Colors.black, Colors.blue]),
          ),
        ),
      ),
      body: Container(
        child: Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: MediaQuery
                .of(context)
                .size
                .height,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  hexStringtoColor("CB2B93"),
                  hexStringtoColor("9546C4"),
                  hexStringtoColor("5E61F4")
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Column(
            children: [
              Row(
                children: [
                  if (_scoreTracker.length == 0)
                    SizedBox(
                      height: 25.0,
                    ),
                  if (_scoreTracker.length > 0) ..._scoreTracker
                ],
              ),
              Container(
                width: double.infinity,
                height: 130.0,
                margin: EdgeInsets.only(bottom: 10.0, left: 30.0, right: 30.0),
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(10.0),
                ),

                child: Center(
                  child: Text(
                    _questions[_questionIndex]['question'] as String,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ...(_questions[_questionIndex]['answers']
              as List<Map<String, Object>>)
                  .map(
                    (answer) => Answer(
                  answerText: answer['answerText'] as String,
                  answerColor:
                 (answer['score'] as bool ?Colors.green :Colors.red),
                  answerTap: () {
                    // if answer was already selected then nothing happens onTap
                    if (answerWasSelected) {
                      return;
                    }
                    //answer is being selected
                    _questionAnswered(answer['score'] as bool);
                  },
                ),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity,40.0),
                ),
                onPressed: () {
                  if (!answerWasSelected) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          'Please select an answer before going to the next question'),
                    ));
                    return;
                  }
                  _nextQuestion();
                },
                child: Text(endOfQuiz ? 'Restart Quiz' : 'Next Question'),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  '${_totalScore.toString()}/${_questions.length}',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              if (answerWasSelected && !endOfQuiz)
                Container(
                  height: 50,
                  width: double.infinity,
                  color: correctAnswerSelected ? Colors.green : Colors.red,
                  child: Center(
                    child: Text(
                      correctAnswerSelected
                          ? 'Well done, you got it right!'
                          : 'Wrong :/',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              if (endOfQuiz)
                Container(
                  height: 60,
                  width: double.infinity,
                  color: Colors.black,
                  child: Center(
                    child: Text(
                      _totalScore > 4
                          ? 'Congratulations! Your final score is: $_totalScore'
                          : 'Your final score is: $_totalScore. Better luck next time!',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: _totalScore > 4 ? Colors.green : Colors.red,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

const _questions = [
  {
    'question': 'What is Flutter?',
    'answers': [
      {'answerText': 'Flutter is an open-source DBMS','score':false},
      {'answerText': 'Flutter is an open-source UI toolkit', 'score': true},
      {'answerText': 'Flutter is an open-source backend toolkit', 'score': false},
      {'answerText': 'All of the above', 'score': false},
    ],
  },
  {
    'question':
    'The first alpha version of Flutter was released in ________.',
    'answers': [
      {'answerText': 'May 2017', 'score': true},
      {'answerText': 'May 2018', 'score': false},
      {'answerText': 'May 2016', 'score': false},
      {'answerText': 'May 2019', 'score': false},
    ],
  },
  {
    'question': ' Flutter is developed by ________.',
    'answers': [
      {'answerText': 'Facebook', 'score': false},
      {'answerText': 'Microsoft', 'score': false},
      {'answerText': 'Google', 'score': true},
      {'answerText': 'IBM', 'score': false},
    ],
  },
  {
    'question': 'Is Flutter a programming language?',
    'answers': [
      {'answerText': 'Yes', 'score': false},
      {'answerText': 'No', 'score': true},
      {'answerText': 'May be', 'score': false},
      {'answerText': 'Can\'t Say', 'score': false},
    ],
  },
  {
    'question':
    'What is Dart?',
    'answers': [
      {'answerText': 'Dart is a object-oriented programming language.', 'score': false},
      {'answerText': 'Dart is used to create a frontend user interfaces.', 'score': false},
      {'answerText': 'Both A and B.', 'score': true},
      {'answerText': 'None of the above.', 'score': false}
    ],
  },
  {
    'question': 'Flutter is mainly optimized for _________ that can run on both Android and iOS platforms.',
    'answers': [
      {'answerText': ' 2D mobile apps', 'score': true},
      {'answerText': 'Desktop only', 'score': false},
      {'answerText': 'Tablet only', 'score': false},
      {'answerText': 'None of the above', 'score': false},
    ],
  },
  {
    'question': 'Is Flutter a SDK?',
    'answers': [
      {'answerText': 'Yes', 'score': true},
      {'answerText': 'No', 'score': false},
      {'answerText': 'Cant Say', 'score': false},
      {'answerText': 'Maybe', 'score': false},
    ],
  },
  {
    'question': 'SDK stands for _________.',
    'answers': [
      {'answerText': 'Software development knowledge', 'score': false},
      {'answerText': 'Super Duper kong', 'score': false},
      {'answerText': 'Software development kit', 'score': true},
      {'answerText': 'Software debug kit', 'score': false}
    ],
  },
  {
    'question': 'The Dart language can be compiled __________.',
    'answers': [
      {'answerText': 'AOT', 'score': false},
      {'answerText': 'JIT', 'score': false},
      {'answerText': 'Both A and B', 'score': true},
      {'answerText': 'None of the above', 'score': false},
    ],
  },
];
