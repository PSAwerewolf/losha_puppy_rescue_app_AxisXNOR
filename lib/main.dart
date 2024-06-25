import 'package:flutter/material.dart';
import 'package:losha_puppy_rescue_app/forgot_password.dart';
import 'package:losha_puppy_rescue_app/SignUp.dart';
import 'package:losha_puppy_rescue_app/adminpage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:losha_puppy_rescue_app/home.dart';

final _formKeyMain = GlobalKey<FormState>();

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController _emailTEC = TextEditingController();
  TextEditingController _passwordTEC = TextEditingController();

  Future<String> _login(String emailPHP, String passwordPHP) async {
    //var url = Uri.parse("http://192.168.8.153/Flutter_demoApp/login.php");
    var url = Uri.parse("http://192.168.1.101/Flutter_demoApp/login.php");

    final response = await http
        .post(url, body: {'Email': emailPHP, 'Password': passwordPHP});
    var dataReceived = await json.decode(response.body);
    if (dataReceived['account'] == "Admin") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AdminPage()));
    }
    if (dataReceived['account'] == "User") {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                  firstName: "",
                  lastName: "",
                  email: "",
                  address: "",
                  phoneNumber: "")));
    }
    String loginState = dataReceived['status'];

    return loginState;
  }

  String? validateEmail(String? email) {
    RegExp emailRegexp = RegExp(r'^[\w.-]+@[\w-]+\.\w{2,3}(\.\w{2,3})?$');
    final isEmailValid = emailRegexp.hasMatch(email ?? '');
    if (!isEmailValid) {
      return 'Please Enter a Valid Email';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/Logo/puppy.png',
                height: 250,
                width: 250,
              ),
              const Text('Losha Puppy Rescue',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Form(
                    key: _formKeyMain,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextFormField(
                            controller: _emailTEC,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                labelText: 'Email',
                                hintText: 'Enter Email',
                                prefixIcon: const Icon(
                                  Icons.email,
                                  color: Colors.orange,
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.deepOrangeAccent),
                                    borderRadius: BorderRadius.circular(10.0))),
                            validator: validateEmail,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextFormField(
                            controller: _passwordTEC,
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                                labelText: 'Password',
                                hintText: 'Enter Password',
                                prefixIcon: const Icon(
                                  Icons.password,
                                  color: Colors.orange,
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.deepOrangeAccent,
                                        width: 1),
                                    borderRadius: BorderRadius.circular(10.0))),
                            validator: (password) => password!.length < 3
                                ? 'Enter Name atleast 3 Character'
                                : null,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ),

                        //Forgot Password

                        Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: RawMaterialButton(
                              onPressed: () {
                                _formKeyMain.currentState!.validate();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => forgotPassword(),
                                  ),
                                );
                              },
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'forgot password?',
                                  style: TextStyle(
                                    color: Colors.blueAccent,
                                  ),
                                ),
                              ),
                            )),

                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: MaterialButton(
                            onPressed: () async {
                              var email = _emailTEC.text;
                              var password = _passwordTEC.text;

                              String loginState =
                                  await _login(email.toLowerCase(), password);
                              print(loginState);
                              if (loginState != 'Success') {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text(
                                    'Login UnSuccessful',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  backgroundColor: Colors.deepOrange,
                                ));
                              }
                            },
                            elevation: 5,
                            minWidth: double.infinity,
                            color: Colors.deepOrangeAccent,
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: const Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Are you new Here ??',
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                ),
                                Container(
                                    alignment: Alignment.center,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        const SignUp()));
                                      },
                                      child: const Text(
                                        'Sign up ',
                                        style:
                                            TextStyle(color: Colors.blueAccent),
                                      ),
                                    )),
                              ],
                            )),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
