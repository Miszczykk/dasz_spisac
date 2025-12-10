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
                Text('Podaj kod', style: Theme.of(context).textTheme.displayMedium),
                  SizedBox(height: 50),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(4, (index) {
                    return SizedBox(
                        width: 75,
                        height: 75,
                        child: TextField(
                          controller: viewModel.otpControllers[index],
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            counterText: "",
                          ),
                          onChanged: (value) {
                            if (value.length == 1 && index < 3) {
                              FocusScope.of(context).nextFocus();
                            } else if (value.isEmpty && index > 0) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                        ),
                    );
                  },)
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