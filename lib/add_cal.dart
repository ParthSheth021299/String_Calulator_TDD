int add(String numbers) {
  if (numbers.trim().isEmpty) return 0;

  String delimiterPattern = '[,\n]'; // default delimiters: comma or newline
  String numberString = numbers;

  // Check for custom delimiter at the start
  if (numbers.startsWith('//')) {
    final delimiterEndIndex = numbers.indexOf('\n');
    if (delimiterEndIndex != -1) {
      final customDelimiter = numbers.substring(
        2,
        delimiterEndIndex,
      ); // e.g., ";"
      delimiterPattern = RegExp.escape(customDelimiter);
      numberString = numbers.substring(delimiterEndIndex + 1);
    }
  }

  final parts = numberString.split(RegExp(delimiterPattern));
  var sum = 0;

  for (final p in parts) {
    final trimmed = p.trim();
    if (trimmed.isEmpty) continue;
    sum += int.parse(trimmed);
  }

  return sum;
}
