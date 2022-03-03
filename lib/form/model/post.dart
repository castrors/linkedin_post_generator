class Post {
  Post({
    required this.name,
    required this.jobDescription,
    required this.email,
    required this.message,
  });

  final String name;
  final String jobDescription;
  final String email;
  final String message;

  Post copyWith({
    String? name,
    String? jobDescription,
    String? email,
    String? message,
  }) {
    return Post(
      name: name ?? this.name,
      jobDescription: jobDescription ?? this.jobDescription,
      email: email ?? this.email,
      message: message ?? this.message,
    );
  }

  static Post get empty => Post(
        name: '',
        jobDescription: '',
        email: '',
        message: '',
      );

  @override
  String toString() {
    return '''
      {
        name: $name, 
        jobDescription: $jobDescription,
        email: $email,
        message: $message
      }
    ''';
  }
}
