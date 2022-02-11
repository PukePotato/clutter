import 'package:flutter/material.dart';

class TmdbLandingWidget extends StatelessWidget {
  const TmdbLandingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TmdbScreen();
  }
}

class TmdbScreen extends StatefulWidget {
  const TmdbScreen({Key? key}) : super(key: key);

  @override
  State<TmdbScreen> createState() => _TmdbScreenState();
}

class _TmdbScreenState extends State<TmdbScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container'),
      ),
      body: Container(),
    );
  }
}
