import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ResetPass extends StatefulWidget {
  const ResetPass({super.key});

  @override
  State<ResetPass> createState() => _ResetPassState();
}

String? _password;
bool _hidePass = true;
var _controller = TextEditingController();
var _controller1 = TextEditingController();
var _controller2 = TextEditingController();
var _controller3 = TextEditingController();
var _controller4 = TextEditingController();
var _controller5 = TextEditingController();
var _controller6 = TextEditingController();
class _ResetPassState extends State<ResetPass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            'فصاحة',
            style: TextStyle(fontSize: 22),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'فصاحة',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.blue[600],
                    ),
                  ),
                ),
                Image.asset(
                  'assets/logo.png',
                  scale: 6,
                ),
              ],
            ),
            Text('أدخل الكود الذي تم ارساله علي حسابك الإلكتروني',
              style: TextStyle(
                height: 1.5,
                // decoration: TextDecoration.underline,
                color: Colors.blueAccent,
                fontSize: 25,
                // fontWeight: FontWeight.w100
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 50,
                    width: 40,
                    child: TextField(
                      onChanged: (value){
                        if(value.length ==1){
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      controller: _controller,
                      onTap: (){
                        _controller.clear();
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                      style: TextStyle(
                          fontSize: 16
                      ),
                      // keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        // FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 40,
                    child: TextField(
                      onChanged: (value){
                        if(value.length ==1){
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      controller: _controller1,
                      onTap: (){
                        _controller1.clear();
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                      // style: Theme.of(context).textTheme.headline6,
                      style: TextStyle(
                          fontSize: 16
                      ),
                      // keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        // FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 40,
                    child: TextField(
                      onChanged: (value){
                        if(value.length ==1){
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      controller: _controller2,
                      onTap: (){
                        _controller2.clear();
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                      style: TextStyle(
                          fontSize: 16
                      ),
                      // keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        // FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 40,
                    child: TextField(
                      onChanged: (value){
                        if(value.length ==1){
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      controller: _controller3,
                      onTap: (){
                        _controller3.clear();
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                      style: TextStyle(
                          fontSize: 16
                      ),
                      // keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        // FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 40,
                    child: TextField(
                      onChanged: (value){
                        if(value.length ==1){
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      controller: _controller4,
                      onTap: (){
                        _controller4.clear();
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                      style: TextStyle(
                          fontSize: 16
                      ),
                      // keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        // FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 40,
                    child: TextField(
                      onChanged: (value){
                        if(value.length ==1){
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      controller: _controller5,
                      onTap: (){
                        _controller5.clear();
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                      style: TextStyle(
                          fontSize: 16
                      ),
                      // keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        // FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 40,
                    child: TextField(
                      controller: _controller6,
                      onTap: (){
                        _controller6.clear();
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                      style: TextStyle(
                          fontSize: 16
                      ),
                      // keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        // FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: TextField(
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
                            text: ' الرقم السري الجديد',
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
            ),
            SizedBox(height: 20,),
            Directionality(
              textDirection: TextDirection.rtl,
              child: TextField(
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
                            text: ' تأكيد الرقم السري',
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
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){},
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
                    'تغيير كلمة السر',
                    style: TextStyle(
                        fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
