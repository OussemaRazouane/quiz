import 'package:flutter/material.dart';
import 'package:quiz/models/question.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int i = 0;
  bool isSelected = false;
  Answer? selectedAnswer;
  int score = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            children: [
              const Text("Simple Quiz App",
                  style: TextStyle(color: Colors.white, fontSize: 30)),
              const SizedBox(height: 20),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text("question ${i + 1}/${questions.length}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 24)),
                  ),
                ],
              ),
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    height: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Text(questions[i].text,
                        style: const TextStyle(fontSize: 22)),
                  ),
                  const Positioned(
                    left: -50,
                    child: CircleAvatar(
                      radius: 42,
                      backgroundColor: Colors.black,
                    ),
                  ),
                  const Positioned(
                    right: -50,
                    child: CircleAvatar(
                      radius: 42,
                      backgroundColor: Colors.black,
                    ),
                  ),
                  Positioned(
                    top: -30,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.check,
                        color: Colors.green[800],
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
              for (var j = 0; j < questions[i].answers.length; j++)
                answerButton(questions[i].answers[j]),
              nextButton(),
            ],
          ),
        ),
      ),
    );
  }

  answerButton(Answer answer) {
    isSelected = answer == selectedAnswer;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color:
            isSelected ? const Color.fromARGB(255, 50, 112, 143) : Colors.white,
        minWidth: 250,
        height: 50,
        onPressed: () {
          setState(() {
            selectedAnswer = answer;
          });
        },
        child: Text(answer.text, style: const TextStyle(fontSize: 20)),
      ),
    );
  }

  nextButton() {
    bool isLast = false;
    if (i == questions.length - 1) {
      isLast = true;
    }
    return Padding(
      padding: const EdgeInsets.all(20),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        color: const Color.fromARGB(255, 50, 112, 143),
        minWidth: 300,
        height: 60,
        onPressed: () {
          setState(() {
            if (selectedAnswer!.isCorrect) {
              score++;
            }
            if (isLast) {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      score > questions.length * 0.6
                          ? "Pass | score=$score"
                          : "Fail | score=$score",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: score > questions.length * 0.6
                            ? Colors.green[600]
                            : Colors.red[900],
                      ),
                    ),
                    content: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedAnswer = null;
                          i = 0;
                          score = 0;
                          Navigator.pop(context);
                        });
                      },
                      child: const Text(
                        "Restart",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              i++;
              selectedAnswer = null;
            }
          });
        },
        child: Text(isLast ? "Submit" : "Next",
            style: const TextStyle(fontSize: 30)),
      ),
    );
  }
}
