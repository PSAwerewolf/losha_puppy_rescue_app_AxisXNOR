import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:email_auth/email_auth.dart';
import 'package:http/http.dart' as http;
import 'package:losha_puppy_rescue_app/main.dart';

final _formKey2 = GlobalKey<FormState>();

class forgotPassword extends StatefulWidget {
  const forgotPassword({Key? key}) : super(key: key);

  @override
  State<forgotPassword> createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<forgotPassword> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _otpController = TextEditingController();

  String? validateEmail(String? email) {
    RegExp emailRegexp = RegExp(r'^[\w.-]+@[\w-]+\.\w{2,3}(\.\w{2,3})?$');
    final isEmailValid = emailRegexp.hasMatch(email ?? '');
    if (!isEmailValid) {
      return 'Please Enter a Valid Email';
    }
    return null;
  }

  Future<String> _forgotEmailChecker(String email) async {
    var url = Uri.parse("http://$ipAddress/Flutter_demoApp/forgotPassword.php");

    final response = await http.post(url, body: {'Email': email});
    var dataReceived = await json.decode(response.body);

    String dataResStatus = dataReceived['status'];
    return dataResStatus;
  }

  EmailAuth emailAuth = new EmailAuth(sessionName: "Sample session");
  void sendOTP() async {
    var res = await emailAuth.sendOtp(
        recipientMail: _emailController.text, otpLength: 4);
    if (res) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'OTP Sent Successfully',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepOrange,
      ));
    }
  }

  void verifyOTP() async {
    var res = await emailAuth.validateOtp(
        recipientMail: _emailController.text, userOtp: _otpController.text);
    if (res) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'OTP Confirmed',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepOrange,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text(
          'Forgot password',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
                  child: Text(
                    'Enter Your Email Address',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15.0, horizontal: 0),
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: "Enter Email Address",
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                        prefixIcon: const Icon(Icons.email,
                            color: Colors.deepOrangeAccent),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                const BorderSide(color: Colors.orangeAccent))),
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    validator: validateEmail,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      padding: const EdgeInsets.all(10),
                      minimumSize:
                          const Size(double.infinity, double.minPositive),
                      backgroundColor: Colors.deepOrangeAccent),
                  onPressed: () async {
                    String emailState =
                        await _forgotEmailChecker(_emailController.text);
                    print(emailState);
                    if (emailState == 'Success') {
                      sendOTP();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                          'Account Not Found',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        backgroundColor: Colors.deepOrange,
                      ));
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Send OTP',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),

                // OTP Value

                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15.0, horizontal: 0),
                  child: TextFormField(
                    controller: _otpController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "Enter OTP Value",
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                        prefixIcon: const Icon(Icons.numbers,
                            color: Colors.deepOrangeAccent),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                const BorderSide(color: Colors.orangeAccent))),
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                //OTP Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      padding: const EdgeInsets.all(10),
                      minimumSize:
                          const Size(double.infinity, double.minPositive),
                      backgroundColor: Colors.deepOrangeAccent),
                  onPressed: () {
                    verifyOTP();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Verify OTP',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
