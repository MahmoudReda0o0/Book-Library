// ignore_for_file: unused_import, unused_element, unused_local_variable
import 'dart:typed_data';

import 'package:random_name_generator/random_name_generator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:readify/Constants.dart';
import 'dart:convert';
import 'SignIn.dart';
import 'package:image_picker/image_picker.dart';

PickImage(ImageSource src) async {
  final ImagePicker _imagePicker = new ImagePicker();
  XFile? xfile = await _imagePicker.pickImage(source: src);
  if (xfile != null) {
    return await xfile.readAsBytes();
  } else
    print('no image selcted');
}

Uint8List? image;

class SignUp extends StatefulWidget {
  const SignUp({Key? key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  void SelectImage() async {
    Uint8List img = await PickImage(ImageSource.gallery);
    setState(() {
      image = img;
    });
  }

  bool _checked = false;
  bool _hidePass1 = true;
  bool _hidePass2 = true;

  String _email = '';
  String _password_1 = '';
  String _password_2 = '';

  bool _isValidEmail(String email) {
    RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  bool _isPasswordValid(String password_1, String password_2) {
    return (password_1 == password_2) && (password_1.length >= 8);
  }

// Function to register a new account on the backend
  Future<void> _registerAccount(
      String email, String password_1, String password_2) async {
    if (_isValidEmail(email) && _isPasswordValid(password_1, password_2)) {
      // random username since username is unique
      // will be edited when username field is added to register page
      var randomUser = RandomNames(Zone.egypt);
      var response = await http.post(
        Uri.parse(Constants.register_url),
        body: {
          // TODO: add first name, last name, and user name to register page
          'first_name': 'name1',
          'last_name': 'name2',
          'username': randomUser.surname(),
          'email': email,
          'password': password_1,
          'password_confirmation': password_2
        },
      );

      var responseData = json.decode(response.body);
      String msg = responseData['message'];
      //   print(response.body);
      // Check if request was successful (status code 201)
      if (response.statusCode == 201) {
        if (msg == "Success") {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text("Registered Successfully"),
                backgroundColor: Colors.green,
                duration: Duration(milliseconds: Constants.toast_time)),
          );
          Navigator.pushReplacement(
            context,
            // TODO: Navigate to verification page instead.
            MaterialPageRoute(builder: (context) => SignIn()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text('Registration Failed, Try again later'),
                backgroundColor: Colors.red,
                duration: Duration(milliseconds: Constants.toast_time)),
          );
        }
      } else if (response.statusCode == 422) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('The email has already been taken.'),
              backgroundColor: Colors.red,
              duration: Duration(milliseconds: Constants.toast_time)),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Registration Failed, Try again later'),
              backgroundColor: Colors.red,
              duration: Duration(milliseconds: Constants.toast_time)),
        );
      }
    } else {
      var msg = "Enter a valid email and password";
      if (password_1 != password_2) {
        msg = "Passwords do not match";
      }
      if (password_1.length < 8) {
        msg = "Password must be at least 8 characters long";
      }
      Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'فصاحة',
            style: TextStyle(fontSize: 22),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      scale: 6,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'فصاحة',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.blue[600],
                        ),
                      ),
                    )
                  ],
                ),
                Text(
                  'قم بإنشاء حساب',
                  style: TextStyle(
                      height: 1,
                      fontSize: 30,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w100),
                ),
                Divider(
                  color: Colors.blueGrey,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 45, vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Stack(
                          children: [
                            image != null
                                ? CircleAvatar(
                                    radius: 64,
                                    backgroundImage: MemoryImage(image!),
                                  )
                                : CircleAvatar(
                                    radius: 64,
                                    backgroundImage: NetworkImage(
                                        'https://www.shutterstock.com/image-vector/blank-avatar-photo-place-holder-600nw-1114445501.jpg'),
                                  ),
                            Positioned(
                              child: IconButton(
                                  onPressed: () {
                                    SelectImage();
                                  },
                                  icon: Icon(
                                    Icons.add_a_photo,
                                    color: Colors.blueAccent,
                                  )),
                              bottom: 5,
                              right: 0,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            _email = value; // Update email variable
                          });
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.blueGrey[100],
                          focusColor: Colors.white,
                          hoverColor: Colors.white,
                          //isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          label: RichText(
                              text: TextSpan(children: [
                            WidgetSpan(
                                child: Icon(
                              Icons.mail_outline,
                              size: 18,
                              color: Colors.blueAccent,
                            )),
                            TextSpan(
                              text: ' الإسم',
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  height: 1,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w100),
                            )
                          ])),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            _email = value; // Update email variable
                          });
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.blueGrey[100],
                          focusColor: Colors.white,
                          hoverColor: Colors.white,
                          //isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          label: RichText(
                              text: TextSpan(children: [
                            WidgetSpan(
                                child: Icon(
                              Icons.mail_outline,
                              size: 18,
                              color: Colors.blueAccent,
                            )),
                            TextSpan(
                              text: ' إسم المستخدم',
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  height: 1,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w100),
                            )
                          ])),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            _email = value; // Update email variable
                          });
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.blueGrey[100],
                          focusColor: Colors.white,
                          hoverColor: Colors.white,
                          //isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          label: RichText(
                              text: TextSpan(children: [
                            WidgetSpan(
                                child: Icon(
                              Icons.mail_outline,
                              size: 18,
                              color: Colors.blueAccent,
                            )),
                            TextSpan(
                              text: ' البريد الإلكتروني',
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  height: 1,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w100),
                            )
                          ])),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            _password_1 = value; // Update email variable
                          });
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blueGrey[100],
                            focusColor: Colors.white,
                            hoverColor: Colors.white,
                            //isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            label: RichText(
                                text: TextSpan(children: [
                              WidgetSpan(
                                  child: Icon(
                                Icons.lock_rounded,
                                size: 18,
                                color: Colors.blueAccent,
                              )),
                              TextSpan(
                                text: ' الرقم السري',
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    height: 1,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w100),
                              )
                            ])),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _hidePass1 = !_hidePass1;
                                  });
                                },
                                icon: Icon(_hidePass1
                                    ? Icons.visibility
                                    : Icons.visibility_off))),
                        obscureText: _hidePass1,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            _password_2 = value; // Update email variable
                          });
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blueGrey[100],
                            focusColor: Colors.white,
                            hoverColor: Colors.white,
                            //isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            label: RichText(
                                text: TextSpan(children: [
                              WidgetSpan(
                                  child: Icon(
                                Icons.lock_rounded,
                                size: 18,
                                color: Colors.blueAccent,
                              )),
                              TextSpan(
                                text: ' أعد كتابة الرقم السري',
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    height: 1,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w100),
                              ),
                            ])),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _hidePass2 = !_hidePass2;
                                  });
                                },
                                icon: Icon(_hidePass2
                                    ? Icons.visibility
                                    : Icons.visibility_off))),
                        obscureText: _hidePass2,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 20,
                            width: 20,
                            child: Checkbox(
                              value: _checked,
                              onChanged: (value) {
                                setState(() {
                                  _checked = !_checked;
                                });
                              },
                              //checkColor: Colors.blueAccent,
                              //activeColor: Colors.red,
                              fillColor: MaterialStateProperty.all(
                                  _checked ? Colors.blueAccent : Colors.white),

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.0),
                              ),
                              side: MaterialStateBorderSide.resolveWith(
                                (states) => BorderSide(
                                    width: 2.5, color: Colors.blueAccent),
                              ),
                            ),
                          ),
                          Text(
                            '  أوافق علي الشروط',
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              if (_checked) {
                                _registerAccount(
                                    _email, _password_1, _password_2);
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: Colors.grey, width: 1.2),
                                color: Colors.blueAccent,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 70, vertical: 10),
                                child: Text(
                                  'قم بإنشاء حساب',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.values[5],
                  children: [
                    Text(
                      'تملك حساب؟',
                      style: TextStyle(fontSize: 22, color: Colors.blueAccent),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, 'signIn');
                        },
                        child: Text(
                          'تسجيل الدخول',
                          style: TextStyle(
                              color: Colors.blueAccent,
                              decoration: TextDecoration.underline,
                              fontSize: 22),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
