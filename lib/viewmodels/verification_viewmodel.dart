import 'package:flutter/material.dart';
import 'package:dasz_spisac/views/policy_page.dart';

class VerificationViewmodel extends ChangeNotifier{
  final List<TextEditingController> otpControllers = List.generate(4, (index) => TextEditingController());

  String get otpCode => otpControllers.map((e) => e.text).join();

  bool checkOTPCode(String code){
    if(code.length == 4){
      //TODO: Upload to service and check
      return true;
    }
    return false;
  }

  void onNextPressed(BuildContext context) async {
    if (checkOTPCode(otpCode)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Podany kod jest niepoprawny, spróbuj ponownie')),
      );
      return;
    }

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const PolicyPage())
    );
  }
  @override
  void dispose(){
    for(var controller in otpControllers){
      controller.dispose();
    }
    super.dispose();
  }
}

