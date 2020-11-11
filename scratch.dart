import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  int task2Result = await task2() ;
 // print( task2());
  task3(task2Result);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<int> task2() async {

  Duration threeSeconds = Duration(seconds: 3);
  // sleep(threeSeconds);

  int result;
  await Future.delayed(threeSeconds,(){
  result = 100;
  print('Task 2 complete');
  });

  return result;

}

void task3(int tast2Result) {
  String result = 'task 3 data';
  print('Task 3 complete $tast2Result');
}