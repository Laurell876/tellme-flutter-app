
class Question {
  int id;
  int user_id;
  String title;
  String description;
  int category_id;
  String created_at;


  Question({
    this.id,
    this.user_id,
    this.title,
    this.description,
    this.category_id,
    this.created_at
  });

  factory Question.fromJson(Map<dynamic, dynamic> json) => Question(
    id: json["id"],
    user_id: json["user_id"],
    title: json["refreshToken"],
    description: json["description"],
    category_id: json["category_id"],
    created_at: json["created_at"]
  );
}