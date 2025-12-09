import 'package:dasz_spisac/views/policy_page.dart';
import 'package:flutter/material.dart';

class LoginViewmodel extends ChangeNotifier{
  final TextEditingController loginController = TextEditingController();

  bool isGoodFormat(String login){
    final regex = RegExp(r"^\d{5}@s\.pm\.szczecin\.pl$");
    return regex.hasMatch(login);
  }

  void onNextPressed(BuildContext context) async{
    final login = loginController.text;

    if(!isGoodFormat(login)){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Wpisz według formatu: "numer.albumu@s.pm.szczecin.pl"')),
      );
      return;
    }

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const PolicyPage())
    );
    //TODO: change page to OTPs check and hive to save album number
  }
  @override
  void dispose(){
    loginController.dispose();
    super.dispose();
  }
}