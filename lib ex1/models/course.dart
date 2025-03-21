class Course {
  Course({required this.name});

  final String name;
  final List<CourseScore> scores = [];

  void addScore(CourseScore score) {
    scores.add(score);
  }

  bool get hasScore => scores.isNotEmpty;

  double get average {
    if (scores.isNotEmpty) {
      double total = scores.fold(0, (prev, score) => prev + score.studenScore);
      return total / scores.length;
    }
    return 0;
  }

  @override
  String toString() {
    return 'Course{name: $name, scores: $scores}';
  }
}

class CourseScore {
  const CourseScore({required this.studentName, required this.studenScore});

  final String studentName;
  final double studenScore;

  @override
  String toString() {
    return 'CourseScore{studentName: $studentName, studenScore: $studenScore}';
  }
}