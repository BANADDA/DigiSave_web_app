import 'dart:convert';

import 'package:admin/DataRetrivers/user_preferences.dart';
import 'package:admin/models/data/user_statistics.dart';
import 'package:admin/screens/main/auth/Tasks/network_functions.dart';
import 'package:admin/screens/main/constants/contants.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity/connectivity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  // void login(String username, String password) {
  //   if (username.isNotEmpty && password.isNotEmpty) {
  //     _isAuthenticated = true;
  //     notifyListeners();
  //   }
  // }

  Future<void> login(String phoneNumber, String pinCode) async {
    print('Here');
    var connectivityResult = await (Connectivity().checkConnectivity());

    // if (connectivityResult == ConnectivityResult.none) {
    //   showNoInternetSnackBar(context); // Show the SnackBar
    //   return;
    // }

    // Perform the login process if internet is available
    final apiUrl = Uri.parse('${ApiConstants.baseUrl}/login-with-phone-code/');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({'phone': phoneNumber, 'unique_code': pinCode});
    final Map<String, String> data = {
      'phone': phoneNumber,
      'unique_code': pinCode,
    };
    print('JSON: :$body');
    print('Here');

    final response = await http.post(apiUrl, body: data);

    if (response.statusCode == 200) {
      // Parse the response data
      final Map<String, dynamic> responseData = json.decode(response.body);
      print('Response: $responseData');
      Map<String, dynamic> userData = responseData['user'];

      String token = responseData['Token'];
      String code = userData['unique_code'];
      int userId = userData['id'];
      print('First Name: ${userData['fname']}');
      print('Last Name: ${userData['lname']}');
      print('User token: $token');

      // Assuming your API response has a key 'isAdmin' indicating admin status
      bool isAdmin = responseData['is_admin'] ?? false;

      if (isAdmin) {
        // Get admin
        _isAuthenticated = true;
        String fullName = '${userData['fname']} ${userData['lname']}';
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', token);
        prefs.setString('fullName', fullName);
        prefs.setInt('userId', userData['id']);
        prefs.setBool('_isAuthenticated', true);
        // Execute tasks
        await syncUserDataWithApi();
        await getUserFromPrefs();
      } else {
        print('You are not an admin');
      }
      notifyListeners();
    } else {
      // Handle errors or display appropriate messages
      print('Failed to log in. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }

  Future<void> checkLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool loggedIn = prefs.getBool('_isAuthenticated') ?? false;
    _isAuthenticated = loggedIn;
    notifyListeners();
  }

  Future<void> logout() async {
    _isAuthenticated = false;

    // Clear user details from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    prefs.remove('fullName');
    prefs.remove('userId');
    prefs.remove('user_data');
    prefs.setBool('_isAuthenticated', false);
    notifyListeners();
  }
}
