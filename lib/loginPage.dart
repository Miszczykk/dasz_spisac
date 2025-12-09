import 'package:flutter/material.dart';
import './theme/gradientScaffold.dart';
class LoginPage extends StatelessWidget{
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text.rich(
                  TextSpan(style: Theme.of(context).textTheme.displayLarge,
                      children: [const
                      TextSpan(text: "dasz\n"),
                        TextSpan(text: "notatki?", style: Theme.of(context).textTheme.displayLarge?.copyWith(fontWeight: FontWeight.bold))])
              ),
            ),

            Expanded(
              child: Center(
                  child: TextField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Podaj login'
                        )
                    ),
              )
            ),
            Expanded(
              child: TextButton(onPressed: (){}, child: Text('Dalej')),
            )
          ],
        ),
      ),
    );
  }
}