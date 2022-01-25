import 'package:flutter/material.dart';

@Deprecated('This function is deprecated')
TextStyle boldText(BuildContext context) => TextStyle(
      color: Theme.of(context).colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );
