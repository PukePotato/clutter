import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> buildShowSnackBar(
  BuildContext context,
  String content,
) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      content: Text(
        content,
        style: Theme.of(context).textTheme.caption?.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
      ),
      duration: const Duration(seconds: 2),
    ),
  );
}
