import 'package:class1/core/Secret/app_secret.dart';
import 'package:class1/core/theme/theme.dart';
import 'package:class1/features/auth/presentation/pages/login_page.dart';
import 'package:class1/features/auth/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   final supaBase = await Supabase.initialize(
      url: AppSecret().superBaseUrl,
      anonKey: AppSecret().superBaseApiKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'APP ONE',
     theme: AppTheme.darkThemeMode,

      home: SignInPge(),
    );
  }
}
