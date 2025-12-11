import 'package:flutter/material.dart';
import 'package:dasz_spisac/views/verification_page.dart';
import 'package:dasz_spisac/models/user.dart';

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

    User.userData = User(id: login.substring(0, 5), domain: login.substring(5, login.length));

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const VerificationPage())
    );
  }
  @override
  void dispose(){
    loginController.dispose();
    super.dispose();
  }
}