import 'package:flutter_quiz/question.dart';

class QuizLogic{
  List<Question> questionList = [
  Question('Makan dengan tangan kanan.', true),
  Question('Makan minum sambil berdiri.', false),
  Question('Makan sampai kekenyangan.', false),
  Question('Membaca doa sebelum dan sesudah makan.', true),
  Question('Mendahului guru saat tanpa salam dan sambil berlari.', false),
  Question('Menutup mata ketika melakukan shalat.', false),
  Question('Memperhatikan ketika guru atau orang sedang menjelaskan.', true),
  Question('Memanggil teman dengan sebutan yang tidak baik.', false),
  Question('Melampiaskan amarah saat terkena musibah dengan menyebut kata-kata kotor atau hewan.',false),
  Question('Saling bekerja sama saat ujian.', false),

  ];
  int questionIndex = 0;

  String getQuestion() => questionList[questionIndex].question;

 int getTotalQuestion() =>  questionList.length;

 int getQuestionNumber() => questionIndex + 1;

 bool getAnswerKey() => questionList[questionIndex].answer;

 void nextQuestion() {
   if (questionIndex < getTotalQuestion()){
     questionIndex++;
     print('index soal ke $questionIndex');
     print('sekarang soal ke $getQuestionNumber()');
   }
 }

 bool isFinish() {

   if (questionIndex >= getTotalQuestion() - 1 ) {
     return true;
   }
   else {
     return false;
   }

 }

 void resetQuestion() => questionIndex = 0;

}


























































