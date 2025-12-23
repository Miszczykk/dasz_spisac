import 'package:flutter/material.dart';
import 'package:dasz_spisac/theme/widgets/gradient_scaffold.dart';

class WelcomePage extends StatelessWidget{
  const WelcomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return _WelcomePageContent();
  }
}

class _WelcomePageContent extends StatelessWidget{
  const _WelcomePageContent();

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
        body: Align(
          alignment: Alignment.center,
            child: Text.rich(
                TextSpan(style: Theme.of(context).textTheme.displayLarge,
                    children: [
                      TextSpan(text: 'dasz\n'),
                      TextSpan(text: 'notatki?', style: Theme.of(context).textTheme.displayLarge?.copyWith(fontWeight: FontWeight.bold))
                    ])
            ),
        )
    );
  }
}