import 'package:flutter/material.dart';
import 'package:dasz_spisac/views/login_page.dart';

class PolicyViewmodel extends ChangeNotifier {
  void onNextPressed(BuildContext context) async {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }
}
