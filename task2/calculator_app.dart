import 'dart:async';

class Calculator {
  final String name;
  static const Duration _networkDelay = Duration(seconds: 1, milliseconds: 500);

  Calculator(this.name);

  // Synchronous Methods
  double add(double a, double b) => a + b;
  double subtract(double a, double b) => a - b;
  double multiply(double a, double b) => a * b;
  
  double divide(double a, double b) {
    if (b == 0) throw ArgumentError('Division by zero is mathematically undefined.');
    return a / b;
  }

  /// Refined Async Computation
  Future<double> computeAsync(double a, double b, String op) async {
    // 1. Simulate the "Network Wait" first
    await Future.delayed(_networkDelay);

    // 2. Perform logic after the "latency"
    switch (op.toLowerCase().trim()) {
      case 'add':      return add(a, b);
      case 'subtract': return subtract(a, b);
      case 'multiply': return multiply(a, b);
      case 'divide':   return divide(a, b);
      default:
        throw ArgumentError('Operation "$op" is not supported.');
    }
  }

  /// Improved Display with better error formatting
  Future<void> displayResult(double a, double b, String op) async {
    try {
      // Show a "loading" state if this were a real app
      final result = await computeAsync(a, b, op);
      print('✅ $op($a, $b) = ${result.toStringAsFixed(2)}');
    } catch (e) {
      // Clean up the error message for the user
      print('❌ Error performing $op: ${e.toString().split(':').last.trim()}');
    }
  }
}

Future<void> main() async {
  final calc = Calculator('Titanium Calculator');
  print('--- ${calc.name} Starting ---');

  // We use await here to keep the console output orderly
  await calc.displayResult(10, 4, 'add');
  await calc.displayResult(20, 5, 'divide');
  
  // Example of a failed operation
  await calc.displayResult(10, 0, 'divide');
  await calc.displayResult(5, 5, 'power'); // Unsupported op

  print('--- All calculations complete ---');
}
