import 'package:flutter/material.dart';

class DemoLandingWidget extends StatelessWidget {
  const DemoLandingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildScreenWidget(context),
    );
  }

  _buildScreenWidget(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () => throw UnimplementedError(),
              child: const Text('OTP Login Page'),
              style: ElevatedButton.styleFrom(
                onPrimary: Theme.of(context).colorScheme.onPrimary,
                textStyle: Theme.of(context).textTheme.button,
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                side: BorderSide(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => throw UnimplementedError(),
              child: const Text('Planets Animation'),
              style: ElevatedButton.styleFrom(
                onPrimary: Theme.of(context).colorScheme.onPrimary,
                textStyle: Theme.of(context).textTheme.button,
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                side: BorderSide(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            OutlinedButton(
              onPressed: null,
              child: Text('Title Button'),
            ),
            OutlinedButton(
              onPressed: null,
              child: Text('Test Button'),
            ),
          ],
        ),
      ],
    );
  }
}
