int add(String numbers) {
  if (numbers.trim().isEmpty) return 0;

  String delimiter = ',';
  final delimiters = <String>[];

  // Custom delimiter(s) handling
  if (numbers.startsWith('//')) {
    final delimiterLineEnd = numbers.indexOf('\n');
    var delimiterPart = numbers.substring(2, delimiterLineEnd);

    if (delimiterPart.startsWith('[') && delimiterPart.endsWith(']')) {
      // Multiple delimiters case: split by ']['
      final rawDelimiters = delimiterPart
          .substring(1, delimiterPart.length - 1)
          .split('][');
      delimiters.addAll(rawDelimiters);
    } else {
      // Single delimiter
      delimiters.add(delimiterPart);
    }

    numbers = numbers.substring(delimiterLineEnd + 1);
  } else {
    delimiters.add(delimiter);
  }

  // Always allow newline as delimiter
  delimiters.add('\n');

  // Create regex to split by all delimiters
  final pattern = RegExp(delimiters.map(RegExp.escape).join('|'));
  final parts = numbers.split(pattern);

  final negatives = <int>[];
  var sum = 0;

  for (final p in parts) {
    final trimmed = p.trim();
    if (trimmed.isEmpty) continue;
    final value = int.parse(trimmed);

    if (value < 0) {
      negatives.add(value);
    } else if (value <= 1000) {
      sum += value;
    }
  }

  if (negatives.isNotEmpty) {
    throw Exception('Negatives not allowed: ${negatives.join(', ')}');
  }

  return sum;
}
