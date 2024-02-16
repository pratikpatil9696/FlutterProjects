import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      home: QuizApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuizApp extends StatefulWidget{
  const QuizApp({super.key});

  @override
  State createState() => _QuizAppState();
}

class SingleModelView{
  final String? question;
  final List? options;
  final int? answer;

  const SingleModelView({this.question,this.options,this.answer});

}

class _QuizAppState extends State{

  @override
  Widget build(BuildContext context){
    return isQuestionScreen();
  }

  List allQuestions = [
    const SingleModelView(
      question: "Flutter Framework is based on which language ?",
      options: ["Swift", "Dart", "Python", "Java"],
      answer: 1,
    ),
    const SingleModelView(
      question: "Which widget is commonly used to create a scrollable list of items in Flutter ?",
      options: [" ListView", " GridView", "Row", " Column"],
      answer: 0,
    ),
    const SingleModelView(
      question: "What widget is used to create a column layout in Flutter?",
      options: ["Row", "Scaffold", "Stack", "Column"],
      answer: 3,
    ),
    const SingleModelView(
      question: "What keyword is used to define a constant variable in Dart?",
      options: ["Var", "final", "const", "let"],
      answer: 2,
    ),
    const SingleModelView(
      question: "When was Flutter launched?",
      options: ["May 2017", "May 2015", "May 2009", "Nov 2013"],
      answer: 0,
    ),
  ];

  bool questionScreen=true;
  int questionIndex=0;
  int selectedIndex=-1;
  int score=0;
  Color textColor=Colors.white;

  MaterialStateProperty<Color?> selectOption(int buttonIndex){
    if(selectedIndex!=-1){
      if(buttonIndex==allQuestions[questionIndex].answer){
        return const MaterialStatePropertyAll(Colors.green);
      }
      else if(buttonIndex==selectedIndex){
        return const MaterialStatePropertyAll(Colors.red);
      }
      else{
        return const MaterialStatePropertyAll(Color(0xff6DA4AA));
      }
    }
    else{
      return const MaterialStatePropertyAll(Color(0xff6DA4AA));
    }
  }

  void validPage(){
    if(selectedIndex==-1){
      return;
    }
    if(selectedIndex==allQuestions[questionIndex].answer){
      score++;
    }
    if(questionIndex==allQuestions.length-1){
      questionScreen=false;
    }
    setState(() {
      questionIndex++;
      selectedIndex=-1;
    });    
  }

