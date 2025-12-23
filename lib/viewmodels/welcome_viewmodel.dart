import 'package:flutter/material.dart';
import 'package:dasz_spisac/views/main_page.dart';

class WelcomeViewmodel extends ChangeNotifier{
  void toNextPage(BuildContext context) async{
   await Future.delayed(const Duration(seconds: 2));

   if (!context.mounted) return;

   Navigator.of(context).pushReplacement(
     MaterialPageRoute(
       builder: (context) => const MainPage(),
     ),
   );
  }
}