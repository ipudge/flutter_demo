import 'opp_learn.dart';

class TestGeneric{
  void start() {
    Cache<String> cache1 = Cache();
    cache1.setItem('c', '1');
    String str1 = cache1.getItem('c');
    print(str1);

    Cache<int> cache2 = Cache();
    cache2.setItem('c', 1);
    int int1 = cache2.getItem('c');
    print(int1);

    Member<Student> member = Member(Student('', '', 16));
    print(member.fixedName());
  }
}

class Cache<T> {
  static final Map<String, Object> _cached = Map();

  void setItem(String key,T value) {
    _cached[key] = value;
  }

  T getItem(String key) {
    return _cached[key];
  }
}

class Member<T extends Person> {
  T _person;

  Member(this._person);

  String fixedName() {
    return 'fixed: ${_person.name}';
  }
}