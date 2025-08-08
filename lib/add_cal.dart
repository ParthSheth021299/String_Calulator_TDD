int add(String numbers) {
  //handles empty string or whitespace-only string
  if (numbers.trim().isEmpty) return 0;
  final parts = numbers.split(",");
  var sum = 0;
  for (final p in parts) {
    final trimmed = p.trim();
    if (trimmed.isEmpty) continue;
    sum += int.parse(trimmed);
  }
  return sum;
}
