import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'home_page.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestionIndex = 0;
  int score = 0;
  bool answered = false;
  int? selectedAnswerIndex;

  List<Map<String, dynamic>> quizData = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadQuizData();
  }

  Future<void> loadQuizData() async {
    final String jsonString = await rootBundle.loadString(
      'assets/quiz_data.json',
    );
    final List<dynamic> jsonResponse = json.decode(jsonString);
    if (!mounted) return;
    setState(() {
      quizData = jsonResponse.cast<Map<String, dynamic>>();
      isLoading = false;
    });
  }

  void answerQuestion(int selectedIndex) {
    if (answered) return;
    setState(() {
      answered = true;
      selectedAnswerIndex = selectedIndex;
      if (selectedIndex == quizData[currentQuestionIndex]["answer_index"]) {
        score++;
      }
    });
  }

  void nextQuestion() {
    setState(() {
      currentQuestionIndex++;
      answered = false;
      selectedAnswerIndex = null;
    });
  }

  void finishQuiz() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
      (route) => false,
    );
  }

  String getResultMessage() {
    double percentage = score / quizData.length;
    if (percentage == 1.0) {
      return "Congratulations! You are qualified to be a Scout Regiment member!";
    } else if (percentage >= 0.5) {
      return "Good effort! Study more to become a Scout Regiment member.";
    } else {
      return "Unfortunately, you are not qualified to be a Scout Regiment member yet.";
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.4),
        elevation: 0,
        title: const Text("Scout Quiz", style: TextStyle(fontFamily: 'Ditty')),
        actions: [
          TextButton(
            onPressed: finishQuiz,
            child: const Text(
              "Finish Quiz",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: currentQuestionIndex >= quizData.length
                  ? _buildResultScreen()
                  : _buildQuizContent(
                      quizData[currentQuestionIndex],
                      key: ValueKey(currentQuestionIndex),
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuizContent(Map<String, dynamic> question, {required Key key}) {
    return Container(
      key: key,
      constraints: const BoxConstraints(maxWidth: 600),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 1, color: Colors.white24),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Question ${currentQuestionIndex + 1} of ${quizData.length}",
            style: const TextStyle(color: Colors.white70, fontSize: 18),
          ),
          const SizedBox(height: 12),
          Text(
            question["question"],
            style: const TextStyle(fontSize: 24, fontFamily: 'Ditty'),
          ),
          const SizedBox(height: 24),
          ...List.generate(question["options"].length, (index) {
            Color backgroundColor = Colors.grey.shade800;

            if (answered && index == selectedAnswerIndex) {
              backgroundColor = index == question["answer_index"]
                  ? Colors.green
                  : Colors.red;
            }

            return Container(
              margin: const EdgeInsets.symmetric(vertical: 6),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: backgroundColor,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: answered ? null : () => answerQuestion(index),
                child: Text(
                  question["options"][index],
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'Ditty',
                    color: Colors.white,
                  ),
                ),
              ),
            );
          }),
          const SizedBox(height: 24),
          if (answered)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    selectedAnswerIndex == question["answer_index"]
                        ? "Correct!"
                        : "Wrong!",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: selectedAnswerIndex == question["answer_index"]
                          ? Colors.greenAccent
                          : Colors.redAccent,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Ditty',
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                  ),
                  onPressed: nextQuestion,
                  child: Text(
                    currentQuestionIndex + 1 == quizData.length
                        ? "See Results"
                        : "Next",
                    style: const TextStyle(
                      fontFamily: 'Ditty',
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          const SizedBox(height: 24),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Score: $score / ${quizData.length}",
              style: const TextStyle(color: Colors.white70, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultScreen() {
    final String message = getResultMessage();

    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white24),
      ),
      child: Column(
        key: const ValueKey("result"),
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Scout Quiz Results",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              fontFamily: 'Ditty',
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "You scored $score / ${quizData.length}",
            style: const TextStyle(
              fontSize: 24,
              color: Color.fromARGB(255, 94, 217, 157),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.white70,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              setState(() {
                currentQuestionIndex = 0;
                score = 0;
                answered = false;
                selectedAnswerIndex = null;
              });
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
            child: const Text(
              "Restart Quiz",
              style: TextStyle(fontFamily: 'Ditty', color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
