import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dasz_spisac/theme/widgets/gradient_scaffold.dart';
import 'package:dasz_spisac/viewmodels/verification_viewmodel.dart';

class VerificationPage extends StatelessWidget{
  const VerificationPage({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => VerificationViewmodel(),
      child: const _LoginPageContent(),
    );
  }
}

class _LoginPageContent extends StatelessWidget{
  const _LoginPageContent();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<VerificationViewmodel>(context, listen: false);

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
                        TextSpan(text: "notatki?", style: Theme.of(context).textTheme.displayLarge?.copyWith(fontWeight: FontWeight.bold))
                      ])
              ),
            ),

            Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  const Spacer(),

                  TextField(
                      controller: viewModel.otpControllers,
                      maxLength: 8,
                      keyboardType: TextInputType.number,
                      style: Theme.of(context).textTheme.labelMedium,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Podaj kod',
                        counterText: "",
                      )
                  ),
                  SizedBox(height: 100),
                Consumer<VerificationViewmodel>(
                  builder: (context, vm, child){
                    return ElevatedButton(onPressed: () => vm.onNextPressed(context), child: Text('Dalej'));
                  },
                ),
                  const Spacer(),
              ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}