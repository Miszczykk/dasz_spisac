import 'package:flutter/material.dart';
import 'package:dasz_spisac/theme/widgets/gradient_scaffold.dart';

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

            Expanded(child: Column(
              children: [
                const Spacer(),
                SizedBox(height: 100),
                TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Podaj login'
                    )
                ),
                const SizedBox(height: 100.0),
                const Spacer(),
                ElevatedButton(onPressed: (){}, child: Text('Dalej')),
                SizedBox(height: 100)
              ],
            ))

          ],
        ),
      ),
    );
  }
}