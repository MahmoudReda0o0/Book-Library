import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:readify/Api%20Http/my_book/my_books_provider.dart';
import 'package:readify/Api%20Http/recommend/provider.dart';
import 'package:readify/Api%20Http/single%20record/get%20Category/categoryProvider.dart';
import 'package:readify/Api%20Http/single%20record/get%20profile/profileModel.dart';
import 'package:readify/Api%20Http/single%20record/get%20profile/profileProvider.dart';
import 'package:readify/Api%20Http/zzzTest/test1.dart';
import 'package:readify/Constants.dart';
import 'dart:convert';
import 'Screen.dart';

class SignIn extends StatefulWidget {
  // const SignIn({super.key});
  const SignIn({Key? key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _hidePass = true;
  bool _checked = false;

  String _email = '';
  String _password = '';

  Future<void> _login() async {
    if (_email.isEmpty || _password.isEmpty) {
      Fluttertoast.showToast(
        msg: 'Incorrect email or password',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Color.fromARGB(255, 190, 23, 23),
        textColor: Color.fromARGB(255, 255, 255, 255),
        fontSize: 20.0,
      );
      return;
    }

    // Send login request to backend
    var response = await http.post(
      Uri.parse(Constants.login_url),
      body: {'email': _email, 'password': _password},
    );
    // Check if request was successful (status code 200)
    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      String msg = responseData['message'];
      if (msg == "Success") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text("Loged In"),
              backgroundColor: Colors.green,
              duration: Duration(milliseconds: 900)),
        );
        Provider.of<ProfileProvider>(context, listen: false).getData();
        Provider.of<RecommendProvider>(context, listen: false).getData();
        Provider.of<MyBookProvider>(context, listen: false).getData();
        Provider.of<CategoryProvider>(context, listen: false)
            .getData('enim-sed-natus-rerum-asperiores');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Screen()),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Login failed'),
            backgroundColor: Colors.red,
            duration: Duration(milliseconds: 900)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Provider.of<ProfileProvider>(context, listen: false).getData();
            Provider.of<RecommendProvider>(context, listen: false).getData();
            Provider.of<MyBookProvider>(context, listen: false).getData();
            Provider.of<CategoryProvider>(context, listen: false)
                .getData('enim-sed-natus-rerum-asperiores');
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Screen(),
              ),
            );
          },
        ),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 45, vertical: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                borderSide: BorderSide(
                                    width: 1, color: Colors.blueAccent),
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
                                _password =
                                    value.trim(); // Update password variable
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
                                        _hidePass = !_hidePass;
                                      });
                                    },
                                    icon: Icon(_hidePass
                                        ? Icons.visibility
                                        : Icons.visibility_off))),
                            obscureText: _hidePass,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.values[3],
                            children: [
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
                                          _checked
                                              ? Colors.blueAccent
                                              : Colors.white),

                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(2.0),
                                      ),
                                      side: MaterialStateBorderSide.resolveWith(
                                        (states) => BorderSide(
                                            width: 2.5,
                                            color: Colors.blueAccent),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '  تذكرني',
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                              TextButton(
                                  onPressed: null,
                                  child: Text(
                                    'نسيت الرقم السري',
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.blueAccent,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w100),
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Center(
                              child: GestureDetector(
                                // onTap: () {
                                //   Navigator.pushReplacementNamed(
                                //       context, 'screen');
                                // },
                                onTap:
                                    _login, // Call _login function when tapped

                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.grey, width: 1.2),
                                    color: Colors.blueAccent,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 70, vertical: 10),
                                    child: Text(
                                      'تسجيل الدخول',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.values[3],
                            children: [
                              Text(
                                'لا تملك حساب؟',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.blueAccent),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, 'signUp');
                                  },
                                  child: Text(
                                    'قم بالتسجيل الان',
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        decoration: TextDecoration.underline,
                                        fontSize: 20),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ])),
        ),
      ),
    );
  }
}
