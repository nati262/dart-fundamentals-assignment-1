import 'dart:math' as math;

/// Task 1: Number Analysis App
/// Name: Markos Tigistu
/// Refined Version: Includes safety checks and idiomatic Dart syntax.

// Returns the largest number; returns 0 if list is empty
int findMax(List<int> numbers) {
  if (numbers.isEmpty) return 0;
  // .reduce compares elements and returns the one that matches the criteria
  return numbers.reduce(math.max);
}

// Returns the smallest number; returns 0 if list is empty
int findMin(List<int> numbers) {
  if (numbers.isEmpty) return 0;
  return numbers.reduce(math.min);
}

// Calculates total sum using .fold (starts at 0 and adds each element)
int calculateSum(List<int> numbers) {
  return numbers.fold(0, (previousValue, element) => previousValue + element);
}

// Calculates average; handles empty list to avoid division by zero
double calculateAverage(List<int> numbers) {
  if (numbers.isEmpty) return 0.0;
  return calculateSum(numbers) / numbers.length;
}

void main() {
  // Sample data
  final numbers = <int>[34, -7, 89, 12, -45, 67, 3, 100, -2, 55];

  // Execution
  int maxValue = findMax(numbers);
  int minValue = findMin(numbers);
  int sum = calculateSum(numbers);
  double average = calculateAverage(numbers);

  // Output Formatting
  print('Number Analysis Results');
  print('========================');
  print('Numbers: $numbers');
  print('Maximum value : $maxValue');
  print('Minimum value : $minValue');
  print('Sum           : $sum');
  // toStringAsFixed(2) limits the decimal places for a cleaner look
  print('Average       : ${average.toStringAsFixed(2)}');
}
