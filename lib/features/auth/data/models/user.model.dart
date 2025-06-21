class UseModel{
  final String id;
  final String name;
  final String email;

  UseModel({
    required this.id,
    required this.name,
    required this.email,
  });

  factory UseModel.fromJson(Map<String, dynamic> json) {
    return UseModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}