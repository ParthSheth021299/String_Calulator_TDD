int add(String numbers) {
  //handles empty string or whitespace-only string
  if (numbers.trim().isEmpty) return 0;

  // Replace newlines with commas so we can split uniformly
  numbers = numbers.replaceAll('\n', ',');

  final parts = numbers.split(',');
  var sum = 0;

  for (final p in parts) {
    final trimmed = p.trim();
    if (trimmed.isEmpty) continue; // skip empty entries
    sum += int.tryParse(trimmed) ?? 0; // safe parsing
  }

  return sum;
}
