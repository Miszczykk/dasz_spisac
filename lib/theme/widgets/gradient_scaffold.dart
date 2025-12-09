import 'package:flutter/material.dart';
import 'package:dasz_spisac/theme/colors.dart';

class GradientScaffold extends StatelessWidget{
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;

  const GradientScaffold({
    required this.body,
    this.appBar,
    this.floatingActionButton,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppColors.bgColor,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBar,
        body: Padding(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), child: body),
        floatingActionButton: floatingActionButton,
      ),
    );
  }
}