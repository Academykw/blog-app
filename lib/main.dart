import 'package:class1/core/Secret/app_secret.dart';
import 'package:class1/core/theme/theme.dart';
import 'package:class1/features/auth/data/auth_remote_data_source.dart';
import 'package:class1/features/auth/data/auth_repository_impl.dart';
import 'package:class1/features/auth/domain/user_sign_up.dart';
import 'package:class1/features/auth/presentation/auth_bloc.dart';
import 'package:class1/features/auth/presentation/pages/login_page.dart';
import 'package:class1/features/auth/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   final supaBase = await Supabase.initialize(
      url: AppSecret().superBaseUrl,
      anonKey: AppSecret().superBaseApiKey);

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) =>  AuthBloc(userSignUp: UserSignUp(AuthRepositoryImpl
        (AuthRemoteDataSourceImpl(
          supaBase.client)
        ,),),),)
    ],
    child: const MyApp(),
  ));
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
