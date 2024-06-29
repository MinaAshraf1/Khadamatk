import 'package:flutter/material.dart';

Color mainColor = const Color(0xff9F83F6);

String firstName(String text) {
  String word = text.substring(0, text.indexOf(" "));
  return '$word ';
}

lastName(String text) {
  List<String> words = text.split(' ');

  List<String> desiredWords = words.sublist(1, words.length);

  return desiredWords.join(' ');
}