import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:losha_puppy_rescue_app/home.dart';
import 'package:losha_puppy_rescue_app/main.dart';

final _formKey1 = GlobalKey<FormState>();
final _formKey2 = GlobalKey<FormState>();
final _formKey3 = GlobalKey<FormState>();
final _formKey4 = GlobalKey<FormState>();
final _formKey5 = GlobalKey<FormState>();
final _formKey6 = GlobalKey<FormState>();
final _formKey7 = GlobalKey<FormState>();
final _formKey8 = GlobalKey<FormState>();
final _formKey9 = GlobalKey<FormState>();

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? validateEmail(String? email) {
    RegExp emailRegexp = RegExp(r'^[\w\.-]+@[\w-]+\.\w{2,3}(\.\w{2,3})?$');
    final isEmailValid = emailRegexp.hasMatch(email ?? '');
    if (!isEmailValid) {
      return 'Please Enter a Valid Email';
    }
    return null;
  }

  String groupValue = "Not to Prefer";
  String selectOption = "Non";
  List itemList = ['Non', '<5', '<20', 'More than 20'];
  bool? isChecked = false;
  File? _selectedImage;

  TextEditingController _fName = TextEditingController();
  TextEditingController _lName = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _cpassword = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.orange,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MyApp()));
                },
              ),
              title: const Text(
                'Sign up',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              )),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.blue, width: 5),
                                borderRadius: BorderRadius.circular(100)),
                            child: Column(
                              children: [
                                _selectedImage != null
                                    ? ClipOval(
                                        child: Image.file(
                                          _selectedImage!,
                                          height: 140,
                                          width: 140,
                                          fit: BoxFit.fill,
                                        ),
                                      )
                                    : Center(
                                        child: const Text('No image Selected')),
                              ],
                            )),
                        ElevatedButton.icon(
                            onPressed: () {
                              _pickImageFromGallery();
                            },
                            icon: const Icon(Icons.add_a_photo),
                            label: const Text('Photo'))
                      ],
                    ),
                  ),
                  Form(
                    key: _formKey1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        controller: _fName,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.abc,
                              color: Colors.orange,
                            ),
                            hintText: 'First Name',
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Colors.orange, width: 2))),
                        validator: (name) => name!.length < 3
                            ? 'Enter Name atleast 3 Character'
                            : null,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ),
                  ),
                  Form(
                    key: _formKey2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        controller: _lName,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.abc,
                              color: Colors.orange,
                            ),
                            hintText: 'Last Name',
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Colors.orange, width: 2))),
                        validator: (name) => name!.length < 3
                            ? 'Enter Name atleast 3 Character'
                            : null,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ),
                  ),
                  Form(
                    key: _formKey3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        controller: _address,
                        keyboardType: TextInputType.streetAddress,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.paste,
                              color: Colors.orange,
                            ),
                            hintText: 'Address',
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Colors.orange, width: 2))),
                        validator: (name) => name!.length < 3
                            ? 'Enter Name atleast 3 Character'
                            : null,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ),
                  ),
                  Form(
                    key: _formKey4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        controller: _phoneNumber,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.phone,
                              color: Colors.orange,
                            ),
                            hintText: 'Phone Number',
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Colors.orange, width: 2))),
                        validator: (phoneNumber) =>
                            phoneNumber!.length < 10 || phoneNumber!.length > 10
                                ? 'Enter a Valid Phone Number'
                                : null,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ),
                  ),
                  Form(
                    key: _formKey5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(children: [
                        const Text(
                          'Gender :',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.orangeAccent),
                        ),
                        Radio(
                            value: "Male",
                            groupValue: groupValue,
                            onChanged: (value) {
                              setState(() {
                                groupValue = value!;
                              });
                            }),
                        const Text(
                          'Male',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: Colors.black),
                        ),
                        Radio(
                            value: "Female",
                            groupValue: groupValue,
                            onChanged: (value) {
                              setState(() {
                                groupValue = value!;
                              });
                            }),
                        const Text(
                          'Female',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: Colors.black),
                        ),
                        Radio(
                            value: "Not to Prefer",
                            groupValue: groupValue,
                            onChanged: (value) {
                              setState(() {
                                groupValue = value!;
                              });
                            }),
                        const Text(
                          'Not to Prefer',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: Colors.black),
                        )
                      ]),
                    ),
                  ),
                  Form(
                    key: _formKey6,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Volunteer Experience',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.orange),
                          ),
                          DropdownButton(
                            hint: const Text('Select Option'),
                            dropdownColor: Colors.orangeAccent[100],
                            iconSize: 36,
                            style: const TextStyle(color: Colors.black54),
                            value: selectOption,
                            onChanged: (newValue) {
                              setState(() {
                                selectOption = newValue.toString();
                              });
                            },
                            items: itemList.map((valueItem) {
                              return DropdownMenuItem(
                                value: valueItem,
                                child: Text(valueItem),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Form(
                    key: _formKey7,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        controller: _email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Colors.orange,
                            ),
                            hintText: 'Email',
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Colors.orange, width: 2))),
                        validator: validateEmail,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ),
                  ),
                  Form(
                    key: _formKey8,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        controller: _password,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.password,
                              color: Colors.orange,
                            ),
                            hintText: 'Password',
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Colors.orange, width: 2))),
                      ),
                    ),
                  ),
                  Form(
                    key: _formKey9,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        controller: _cpassword,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.password_outlined,
                              color: Colors.orange,
                            ),
                            hintText: 'Confirm Password',
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Colors.orange, width: 2))),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Checkbox(
                            value: isChecked,
                            activeColor: Colors.blueAccent,
                            onChanged: (newBool) {
                              setState(() {
                                isChecked = newBool;
                              });
                            }),
                      ),
                      const Text('Agree to Privacy and Policy')
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(15),
                          backgroundColor: Colors.deepOrangeAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          minimumSize:
                              const Size(double.maxFinite, double.minPositive)),
                      child: const Text(
                        'Sign up',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      onPressed: () {
                        var firstName = _fName.text;
                        var lastName = _lName.text;
                        var address = _address.text;
                        var email = _email.text;
                        var password = _password.text;
                        var confirmPassword = _cpassword.text;
                        var pNumber = _phoneNumber.text;

                        print(password);
                        print(confirmPassword);

                        validator:
                        validateEmail;
                        autovalidateMode:
                        AutovalidateMode.onUserInteraction;

                        if ((firstName.isNotEmpty ||
                                lastName.isNotEmpty ||
                                address.isNotEmpty ||
                                email.isNotEmpty ||
                                password.isNotEmpty ||
                                confirmPassword.isNotEmpty) &&
                            (password == confirmPassword)) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => home(
                                      firstName: firstName,
                                      lastName: lastName,
                                      email: email,
                                      address: address,
                                      phoneNumber: pNumber)));
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Future _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage!.path);
    });
  }
}
