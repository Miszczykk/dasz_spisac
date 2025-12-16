import 'package:dasz_spisac/models/user.dart';
import 'package:flutter/material.dart';
import 'package:dasz_spisac/views/policy_page.dart';
import 'package:dasz_spisac/services/OTP_model.dart';
import 'package:dasz_spisac/models/local_model.dart';


class VerificationViewmodel extends ChangeNotifier{

  final TextEditingController otpControllers = TextEditingController();

  Future<bool> checkOTPCode(String code, String id, String domain) async{
    if(code.length == 8){
      try{
        await OtpModel().verifyCode(code, id, domain);
        Data.writeData(id, domain);
        //TODO: Add MainPage()
        return true;
      }catch(e){
        print(e);
        return false;
      }
    }
    return false;
  }

  void onNextPressed(BuildContext context) async {
    final bool isSuccess = await checkOTPCode(otpControllers.text, User.userData!.id, User.userData!.domain);
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

