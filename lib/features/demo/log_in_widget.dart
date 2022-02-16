import 'package:clutter/features/demo/sign_up_widget.dart';
import 'package:flutter/material.dart';

class LogInWidget extends StatelessWidget {
  const LogInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Log In")),
      body: _buildSignUpScreenWidget(context),
    );
  }

  _buildSignUpScreenWidget(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Text("Log in with one of the following options"),
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
            const Text("Dont have an account?"),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpWidget()),
                  );
                },
                child: const Text("Sign Up")),
          ],
        ),
        ElevatedButton(
          onPressed: () => throw UnimplementedError(),
          child: const Text('Log in'),
        ),
      ],
    );
  }
}
