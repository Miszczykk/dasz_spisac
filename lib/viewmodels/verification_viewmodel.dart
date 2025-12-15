import 'package:flutter/material.dart';
import 'package:dasz_spisac/views/policy_page.dart';
import 'package:dasz_spisac/services/OTP_model.dart';


class VerificationViewmodel extends ChangeNotifier{

  final TextEditingController otpControllers = TextEditingController();

  Future<bool> checkOTPCode(String code) async{
    if(code.length == 8){
      try{
        await OtpModel().verifyCode(code);
        return true;
      }catch(e){
        print(e);
        return false;
      }
    }
    return false;
  }

  void onNextPressed(BuildContext context) async {
    final bool isSuccess = await checkOTPCode(otpControllers.text);
    if (!isSuccess) {
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
    otpControllers.dispose();
    super.dispose();
  }
}

