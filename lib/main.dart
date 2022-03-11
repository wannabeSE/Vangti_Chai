import 'package:bigger_number/buttons.dart';
import 'package:flutter/material.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);
  
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var question = '';
  var answer='';
  final List<String> bts = [
    '9',
    '8',
    '7',
    '6',
    '5',
    '4',
    '3',
    '2',
    '1',
    '0',
    'Clear','DEL','Enter'

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text(
          'Vangti Chai',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Lobster'),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      backgroundColor: Colors.deepPurple[100],
      body: 
      Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    
                    alignment: Alignment.bottomLeft,
                    child:const Text(
                      'The amount you want to split:',
                      
                      style:  TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Lobster'),
                    ),
                    
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      question+' '+'Taka',
                      
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Yanone'),
                    ),
                    
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    alignment: Alignment.bottomRight,
                    child: const Text(
                      'BDT : Number of Notes:',
                    style:  TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Lobster'
                    ),
                    ),
                  ),
                  
                  Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      answer,
                      
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Yanone'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: GridView.builder(
                  itemCount: bts.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    //Clear Button
                    if (index == 10) {
                      return MyButton(
                        btTap: (){
                          setState(() {
                            question='';
                            answer='';
                          });
                        },
                        btText: bts[index],
                        color: Colors.lightBlueAccent,
                        textClr: Colors.white,
                      );
                    }
                    //delete button
                    else if(index==11){
                      return MyButton(
                        btTap: (){
                          setState(() {
                            question=question.substring(0,question.length-1);
                          });
                        },
                        btText: bts[index],
                        color: Colors.red,
                        textClr: Colors.white,
                      );
                    }
                    //Enter button
                    if(index==12){
                      
                      return MyButton(
                        btTap:(){
                          setState(() {
                            result();
                          });
                     
                        },
                        btText: bts[index],
                        color: Colors.green,
                        textClr: Colors.white,
                      );
                    }
                    //Rest of the button
                    return MyButton(
                      btTap: (){
                        setState(() {
                          question+=bts[index];
                        });
                      },
                      btText: bts[index],
                      color: Colors.purple,
                      textClr: Colors.white,
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }

  void result() {
    final List<int> notes=[500,100,50,20,10,5,2,1];
    int q=int.parse(question);
    int count=0;
    String ans='';
    double keep;
    
    for(int i=0;i<notes.length;i++){
      
    if(q>notes[i]) {
      keep=(q/notes[i]);
      
      count=keep.floor();
      keep=0;
      q=q%notes[i];
      ans+=notes[i].toString()+':'+count.toString()+' ; ';      
      count=0;      
    }
    else if(q>0 && q<=5 && q==notes[i] && int.parse(question)!=q) {      
        keep=q/notes[i];
        count=keep.floor();
        ans+=notes[i].toString()+':'+count.toString()+' ; ';
        break;
      
    }
    }
    answer=ans;
  }
}

