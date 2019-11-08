void main() {
  List list;
  print(list?.length);

  print(list?.length ?? -1);

  if ([null, 0, ''].contains(list[0])) {
    print('list[0] is empty');
  }
}