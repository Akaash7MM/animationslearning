import 'package:anime_animation/yingyang_animation.dart';
import 'package:flutter/material.dart';

import 'tranform_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home:YingYangAnimation());
  }

}
