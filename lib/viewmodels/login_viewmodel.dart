import 'package:flutter/material.dart';
import 'package:dasz_spisac/views/verification_page.dart';
import 'package:dasz_spisac/services/OTP_model.dart';


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

    final id = login.substring(0, 5);
    final domain = login.substring(5);
    try{
      await OtpModel().sendCode(id, domain);
      if(context.mounted){
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => VerificationPage(tempId: id, tempDomain: domain))
        );
      }
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Błąd wysyłania kodu. Sprawdź internet.')),
      );
    }
  }
  @override
  void dispose(){
    loginController.dispose();
    super.dispose();
  }
}