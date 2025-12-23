import 'package:flutter/material.dart';
import 'package:dasz_spisac/theme/widgets/gradient_scaffold.dart';
import 'package:provider/provider.dart';
import 'package:dasz_spisac/viewmodels/welcome_viewmodel.dart';

class WelcomePage extends StatelessWidget{
  const WelcomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WelcomeViewmodel(),
      child: const _WelcomePageContent(),
    );
  }
}
class _WelcomePageContent extends StatefulWidget{
  const _WelcomePageContent();
  @override
  State<_WelcomePageContent> createState() => _WelcomePageContentState();
}

class _WelcomePageContentState extends State<_WelcomePageContent>{
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WelcomeViewmodel>().toNextPage(context);
    });
  }
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