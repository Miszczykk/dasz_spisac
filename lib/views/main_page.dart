import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dasz_spisac/theme/widgets/gradient_scaffold.dart';
import 'package:dasz_spisac/viewmodels/main_viewmodel.dart';

class MainPage extends StatelessWidget{
  const MainPage({super.key});
  @override
  Widget build(BuildContext context) {
  return ChangeNotifierProvider(
    create: (_) => MainViewmodel(),
    child: const _MainPageContent(),
  );
  }
}

class _MainPageContent extends StatelessWidget{
  const _MainPageContent();

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
        body: SafeArea(
          child: Column(
            children: [
              Row(),
              TextField(
                  // controller: viewModel.loginController,
                  style: Theme.of(context).textTheme.labelMedium,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Podaj login'
                  )
              ),
            ],
          ),
        )
    );
  }
}