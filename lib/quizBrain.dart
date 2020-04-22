import './questions.dart';
//import 'package:rflutter_alert/rflutter_alert.dart';
//import './main.dart';

class QuizBrain{
int _queNum=0;
List<Questions> _queBank=[
    Questions('You are more likely to be legally executed than killed by lightning.' ,true ),
    Questions( 'Fifteen percent of all daily Google searches have never been searched before.',true ),
    Questions('The average person spends five years waiting in line in their lifetime.' ,false ),
    Questions( 'Chewing gum takes seven years for a person to digest' ,false  ),
    Questions( 'The Great Wall of China can be seen with the unaided eye from space' ,false  ),
    Questions( 'If a piece of paper was folded 45 times, it would reach to the moon' ,  true),
    Questions( 'Bananas grow on trees' , false ),
    Questions( 'Sugar makes children hyper' , false ),
    Questions( 'Pirates wore eye patches so they could see better in the dark' , true ),
    Questions( 'Shaving makes hair grow back faster' , false ),
    Questions( 'It rains diamonds on Saturn and Jupiter' , true ),
    Questions( 'Oxford University is older than the Aztec Empire' , true ),
    Questions( 'Russia has a larger surface area than Pluto' , true ),
    Questions( 'Mammoths still walked the Earth when the Great Pyramid was being built' , true ),
 ];

  void nextQue(){
    if(_queNum < _queBank.length-1){
      _queNum++;
    }
    
  }

 String getQuestionText(){
   return _queBank[_queNum].questionText;
 }

 bool getAnswerText(){
   return _queBank[_queNum].questionAnswer;
 }

bool isFinished(){
  if(_queNum>= _queBank.length-1){
    return true;
  }
  else {return false;}
}

void reset() {
    _queNum = 0;
  }
}
