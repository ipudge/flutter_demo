class TestFunc {
  FunctionLearn functionLearn = FunctionLearn();
  void start() {
    print(functionLearn.sum(1, 2));
    functionLearn._print();
    functionLearn.haha();
  }
}

class FunctionLearn {
  int sum(int val1, int val2) {
    return val1 + val2;
  }

  _print() {
    print('123');
  }

  haha() {
    List list = ['haha', 886];
    list.forEach((e){
      print('e $e');
    });
  }
}
