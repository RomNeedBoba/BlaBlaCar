
import '../models/course.dart';

abstract class CoursesRepository {
  List<Course> getCourses();
  void addScore(Course course, CourseScore score);
}