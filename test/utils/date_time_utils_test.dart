import 'package:clutter/utils/date_time_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'DateTimeUtils parse data test',
    () {
      /// Step 1: Create an instance of the class you want to test
      /// Step 2: Refactor to write the code, in our case, getDate method
      final date = DateTimeUtils.getDate('2022-01-01');

      /// Step 3: Assert the expectation
      expect(date?.year, 2022);
    },
  );

  test(
    'DateTimeUtils get date in specific format',
    () {
      final date = DateTimeUtils.getLocaleDate(DateTime(2022, 01, 01));
      expect(date, 'January 01, 2022');
    },
  );

  test(
    'DateTimeUtils exception test',
    () {
      expect(DateTimeUtils.getDate('2021-08-ab'), null);
    },
  );
}
