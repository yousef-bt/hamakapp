
class CollegeModel {
  final String collegeName;
  final List<Classroom> classrooms;
  final List<Lab> labs; 
  CollegeModel({
    required this.classrooms,
    required this.labs,
    required this.collegeName,
  });
}

class Classroom {
  final String name;
  final String imageUrl;

  Classroom({
    required this.name,
    required this.imageUrl,
  });
}

class Lab {
  final String name;
  final String imageUrl;

  Lab({
    required this.name,
    required this.imageUrl,
  });
}
