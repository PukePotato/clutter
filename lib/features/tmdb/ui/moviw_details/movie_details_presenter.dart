import 'package:flutter/material.dart';

class MovieDetailsPresenter extends StatelessWidget {
  const MovieDetailsPresenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: const Text('Details'),
    );
  }
}
