import 'package:flutter/material.dart';
import 'package:dasz_spisac/views/policy_page.dart';
import 'package:dasz_spisac/theme/theme.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:dasz_spisac/models/local_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  await Hive.initFlutter();
  await Hive.openBox('localDB');

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL'] ?? '',
    anonKey: dotenv.env['SUPABASE_PUBLIC_API'] ?? '',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,

      home: LocalModel.hasUser() ? const PolicyPage() : const PolicyPage() //TODO: Change one PolicyPage to main page PolicyPage() : MainPage()
    );
  }
}