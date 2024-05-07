import 'package:flutter/material.dart';

Widget messageTile(
    {required String message,
    required bool sentByMe,
    required double maxwidth}) {
  return Align(
    alignment: sentByMe ? Alignment.centerRight : Alignment.centerLeft,
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: sentByMe ? Colors.blue : Colors.grey[400],
      ),
      constraints: BoxConstraints(
        maxWidth: maxwidth * 0.6,
      ),
      child: Text(
        message,
        style: TextStyle(
            fontSize: 16, color: sentByMe ? Colors.white : Colors.black),
      ),
    ),
  );
}
