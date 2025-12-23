import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dasz_spisac/theme/widgets/gradient_scaffold.dart';
import 'package:dasz_spisac/viewmodels/login_viewmodel.dart';
import 'package:dasz_spisac/theme/widgets/app_header.dart';

class LoginPage extends StatelessWidget{
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginViewmodel(),
      child: const _LoginPageContent(),
    );
  }
}

class _LoginPageContent extends StatelessWidget{
  const _LoginPageContent();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LoginViewmodel>(context, listen: false);

    return GradientScaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppHeader(),
            Expanded(
                child: Column(
                  children: [
                    const Spacer(),
                    TextField(
                        controller: viewModel.loginController,
                        style: Theme.of(context).textTheme.labelMedium,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Podaj login'
                        )
                    ),
                    const Spacer(),
                    Consumer<LoginViewmodel>(
                      builder: (context, vm, child){
                        return ElevatedButton(onPressed: () => vm.onNextPressed(context), child: Text('Dalej'));
                        },
                    ),
                    SizedBox(height: (MediaQuery.of(context).size.height * 0.05)),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}