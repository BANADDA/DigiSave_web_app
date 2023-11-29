import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

// Function to calculate age from the date of birth
int calculateAge(DateTime birthDate) {
  final now = DateTime.now();
  final difference = now.difference(birthDate).inDays;
  return (difference ~/ 365.25).toInt();
}

Future<Map<String, int>> getUserStatistics() async {
  final prefs = await SharedPreferences.getInstance();
  final userData = prefs.getString('user_data');
  final Map<String, int> statistics = {
    'totalUsers': 0,
    'maleUsers': 0,
    'femaleUsers': 0,
    'otherGenderUsers': 0,
    'pwdYesUsers': 0,
  };

  if (userData != null) {
    final Map<String, dynamic> userMap = json.decode(userData);
    final List<dynamic>? users = userMap['users'];

    if (users != null && users.isNotEmpty) {
      statistics['totalUsers'] = users.length;

      for (final user in users) {
        final String? gender = user['sex']?.toString().toLowerCase();
        final bool pwdStatus = user['pwd_status'] == 'Yes';

        if (gender != null) {
          if (gender == 'male') {
            statistics['maleUsers'] = (statistics['maleUsers'] ?? 0) + 1;
          } else if (gender == 'female') {
            statistics['femaleUsers'] = (statistics['femaleUsers'] ?? 0) + 1;
          } else {
            statistics['otherGenderUsers'] =
                (statistics['otherGenderUsers'] ?? 0) + 1;
          }
        }

        final String? dobString = user['date_of_birth'] as String?;

        if (dobString != null) {
          final DateFormat formatter = DateFormat('yyyy-MM-dd');
          final DateTime dob = formatter.parse(dobString);

          final int age = calculateAge(dob);

          if (age >= 18 && age <= 35) {
            // Assuming youths are between 18 and 35 years old
            statistics['numberOfYouths'] =
                (statistics['numberOfYouths'] ?? 0) + 1;
          }
        }

        if (pwdStatus != null && pwdStatus) {
          statistics['pwdYesUsers'] = (statistics['pwdYesUsers'] ?? 0) + 1;
        }
      }

      print('Total Users: ${statistics['totalUsers']}');
      print('Male Users: ${statistics['maleUsers']}');
      print('Female Users: ${statistics['femaleUsers']}');
      print('Other Gender Users: ${statistics['otherGenderUsers']}');
      print('PWD Yes Users: ${statistics['pwdYesUsers']}');
    } else {
      print('No users found');
    }
  } else {
    print('User data is null');
  }

  return statistics;
}
