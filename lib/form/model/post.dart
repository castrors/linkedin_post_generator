import 'package:flutter/material.dart';

class Post {
  Post({
    required this.name,
    required this.jobDescription,
    required this.email,
    required this.message,
    required this.topColor,
    required this.bottomColor,
  });

  final String name;
  final String jobDescription;
  final String email;
  final String message;
  final Color topColor;
  final Color bottomColor;

  Post copyWith({
    String? name,
    String? jobDescription,
    String? email,
    String? message,
    Color? topColor,
    Color? bottomColor,
  }) {
    return Post(
      name: name ?? this.name,
      jobDescription: jobDescription ?? this.jobDescription,
      email: email ?? this.email,
      message: message ?? this.message,
      topColor: topColor ?? this.topColor,
      bottomColor: bottomColor ?? this.bottomColor,
    );
  }

  static final Post empty = Post(
        name: '',
        jobDescription: '',
        email: '',
        message: '',
        topColor: const Color(0xFFFF4D50),
        bottomColor: const Color(0xFF303197),
      );

  @override
  String toString() {
    return '''
      {
        name: $name, 
        jobDescription: $jobDescription,
        email: $email,
        message: $message,
        topColor: $topColor,
        bottomColor: $bottomColor,
      }
    ''';
  }
}
