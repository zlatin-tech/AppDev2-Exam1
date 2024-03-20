Future<void> analyzeList(List<int> numbers) async {
  await Future.delayed(Duration(seconds: 1)); 
  int largest = numbers.reduce((curr, next) => curr > next ? curr : next);
  int smallest = numbers.reduce((curr, next) => curr < next ? curr : next);
  int sum = numbers.reduce((curr, next) => curr + next);
  int countEven = numbers.where((number) => number % 2 == 0).length;
  int countOdd = numbers.length - countEven;

  print('Largest: $largest, Smallest: $smallest, Sum: $sum, Count of Even: $countEven, Count of Odd: $countOdd');
}

void main() {
  List<int> inputList = [1, 12, 3, 14, 5, 6, 7, 8, 9, 10, 2];
  analyzeList(inputList);
}
