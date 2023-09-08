
import 'package:quiz_app/models/question/question_model.dart';

/// The abstract class [QuizManagerInterface] defines the interface for managing quiz-related operations.
///
/// This interface is intended to be implemented by classes that provide quiz functionality.
abstract class QuizManagerInterface {
  /// Fetches the next question for the specified subject.
  ///
  /// The [subject] parameter specifies the subject for which the question should be retrieved.
  Future<void> getQuestion({required String subject});

  /// Records the user's answer to the current question.
  ///
  /// The [question] parameter is the current question being answered.
  /// The [answer] parameter is the user's response to the question.
  void addAnswer({required QuestionModel question, required String answer});

  /// Submits the user's answers for the specified subject.
  ///
  /// The [subject] parameter specifies the subject for which the answers should be submitted.
  Future<void> submitAnswer({required String subject});

  /// Retrieves the current question number.
  ///
  /// This method can be used to determine the current question's position in the quiz.
  void currentQuestionNo();

  /// Moves the user back to the previous question.
  ///
  /// This method allows the user to revisit the previous question in the quiz.
  void backQuestion();

  /// Moves the user to the next question for the specified subject.
  ///
  /// The [subject] parameter specifies the subject for which the next question should be retrieved.
  Future<void> nextQuestion({required String subject});
}
