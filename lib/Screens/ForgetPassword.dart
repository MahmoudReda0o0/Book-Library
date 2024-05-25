import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'فصاحة',
              style: TextStyle(fontSize: 22),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 40),
            child: Column(
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
                // Text('أدخل البريد الإلكتروني المسجل به حسابك',
                //   style: TextStyle(
                //     color: Colors.blueAccent,
                //     fontSize: 18
                //   ),
                // ),
                TextField(
                  onChanged: (value) {},
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
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
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
                        'التالي',
                        style: TextStyle(
                            fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
