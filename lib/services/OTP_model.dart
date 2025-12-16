import 'package:supabase_flutter/supabase_flutter.dart' hide User;

class OtpModel {
  final supabase = Supabase.instance.client;

    Future<void> sendCode(String id, String domain) async {
      final emailAddress = '${id}${domain}';
      try{
        await supabase.auth.signInWithOtp(email: emailAddress);
      }catch(e){
        print(e);
        rethrow;
      }
    }

    Future<void> verifyCode(String user_token, String id, String domain) async{
      final emailAddress = '${id}${domain}';
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