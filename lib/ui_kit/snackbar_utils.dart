import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> buildShowSnackBar(
  BuildContext context,
  String content,
) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        content,
        // style: Theme.of(context).textTheme.caption?.copyWith(
        //       color: Theme.of(context).colorScheme.primary,
        //     ),
      ),
      duration: const Duration(seconds: 2),
    ),
  );
}
