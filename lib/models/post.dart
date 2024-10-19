import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Post {
  final String title;
  final String description;
  final IconData icon;
  final DateTime date;
  final String category;
  final Color color;

  Post({
    required this.title,
    required this.description,
    required this.icon,
    required this.date,
    required this.category,
    required this.color,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'icon': icon.codePoint,
        'date': date.toIso8601String(),
        'category': category,
        'color': color.value,
      };

  static Post fromJson(Map<String, dynamic> json) => Post(
        title: json['title'],
        description: json['description'],
        icon: IconData(json['icon'], fontFamily: 'FontAwesomeIcons'),
        date: DateTime.parse(json['date']),
        category: json['category'],
        color: Color(json['color']),
      );
}

final List<String> categories = [
  "Awesome",
  "Happy",
  "Content",
  "Neutral",
  "Anxious",
  "Sad",
  "Terrible",
];

final List<IconData> icons = [
  FontAwesomeIcons.faceLaughSquint,
  FontAwesomeIcons.faceSmile,
  FontAwesomeIcons.faceGrinTongue,
  FontAwesomeIcons.faceMeh,
  FontAwesomeIcons.faceRollingEyes,
  FontAwesomeIcons.faceSadTear,
  FontAwesomeIcons.faceSadCry,
];

final List<Color> colors = [
  const Color(0xFF4CAF50),
  const Color(0xFF667BC6),
  const Color(0xFF2196F3),
  const Color(0xFF9E9E9E),
  const Color(0xFFFF5722),
  const Color(0xFF673AB7),
  const Color(0xFFF44336),
];