  Scaffold isQuestionScreen(){

    if(questionScreen==true){
      return Scaffold( 
        appBar: AppBar(
          title: const Text("Quizzy",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25
              ),
            ),
          centerTitle: true,
          backgroundColor: const Color(0xff6DA4AA),
          shape:const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))
          )
        ),

        backgroundColor: const Color(0xffEEF5FF),

        body: Container(
          
          child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 240,
                  decoration: BoxDecoration(

                    color:const Color(0xff6DA4AA),
                    
                    border: Border.all(
                      color: const Color(0xff607274),
                      width: 2
                    ),
                                          
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15)
                    ),
                    
                    boxShadow: const[
                      BoxShadow(
                        color: Colors.grey,offset: Offset(8, 8),blurRadius: 15
                      )
                    ],

                    
                  ),
                  
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                  
                  child: Text(
                    "Questions : ${questionIndex+1}/${allQuestions.length}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25, 
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),                
              ],
            ),

            const SizedBox(
              height: 50,
            ),

            //all question
            Container(
              width: double.infinity,
              height: 400,
              margin: const EdgeInsets.symmetric(horizontal: 20),

              decoration: BoxDecoration(
                color: const Color(0xffEEF5FF),
                
                borderRadius:BorderRadius.circular(40),

                boxShadow: const[
                  BoxShadow(
                    color: Colors.grey,offset: Offset(-5,-5),blurRadius: 15
                  ),
                  BoxShadow(
                    color: Colors.grey,offset: Offset(5,5),blurRadius: 15
                  ),
                  BoxShadow(
                    color: Colors.grey,offset: Offset(-5,5),blurRadius: 15
                  ),
                  BoxShadow(
                    color: Colors.grey,offset: Offset(5,-5),blurRadius: 15
                  )
                ]
              ),

              child:Column(
                children:[

                  const SizedBox(
                    height: 25,
                  ),

                  //Question Container
                  Container(  
    
                    decoration: BoxDecoration(
                
                      color:const Color(0xff6DA4AA),

                      border: Border.all(
                        color: const Color(0xff607274),
                        width: 2,
                      ),

                      borderRadius: const BorderRadius.all(
                        Radius.circular(15)
                      ),

                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,offset: Offset(5, 5),blurRadius: 10
                        )
                      ],
                    ),

                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.symmetric(horizontal: 10),

                    child:Text("${allQuestions[questionIndex].question}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                  
                  const SizedBox(
                    height: 20,
                  ),
                  
                  //options Container
                  Container( 
              
                    margin: const EdgeInsets.symmetric(horizontal: 10),           
                    child: Column(
                      children:[
                        
                        //first option
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 50,vertical: 5),
                          child:ElevatedButton(
                            style: ButtonStyle(
                            backgroundColor:selectOption(0),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                              )
                              ) 
                            ),
                            
                            onPressed: (){
                              setState(() {
                                selectedIndex=0;
                              });  
                            },
                                     
                            child: Text("${allQuestions[questionIndex].options[0]}",
                              style: TextStyle(
                                color: textColor,
                                fontSize: 25,
                                fontWeight: FontWeight.normal
                              ),
                            ),                
                          ),
                        ),

                        //Second Option
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 50,vertical: 5),
                          child:ElevatedButton(
                            style: ButtonStyle(
                            backgroundColor:selectOption(1),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                              )
                              ) 
                            ),
                            
                            onPressed: (){
                              setState(() {
                                selectedIndex=1;
                              });  
                            },
                                     
                            child: Text("${allQuestions[questionIndex].options[1]}",
                              style: TextStyle(
                                color: textColor,
                                fontSize: 25,
                                fontWeight: FontWeight.normal
                              ),
                            ),                
                          ),
                        ),

                        //Third Option
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 50,vertical: 5),
                          child:ElevatedButton(
                            style: ButtonStyle(
                            backgroundColor:selectOption(2),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                              )
                              ) 
                            ),
                            
                            onPressed: (){
                              setState(() {
                                selectedIndex=2;
                              });  
                            },
                                     
                            child: Text("${allQuestions[questionIndex].options[2]}",
                              style: TextStyle(
                                color: textColor,
                                fontSize: 25,
                                fontWeight: FontWeight.normal
                              ),
                            ),                
                          ),
                        ),


                        //Fourth Option
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 50,vertical: 5),
                          child:ElevatedButton(
                            style: ButtonStyle(
                            backgroundColor:selectOption(3),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                              )
                              ) 
                            ),
                            
                            onPressed: (){
                              setState(() {
                                selectedIndex=3;
                              });  
                            },
                                     
                            child: Text("${allQuestions[questionIndex].options[3]}",
                              style: TextStyle(
                                color: textColor,
                                fontSize: 25,
                                fontWeight: FontWeight.normal
                              ),
                            ),                
                          ),
                        ),
                      ]
                    ),
                  ),
                ]
              )
            )
          ],
        ),
      ),


        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff6DA4AA),
          onPressed: validPage,
          child: const Icon(Icons.forward),
        ),       
      );
    }

    else{
      return Scaffold(
        appBar: AppBar(
          title: const Text("Quizzy",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25
              ),
            ),
          centerTitle: true,
          backgroundColor: const Color(0xff6DA4AA),
          shape:const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))
          )       
        ),

        backgroundColor: const Color(0xffEEF5FF),

        body: Center(
          child: Column(
            children: [
              Image.network("https://static.vecteezy.com/system/resources/previews/024/555/698/original/trophy-cup-champion-trophy-free-png.png",
                height: 300,
                width: 300,
              ),

              const Text("Congratulations.!!!",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight:FontWeight.w600
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              Text("Your Score : $score/${allQuestions.length}",
                style:const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 50,vertical: 5),
                child: ElevatedButton(
                  style:  ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll(Color(0xff6DA4AA)),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                     ),
                    )
                  ),

                onPressed: (){
                  setState(() {
                    questionScreen=true;
                    questionIndex=0;
                    selectedIndex=-1;
                  });
                },

                child: const Text("Reset",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize:25,
                    fontWeight:FontWeight.normal
                    ),
                  ),
                ),
              ), 
            ],
          ),
        ),
      );
    }
  }
}