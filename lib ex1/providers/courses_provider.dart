import 'package:flutter/material.dart';
import '../models/course.dart';
import '../repositories/courses_mock_repository.dart';

class CoursesProvider extends ChangeNotifier {
  final CoursesMockRepository _repository = CoursesMockRepository();
  
  List<Course> getCourses() {
    return _repository.getCourses();
  }

  Course getCourseFor(String courseId) {
    return _repository
        .getCourses()
        .where((course) => course.name == courseId)
        .first;
  }

  void addScore(Course course, CourseScore score) {
    _repository.addScore(course, score);
    print(_repository.toString());
    notifyListeners();
  }
}