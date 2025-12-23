import 'package:flutter/material.dart';
import 'package:dasz_spisac/views/policy_page.dart';
import 'package:dasz_spisac/services/OTP_service.dart';
import 'package:dasz_spisac/models/local_model.dart';


class VerificationViewmodel extends ChangeNotifier{

  final TextEditingController otpControllers = TextEditingController();

  Future<bool> checkOTPCode(String code, String id, String domain) async{
    if(code.length == 8){
      try{
        await OtpModel().verifyCode(code, id, domain);
        LocalModel.saveUser(id, domain);
        return true;
      }catch(e){
        print(e);
        return false;
      }
    }
    return false;
  }

  void onNextPressed(BuildContext context, String id, String domain) async {
    final bool isSuccess = await checkOTPCode(otpControllers.text, id, domain);

    if (!context.mounted) return;

    if (!isSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
         const SnackBar(
            content: Text('Podany kod jest niepoprawny, spróbuj ponownie')),
      );
      return;
    }

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const PolicyPage()), //TODO: Change MainPage()
      (route) => false,
    );
  }

  @override
  void dispose(){
    otpControllers.dispose();
    super.dispose();
  }
}

