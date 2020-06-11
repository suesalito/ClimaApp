import 'dart:io';

// Example of the Async, Await and Future variable.

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String task2result = await task2();
  task3(task2result);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String> task2() async {
  String result;
  Duration delaySecond = Duration(seconds: 2);
  await Future.delayed(delaySecond, () {
    sleep(delaySecond);
    result = 'Task 2 Data.';
    //result = 2;
    print('Task 2 complete');
  });
  return result;
}

void task3(String task2Data) {
  String result = 'task 3 data';
  print('Task 3 complete with $task2Data');
}
