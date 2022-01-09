extension IterableExtensions<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T element) test) {
    for (var element in this) {
      if (test(element)) return element;
    }
    return null;
  }

  List<T> sorted(Comparator<T> compare) => [...this]..sort(compare);
}

extension IterableDoubleExtension on Iterable<double> {
  double get sum {
    var result = 0.0;
    for (var value in this) {
      result += value;
    }
    return result;
  }
}
