import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'content_type.g.dart';

@HiveType(typeId: 1)
enum ContentType {
  @HiveField(0)
  movies('movie'),
  @HiveField(1)
  series('tv'),
  @HiveField(2)
  seasons('Season'),
  @HiveField(3)
  episodes('Episode');

  final String text;
  const ContentType(this.text);

  Tab get tab => Tab(text: text);
}
