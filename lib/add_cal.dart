num add(String numbers) {
  if (numbers.trim().isEmpty) return 0;

  List<String> delimiters = [',', '\n']; // default delimiters
  String numSection = numbers.trim();

  // Detect custom delimiter format
  if (numSection.startsWith('//')) {
    final delimiterSection = numSection.substring(2, numSection.indexOf('\n'));
    numSection = numSection.substring(numSection.indexOf('\n') + 1).trim();

    // Check for multiple delimiters in square brackets
    final delimiterPattern = RegExp(r'\[(.*?)\]');
    final matches = delimiterPattern.allMatches(delimiterSection);

    if (matches.isNotEmpty) {
      delimiters.addAll(matches.map((m) => RegExp.escape(m.group(1)!)));
    } else {
      // Single character delimiter without brackets
      delimiters.add(RegExp.escape(delimiterSection));
    }
  }

  // Build regex pattern for splitting numbers, allowing spaces around them
  final splitPattern = RegExp(delimiters.join('|'));

  // Split & clean whitespace
  final numList = numSection
      .split(splitPattern)
      .map((e) => e.trim())
      .where((e) => e.isNotEmpty);

  // Convert to num (to support int & double)
  final parsedNumbers = numList.map(num.parse).toList();

  // Check for negatives
  final negatives = parsedNumbers.where((n) => n < 0).toList();
  if (negatives.isNotEmpty) {
    throw Exception('Negatives not allowed: ${negatives.join(', ')}');
  }

  // Ignore numbers greater than 1000
  return parsedNumbers.where((n) => n <= 1000).fold<num>(0, (a, b) => a + b);
}
