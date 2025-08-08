int add(String numbers) {
  // Handles empty or whitespace-only string
  if (numbers.trim().isEmpty) return 0;

  String delimiter = ',';

  // Support custom delimiter syntax: //;\n1;2
  if (numbers.startsWith('//')) {
    final delimiterLineEnd = numbers.indexOf('\n');
    delimiter = numbers.substring(2, delimiterLineEnd);
    numbers = numbers.substring(delimiterLineEnd + 1);
  }

  // Replace new lines with delimiter and split
  final parts = numbers.replaceAll('\n', delimiter).split(delimiter);

  var negatives = <int>[];
  var sum = 0;

  for (final p in parts) {
    final trimmed = p.trim();
    if (trimmed.isEmpty) continue;

    final numValue = int.parse(trimmed);

    if (numValue < 0) {
      negatives.add(numValue);
    } else if (numValue <= 1000) {
      sum += numValue; // ✅ ignore numbers > 1000
    }
  }

  if (negatives.isNotEmpty) {
    throw Exception('negatives not allowed: ${negatives.join(', ')}');
  }

  return sum;
}
