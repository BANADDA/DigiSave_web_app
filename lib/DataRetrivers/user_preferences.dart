import 'dart:convert';
import 'package:admin/screens/main/constants/contants.dart';
import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> checkInternetConnectivity() async {
  var connectivityResult = await Connectivity().checkConnectivity();
  return connectivityResult != ConnectivityResult.none;
}

Future<void> saveUserToPrefs(Map<String, dynamic> userData) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('user_data', json.encode(userData));
}

Future<Map<String, dynamic>?> getUserFromPrefs() async {
  final prefs = await SharedPreferences.getInstance();
  final userData = prefs.getString('user_data');
  if (userData != null) {
    // print('User data: $userData');
    return json.decode(userData);
  } else {
    print('User data is null');
    return null;
  }
}

Future<void> getUsers(String retrieveEndpoint, String token) async {
  final serverDataResponse = await http.get(
    Uri.parse(retrieveEndpoint),
    headers: {
      'Authorization': 'Token $token',
      'Content-Type': 'application/json',
    },
  );
  // print('Response data: ${serverDataResponse.body}');
  if (serverDataResponse.statusCode == 200) {
    final Map<String, dynamic> responseData =
        json.decode(serverDataResponse.body);

    // Extract the 'users' part from the response data
    final List<dynamic>? users = responseData['users'];
    // print('Users: $users');
    print('All users $users');

    if (users != null && users.isNotEmpty) {
      // Save user data to SharedPreferences
      await saveUserToPrefs({'users': users}); // Save the 'users' part
      final userData = await getUserFromPrefs(); // Retrieve and store the data
      if (userData != null) {
        // print('User data retrieved: $userData');
      } else {
        print('User data is null');
      }
    }
  }
}

Future<void> syncUserDataWithApi() async {
  print('Getting admin');
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
  print('Token get data: $token');

  if (await checkInternetConnectivity()) {
    final userEndpoint = '${ApiConstants.baseUrl}/users/';

    try {
      if (token != null) {
        getUsers(userEndpoint, token);
      }
    } catch (e) {
      print('Error getting user data: $e');
    }
  }
}
