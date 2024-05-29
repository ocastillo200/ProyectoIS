import 'package:app_gym/models/exercise.dart';

class Routine {
  final String id;
  final String date;
  final String comments;
  final List<Exercise> exercises;
  final String trainer;
  
  Routine({
    required this.id,
    required this.exercises,
    required this.comments,
    required this.date,
    required this.trainer
  });
}