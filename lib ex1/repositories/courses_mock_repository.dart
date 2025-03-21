

import 'courses_repository.dart';
import '../models/course.dart';

class CoursesMockRepository extends CoursesRepository {

  final List<Course> _courses = [
    Course(name: 'HTML'),
    Course(name: 'JAVA'),
    Course(name: 'Dart'),
    Course(name: 'Flutter'),
    Course(name: 'Python'),
  ];

  @override
  List<Course> getCourses() {
    return _courses;
  }

  @override
  String toString() {
    return 'CoursesMockRepository{courses: ${getCourses()}}';
  }

  @override
  void addScore(Course course, CourseScore score) {
    course.addScore(score);
  }

}