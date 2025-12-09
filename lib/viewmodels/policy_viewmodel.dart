import 'package:flutter/material.dart';
import 'package:dasz_spisac/views/policy_page.dart'; //TODO: Change

class PolicyViewmodel extends ChangeNotifier{
  void onNextPressed(BuildContext context) async{
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const PolicyPage()),
    );
  }
}