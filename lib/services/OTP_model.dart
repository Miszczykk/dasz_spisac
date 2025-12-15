import 'package:supabase_flutter/supabase_flutter.dart' hide User;
import 'package:dasz_spisac/models/user.dart';


class OtpModel {
  final supabase = Supabase.instance.client;

    Future<void> sendCode() async {
      final emailAddress = '${User.userData!.id}${User.userData!.domain}';
      try{
        await supabase.auth.signInWithOtp(email: emailAddress);
      }catch(e){
        print(e);
        rethrow;
      }
    }

    Future<void> verifyCode(String user_token) async{
      final emailAddress = '${User.userData!.id}${User.userData!.domain}';
      try{
        await supabase.auth.verifyOTP(
          type: OtpType.magiclink,
          token: user_token,
          email: emailAddress,
        );
      }catch(e){
        print(e);
        rethrow;
      }
    }

}