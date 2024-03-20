num performMathOperation(num num1, num num2, [String? operation]) {
  switch (operation) {
    case 'subtraction':
      return num1 - num2;
    case 'multiplication':
      return num1 * num2;
    case 'division':
      return num1 / num2;
    default:
      return num1 + num2;
  }
}

void main() {
  print(performMathOperation(5, 3)); 
  print(performMathOperation(10, 2, 'multiplication')); 
}
