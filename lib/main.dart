import 'package:flutter/material.dart';
//import './questions.dart';
import './quizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body:Padding(padding: EdgeInsets.symmetric(horizontal: 10),child: Quiz(),),
      ), 
    );
  }
}

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List <Widget> scoreKeeper=[
    SizedBox(height:40 ,),
    
  ];
/*
  List<String> questions =[
    'You are more likely to be legally executed than killed by lightning.',
    'Fifteen percent of all daily Google searches have never been searched before.',
    'The average person spends five years waiting in line in their lifetime.'
  ];

  List<bool> answers=[
    true,true,false
  ];
*/
 

QuizBrain ques=QuizBrain();
   int count=0;

  void check(bool abc){
    bool correctAnswer= ques.getAnswerText();
    void displayIcon(){
    if(correctAnswer==abc)
                  {
                    scoreKeeper.add(Icon(Icons.check,color: Colors.green,size: 23,));count++;
                  }
                  else scoreKeeper.add(Icon(Icons.close,color: Colors.red,size: 23,));
}

    setState(() {
      if (ques.isFinished()==true){
           displayIcon();
          Alert(context: context, title: "Your SCORE : $count/14", desc: "Good Work.You have reached the end of the quiz.").show();
          ques.reset();
          count=0;
          scoreKeeper=[SizedBox(height:40 ,),];
      }
      else{
                 displayIcon();
      }
    });
  }

  

  @override
  Widget build(BuildContext context) {
  
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      
      children: <Widget>[

        Expanded(
          flex:4,
          child:Center(
            child:Text(
              ques.getQuestionText(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ) ,
          ),
        Expanded(
            child:Padding(
              padding: const EdgeInsets.all(10.0),
              child: FlatButton(
                textColor: Colors.white,
                color: Colors.green ,
                child: Text(
                  'True',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  bool abc=true;
                  check(abc);
                  setState(() {ques.nextQue();});},
              ),
            ) ,
          
          ),
        
        Expanded(
          child:Padding(
            padding: const EdgeInsets.all(10.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.red ,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                bool abc=false;
                check(abc);
                setState(() {
                  ques.nextQue();
                });
              },
            ),
          ) ,
        
        ),
        Row(
          children: scoreKeeper,
        )
      ],
      
    );
  }
}