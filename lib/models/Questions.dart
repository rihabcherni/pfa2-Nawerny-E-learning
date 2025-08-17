class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question(
      {required this.id,
      required this.question,
      required this.answer,
      required this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question": "What is the output of 'print(2 + 2 * 3)'?",
    "options": ['8', '10', '6', '7'],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "Which keyword is used to define a function in Python?",
    "options": ['func', 'define', 'def', 'function'],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": "What is the result of 'len(\"Hello\")'?",
    "options": ['4', '5', '6', '7'],
    "answer_index": 1,
  },
  {
    "id": 4,
    "question":
        "What loop in Python is used to iterate over a sequence of elements?",
    "options": ['for loop', 'while loop', 'do-while loop', 'foreach loop'],
    "answer_index": 0,
  },
];
