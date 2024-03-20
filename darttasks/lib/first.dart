void main() {
  List<int> inputList = [1, 12, 3, 14, 5, 6, 7, 8, 9, 10, 2];
  List<int> evenSorted = inputList.where((number) => number % 2 == 0).toList()..sort();
  print(evenSorted);
}
