import 'package:class1/core/theme/app_pallete.dart';
import 'package:class1/features/auth/presentation/auth_bloc.dart';
import 'package:class1/features/auth/presentation/pages/login_page.dart';
import 'package:class1/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:class1/features/auth/presentation/widgets/authfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SignUpPge extends StatefulWidget {
  static route() => MaterialPageRoute(
    builder: (context) => SignUpPge(),);
  const SignUpPge({super.key});

  @override
  State<SignUpPge> createState() => _SignUpPgeState();
}

class _SignUpPgeState extends State<SignUpPge> {
 final emailController = TextEditingController();
 final passwordController = TextEditingController();
 final nameController = TextEditingController();

 @override
  void dispose() {
   emailController.dispose();
   nameController.dispose();
   passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  final formKey = GlobalKey <FormState>();

  @override
  Widget build(BuildContext context) {
    //formKey.currentState!.validate();
    return  Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Sign Up.',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20,),
              AuthField(
                hintText: 'Name',
                controller: nameController,),
              const SizedBox(height: 15,),
              AuthField(
                hintText: 'Email',
                controller: emailController,),
              const SizedBox(height: 15,),
               AuthField(
                hintText: 'Password',
                controller: passwordController ,
                 passwordText: true,
                ),
              const SizedBox(height: 20,),

              AuthGradientButton(
                buttonText: 'Sign Up',
                onPressed: (){

                  if(formKey.currentState!.validate()){
                  context.read<AuthBloc>().add(AuthSignUp(
                      name:nameController.text.trim(),
                      email:emailController.text.trim(),
                      password :passwordController.text.trim())
                    ,);



                  }
                },

              ),

              const SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    SignInPge.route(),);
                },
                child: RichText(text: TextSpan(
                    text: 'Already have an account? ',
                    style: Theme.of(context).textTheme.titleMedium,
                    children:[TextSpan(
                      text: 'Sign In',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppPallete.gradient2,
                        fontWeight: FontWeight.bold,
                      ),

                    ), ]
                  )),
              ),

          
          
            ],
          ),
        ),
      ),

    );
  }
}
