import 'package:admin/DataRetrivers/user_preferences.dart';

final List<Future<void> Function()> tasksToRun = [
  () => syncUserDataWithApi(),
  // Add other functions here that you want to run
];

Future<void> executeTasks() async {
  print('Here');
  for (final task in tasksToRun) {
    await task();
  }
}
