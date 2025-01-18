class Call {
  final int id;
  final String title;
  final String description;

  Call({required this.id, required this.title, required this.description});

  // JSON 데이터를 Call 객체로 변환
  factory Call.fromJson(Map<String, dynamic> json) {
    return Call(
      id: json['id'],
      title: json['title'],
      description: json['description'],
    );
  }

  // Call 객체를 JSON으로 변환
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }
}