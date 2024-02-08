import 'package:flutter/material.dart';
import 'package:services_mo/services/auth.dart';


class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/ebubble.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Add your sign-in UI elements here
            // For example, TextFields, Buttons, etc.
            // Example:
            const TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                filled: true,
                fillColor: Colors.white,
              ),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () async {
                dynamic result = await _auth.signInAnon();
                if (result == null){
                  print('error signing in');
                }  else{
                  print('signed in');
                  print(result);
                }

              },
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
