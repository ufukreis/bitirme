import 'package:flutter/material.dart';

class Tema {
  inputDec(String hintText, IconData icon) {
    return InputDecoration(
        hintText: hintText, border: InputBorder.none, prefixIcon: Icon(icon));
  }

  inputBoxDec() {
    return BoxDecoration(
        color: Colors.blue[100], borderRadius: BorderRadius.circular(20));
  }
 


}


