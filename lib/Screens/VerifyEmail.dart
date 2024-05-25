import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var _controller = TextEditingController();
var _controller1 = TextEditingController();
var _controller2 = TextEditingController();
var _controller3 = TextEditingController();
var _controller4 = TextEditingController();
var _controller5 = TextEditingController();
var _controller6 = TextEditingController();
class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            'فصاحة',
            style: TextStyle(fontSize: 22),
          ),
        ),
      ),
   //   backgroundColor: Colors.black12,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
                height: 2,
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
                    'تأكيد الحساب',
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
