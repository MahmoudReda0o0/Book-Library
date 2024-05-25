import 'package:flutter/material.dart';

class Button {
  static buttonCustom(VoidCallback callBack, String text) {
    return Center(
        child: Padding(
      padding: EdgeInsets.all(30),
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
            onPressed: () {
              callBack();
            },
            child: Text(text)),
      ),
    ));
  }
}
