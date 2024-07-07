import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:keepnotes/service/auth_service.dart';
import 'package:keepnotes/view/home_screen.dart';
import 'package:keepnotes/view/phone_otppage.dart';
import 'package:keepnotes/view/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Colors.white),
              ),
              const Gap(13),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
                obscureText: true,
                style: const TextStyle(color: Colors.white),
              ),
              const Gap(20),
              ElevatedButton(
                onPressed: () => loginEmail(context),
                child: const Text('Login'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PhoneOtpPage(),
                  ));
                },
                child: const Text('Login with Phone'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RegisterScreen(),
                      ));
                    },
                    child: const Text('Create New Account'),
                  ),
                  InkWell(
                    onTap: () {
                      AuthService().signInWithGoogle(context);
                    },
                    child: Container(
                      height: 50,
                      margin: const EdgeInsets.only(left: 10.0),
                      child: const Image(
                        image: NetworkImage(
                            "https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png"),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loginEmail(BuildContext context) async {
    AuthService auth = AuthService();
    String email = emailController.text;
    String password = passwordController.text;

    User? user = await auth.loginAuth(email, password, context);

    if (user != null) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed. Please try again.')),
      );
    }
  }
}
