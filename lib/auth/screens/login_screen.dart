import 'package:flutter/material.dart';
import 'package:reqres_flutter/auth/screens/register_screen.dart';
import 'package:reqres_flutter/common/custom_button.dart';
import 'package:reqres_flutter/common/custom_textfield.dart';
import 'package:reqres_flutter/constants/global_variable.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login-screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void toRegister() {
    Navigator.pushNamed(context, RegisterScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(
                      color: GlobalVariables.mainColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextField(
                controller: _emailController,
                hintText: 'Email',
                icon: const Icon(Icons.email),
                inputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextField(
                controller: _passwordController,
                hintText: 'Password',
                icon: const Icon(Icons.lock),
                inputType: TextInputType.visiblePassword,
                isObscureText: true,
              ),
              const SizedBox(
                height: 60,
              ),
              CustomButton(text: 'Sign in', onTap: () {}),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Dont have any account?',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  GestureDetector(
                    onTap: toRegister,
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color: GlobalVariables.mainColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
