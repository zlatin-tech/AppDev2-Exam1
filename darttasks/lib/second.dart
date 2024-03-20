int calculateFactorial(int number, int Function(int) factorialFunction) {
  return factorialFunction(number);
}

int factorial(int number) {
  if (number <= 1) return 1;
  return number * factorial(number - 1);
}

void main() {
  int input = 5;
  int result = calculateFactorial(input, factorial);
  print(result); // Output: 120
}
