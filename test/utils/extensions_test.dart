import 'package:clutter/utils/extensions.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group(
    'extensions test',
    () {
      group(
        'Iterable test',
        () {
          test(
            'no match found',
            () {
              final result =
                  [1, 2, 3].firstWhereOrNull((element) => element == 4);
              expect(result, null);
            },
          );

          test(
            'one match found',
            () {
              final result =
                  [1, 2, 3].firstWhereOrNull((element) => element == 2);
              expect(result, 2);
            },
          );
        },
      );

      group(
        'sorted',
        () {
          test(
            'sorted based on the function implementations',
            () {
              expect(
                ['b', 'a', 'c'].sorted((a, b) => a.compareTo(b)),
                ['a', 'b', 'c'],
              );

              expect(
                ['5', '1', '2'].sorted((a, b) => a.compareTo(b)),
                ['1', '2', '5'],
              );
            },
          );
        },
      );

      group(
        'IterableDoubleExtensions',
        () {
          group(
            'sum',
            () {
              test(
                'sums double values',
                () {
                  expect(<double>[].sum, 0.0);
                  expect([1.1].sum, 1.1);
                  expect([0.0, 1.1, 2.2].sum, 3.3000000000000003);
                },
              );
            },
          );
        },
      );
    },
  );
}
