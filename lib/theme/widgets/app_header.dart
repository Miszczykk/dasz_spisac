import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget{
  final String firstLineText = "dasz\n";
  final String secondtLineText = "notatki?";

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text.rich(
          TextSpan(style: Theme.of(context).textTheme.displayLarge,
              children: [
              TextSpan(text: firstLineText),
                TextSpan(text: secondtLineText, style: Theme.of(context).textTheme.displayLarge?.copyWith(fontWeight: FontWeight.bold))
              ])
      ),
    );
  }
}