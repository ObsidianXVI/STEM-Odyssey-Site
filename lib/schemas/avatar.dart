part of game;

class AvatarData {
  final String name;
  final int age;
  final List<String> subjects;
  final List<String> universityDegrees;
  final List<String> passions;
  final bool male;

  const AvatarData({
    required this.name,
    required this.age,
    required this.subjects,
    required this.universityDegrees,
    required this.passions,
    required this.male,
  });

  AvatarData.fromJSON(Map<String, dynamic> json)
      : age = json['age'],
        name = json['name'],
        subjects = json['subjects'],
        universityDegrees = json['universityDegrees'],
        passions = json['passions'],
        male = json['male'];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'subjects': subjects,
      'university_degrees': universityDegrees,
      'passions': passions,
      'male': male,
    };
  }
}
