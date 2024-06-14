import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: MyQuizApp());
  }
}

class MyQuizApp extends StatefulWidget {
  const MyQuizApp({super.key});

  @override
  State createState() => QuizState();
}

class SingleQuestion {
  final String? question;
  final List<String>? options;
  final int? answerIndex;
  const SingleQuestion({this.question, this.options, this.answerIndex});
}

class QuizState extends State {
  int qcount = 1;
  int score = 0;
  bool questionS = true;
  int questionIndex = 0;
  int choosenIndex = -1;

  MaterialStateProperty<Color?> colorChange(int buttonIndex) {
    if (choosenIndex != -1) {
      if (buttonIndex == qna[questionIndex].answerIndex) {
        return const MaterialStatePropertyAll(Colors.green);
      } else if (choosenIndex == buttonIndex) {
        return const MaterialStatePropertyAll(Colors.red);
      } else {
        return const MaterialStatePropertyAll(null);
      }
    } else {
      return const MaterialStatePropertyAll(null);
    }
  }

  List qna = [
    const SingleQuestion(
      question: "Who is President of India?",
      options: [
        "Droupadi Murmu",
        "Narendra Modi",
        "Amit Saha",
        "Yogi Aditynath"
      ],
      answerIndex: 0,
    ),
    const SingleQuestion(
      question: "Who is Prime Minister of India?",
      options: [
        "Droupadi Murmu",
        "Narendra Modi",
        "Amit Saha",
        "Yogi Aditynath"
      ],
      answerIndex: 1,
    ),
    const SingleQuestion(
      question: "Who is Home Minister of India?",
      options: [
        "Droupadi Murmu",
        "Narendra Modi",
        "Amit Saha",
        "Yogi Aditynath"
      ],
      answerIndex: 2,
    ),
    const SingleQuestion(
      question: "Who is CM of UttarPradesh?",
      options: [
        "Droupadi Murmu",
        "Narendra Modi",
        "Amit Saha",
        "Yogi Aditynath"
      ],
      answerIndex: 3,
    ),
    const SingleQuestion(
      question: "Who is CM of Maharashtra?",
      options: ["Ajit Pawar", "Raj Thakre", "Eknath Shinde", "Uddhav Tharkre"],
      answerIndex: 2,
    ),
  ];

  Scaffold isQuestionScreen() {
    if (questionS == true) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Tech Quiz"),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Question :",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w900),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "${questionIndex + 1}/${qna.length}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w900),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  qna[questionIndex].question,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 40,
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  if (choosenIndex == -1) {
                    setState(() {
                      choosenIndex = 0;
                    });
                  }
                },
                style: ButtonStyle(backgroundColor: colorChange(0)),
                child: Text(
                  "A.${qna[questionIndex].options[0]}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.normal),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  if (choosenIndex == -1) {
                    setState(() {
                      choosenIndex = 1;
                    });
                  }
                },
                style: ButtonStyle(
                  backgroundColor: colorChange(1),
                ),
                child: Text(
                  "B.${qna[questionIndex].options[1]}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.normal),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  if (choosenIndex == -1) {
                    setState(() {
                      choosenIndex = 2;
                    });
                  }
                },
                style: ButtonStyle(
                  backgroundColor: colorChange(2),
                ),
                child: Text(
                  "C.${qna[questionIndex].options[2]}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.normal),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  if (choosenIndex == -1) {
                    setState(() {
                      choosenIndex = 3;
                    });
                  }
                },
                style: ButtonStyle(
                  backgroundColor: colorChange(3),
                ),
                child: Text(
                  "D.${qna[questionIndex].options[3]}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.normal),
                ),
              ),
            ),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (choosenIndex == -1) {
              return;
            }
            if (choosenIndex == qna[questionIndex].answerIndex) {
              score++;
            }
            choosenIndex = -1;
            questionIndex++;
            if (questionIndex == qna.length) {
              questionS = false;
            }
            setState(() {});
          },
          child: const Icon(Icons.keyboard_arrow_right),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Score"),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3zlXC3yOOD9du2iA86MCrukZwuVSrLO6yqg&usqp=CAU",
              height: 300,
              width: 500,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Congratulations",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w800),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "You Scored: $score",
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 50,
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  choosenIndex = -1;
                  questionS = true;
                  questionIndex = 0;
                  score = 0;
                  setState(() {});
                },
                child: const Text(
                  "Reset",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return isQuestionScreen();
  }
}
