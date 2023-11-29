import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _showUniqueCode = false; // Track if unique code is visible or not

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('images/local_group.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Opacity(
          opacity: 0.7, // Adjust the opacity value as needed
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 35,
                ),
                Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
                  child: const Text(
                    'DigiSave VSLA Admin Platform',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w500,
                      fontSize: 50,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 400),
                      child: Form(
                        key: _formKey,
                        child: ListView(
                          shrinkWrap: true,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                              child: const Text(
                                'Sign in',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                controller: _usernameController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Phone Number',
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your username';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: TextFormField(
                                obscureText:
                                    !_showUniqueCode, // Toggle obscureText based on visibility
                                controller: _passwordController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Unique Code',
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _showUniqueCode
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _showUniqueCode =
                                            !_showUniqueCode; // Toggle visibility
                                      });
                                    },
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(height: 16),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    String username = _usernameController.text;
                                    String password = _passwordController.text;
                                    Provider.of<AuthProvider>(context,
                                            listen: false)
                                        .login(username, password, context);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors
                                      .green, // Change this to the desired color
                                  minimumSize: Size(200,
                                      50), // Adjust the width and height as needed
                                ),
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
