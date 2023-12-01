import 'dart:convert';

import 'package:admin/DataRetrivers/user_preferences.dart';
import 'package:admin/models/data/user_statistics.dart';
import 'package:admin/screens/main/auth/Tasks/network_functions.dart';
import 'package:admin/screens/main/constants/contants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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

  // Future<void> login(
  //     String phoneNumber, String pinCode, BuildContext context) async {
  //   if (phoneNumber == '+256704959275' && pinCode == 'admin123') {
  //     // Hardcoded values for phone number and pin code to check
  //     _isAuthenticated = true;

  //     // Update SharedPreferences for logged-in status
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     String fullName = 'Your Full Name'; // Replace with the actual full name
  //     String token = 'Your Token'; // Replace with the actual token
  //     int userId = 1; // Replace with the actual user ID

  //     prefs.setString('token', token);
  //     prefs.setString('fullName', fullName);
  //     prefs.setInt('userId', userId);
  //     prefs.setBool('_isAuthenticated', true);

  //     // Execute tasks if needed
  //     await syncUserDataWithApi();
  //     await getUserFromPrefs();

  //     notifyListeners();
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Center(
  //             child: Text(
  //           'User Logged in successfully.',
  //           style: TextStyle(
  //               fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
  //         )),
  //         backgroundColor: Colors.green, // Customize snackbar color if needed
  //       ),
  //     );
  //   } else {
  //     print('Invalid credentials provided');
  //     // Handle invalid login attempt here
  //   }
  // }

  Future<void> login(
      String phoneNumber, String pinCode, BuildContext context) async {
    print('Here');
    var connectivityResult = await (Connectivity().checkConnectivity());

    // if (connectivityResult == ConnectivityResult.none) {
    //   showNoInternetSnackBar(context); // Show the SnackBar
    //   return;
    // }

    // Perform the login process if internet is available
    final apiUrl = Uri.parse('${ApiConstants.baseUrl}/login-with-phone-code');
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    final Map<String, dynamic> data = {
      'phone': phoneNumber,
      'unique_code': pinCode,
    };

    final String encodedData = json.encode(data);

    final response = await http.post(
      apiUrl,
      body: encodedData,
      headers: headers,
    );

    if (response.statusCode == 200) {
      print('Response: ${json.decode(response.body)}');
      // Parse the response data
      final Map<String, dynamic> responseData = json.decode(response.body);
      // print('Response: $responseData');
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
      // Success

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Welcome ${userData['fname']} ${userData['lname']}.'),
          backgroundColor: Colors.green, // Customize snackbar color if needed
        ),
      );
    } else {
      // Failed login
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login failed. Check phone number and unique code.'),
          backgroundColor: Colors.red, // Customize snackbar color if needed
        ),
      );
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
