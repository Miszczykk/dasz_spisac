import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dasz_spisac/theme/widgets/gradient_scaffold.dart';
import 'package:dasz_spisac/viewmodels/verification_viewmodel.dart';
import 'package:dasz_spisac/theme/widgets/app_header.dart';

class VerificationPage extends StatelessWidget{

  final String tempId;
  final String tempDomain;

  const VerificationPage({
    super.key,
    required this.tempId,
    required this.tempDomain
  });
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => VerificationViewmodel(),
      child: _VerificationPageContent(tempId: tempId, tempDomain: tempDomain),
    );
  }
}

class _VerificationPageContent extends StatelessWidget{

  final String tempId;
  final String tempDomain;

  const _VerificationPageContent({
    required this.tempId,
    required this.tempDomain
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<VerificationViewmodel>(context, listen: false);

    return GradientScaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppHeader(),
            Expanded(child: Column(
                children: [
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
                  const Spacer(),
                Consumer<VerificationViewmodel>(
                  builder: (context, vm, child){
                    return ElevatedButton(onPressed: () => vm.onNextPressed(context, tempId, tempDomain), child: Text('Dalej'));
                  },
                ),
                  SizedBox(height: (MediaQuery.of(context).size.height * 0.05)),
              ],
            ),),
          ],
        ),
      ),
    );
  }
}