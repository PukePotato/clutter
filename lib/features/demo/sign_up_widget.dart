import 'package:flutter/material.dart';
import 'log_in_widget.dart';

// what are widgets?
// What is stateless widget?
// What is stateful widget?

// Composition - Design Pattern

// Class
// - is a definition
// - is a blueprint

// class contains objects, methods and variables

// Objects - instance of a class

// method - function - manipulate objects

// variables - fields or properties

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
      body: _buildSignUpScreenWidget(context),
    );
  }

  _buildSignUpScreenWidget(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Text("Sign up with one of the following options"),
          ],
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.bluetooth),
              iconSize: 100,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.bluetooth),
              iconSize: 100,
              onPressed: () {},
            ),
          ],
        ),
        Row(
          children: const [
            Text("Name"),
          ],
        ),
        const TextField(
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
        Row(
          children: const [
            Text("Email"),
          ],
        ),
        const TextField(
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
        Row(
          children: const [
            Text("Password"),
          ],
        ),
        const TextField(
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
        Row(
          children: [
            const Text("Already have an account?"),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LogInWidget(),
                        maintainState: false),
                  );
                },
                child: const Text("Login")),
          ],
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Create Account'),
        ),
      ],
    );
  }
}
