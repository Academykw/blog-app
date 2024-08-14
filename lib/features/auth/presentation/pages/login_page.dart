import 'package:class1/core/theme/app_pallete.dart';
import 'package:class1/features/auth/presentation/pages/signup_page.dart';
import 'package:class1/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:class1/features/auth/presentation/widgets/authfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class SignInPge extends StatefulWidget {
  static route() => MaterialPageRoute(
    builder: (context) => SignInPge(),);

  const SignInPge({super.key});

  @override
  State<SignInPge> createState() => _SignInPgeState();
}

class _SignInPgeState extends State<SignInPge> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  @override
  void dispose() {
    emailController.dispose();

    passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  final formKey = GlobalKey <FormState>();

  @override
  Widget build(BuildContext context) {
    //formKey.currentState!.validate();
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Sign In.',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30,),
              SizedBox(height: 15,),
              AuthField(
                hintText: 'Email',
                controller: emailController,),
              SizedBox(height: 15,),
              AuthField(
                hintText: 'Password',

                controller: passwordController ,
                passwordText: true,
              ),
              const SizedBox(height: 20,),
              AuthGradientButton(
                buttonText: 'Sign In',),

              const SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      SignUpPge.route(),);
                },
                child: RichText(text: TextSpan(
                    text: 'Don\'t have an account? ',
                    style: Theme.of(context).textTheme.titleMedium,
                    children:[TextSpan(
                      text: 'Sign Up',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppPallete.gradient2,
                        fontWeight: FontWeight.bold,
                      ),

                    ), ]
                )),
              )


            ],
          ),
        ),
      ),

    );
  }
}

