int add(String numbers) {
  if (numbers.trim().isEmpty) return 0;

  String delimiter = ',';
  String numString = numbers;

  // Check for custom delimiter at start
  if (numbers.startsWith('//')) {
    final parts = numbers.split('\n');
    delimiter = parts.first.substring(2); // can be multi-char
    numString = parts.sublist(1).join('\n');
  }

  // Replace \n with delimiter for uniform splitting
  final unified = numString.replaceAll('\n', delimiter);
  final parts = unified.split(delimiter);

  var sum = 0;
  final negatives = <int>[];

  for (final p in parts) {
    final trimmed = p.trim();
    if (trimmed.isEmpty) continue;
    final value = int.parse(trimmed);

    if (value < 0) {
      negatives.add(value);
    }

    sum += value;
  }

  if (negatives.isNotEmpty) {
    throw Exception('negatives not allowed: ${negatives.join(', ')}');
  }

  return sum;
}
