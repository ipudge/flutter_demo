class Person {
  String name;
  int age;
  Person(this.name, this.age);

  @override
  String toString() {
    // TODO: implement toString
    return 'name: $name age: $age';
  }
}

class Student extends Person {
  String _school;
  String city;
  String country;
  String name;
  Student(this._school, name, int age, {this.city, this.country = 'China'})
      : name = '$country.$city',
        super(name, age) {
    print('123');
  }
  String get school => _school;

  set school(String val) {
    _school = val;
  }

  static doPrint(String msg) {
    print(msg);
  }

  @override
  String toString() {
    return 'name: $name school: $_school age: $age';
  }
  
  Student.cover(Student stu) : super(stu.name, stu.age);

  factory Student.stu(Student stu) {
    return Student(stu._school, stu.name, stu.age);
  }
}

class Logger {
  static Logger _cache;

  factory Logger() {
    if (_cache == null) {
      _cache = Logger._internal();
    }
    return _cache;
  }

  Logger._internal();

  void log(String msg) {
    print(msg);
  }
}

abstract class Study{
  void study(); 
}

class StudyFlutter extends Study{
  @override
  void study() {
    // TODO: implement study
    print('StudyFlutter');
  }
}

class Test extends Person with Study{
  Test(String name, int age) : super(name, age);

  @override
  void study() {
    // TODO: implement study
  }
  
}
