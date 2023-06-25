import 'package:bitirme/class/constants.dart';
import 'package:bitirme/class/tema.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isRememberMe = false;
  late String email, pass;
  final formkey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;
  Tema tema = Tema();
  bool passcheck = false;

  late Box box1;
  @override
  void initState() {
    super.initState();
    createBox();
  }

  void getdata() async {
    if (box1.get("email") != null) {
      email = box1.get("email");
      isRememberMe = true;
      setState(() {});
    }
    if (box1.get("pass") != null) {
      pass = box1.get("pass");
      isRememberMe = true;
      setState(() {});
    }
  }

  void createBox() async {
    box1 = await Hive.openBox("logindata");
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(color: Colors.blue[50]),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 70),
                    alignment: Alignment.center,
                    width: 150,
                    height: 150,
                    child: Image.asset(
                      'assets/image/meden.png',
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text('MKart',
                        style: GoogleFonts.quicksand(fontSize: 30)),
                  ),
                  Container(
                    decoration: tema.inputBoxDec(),
                    margin: EdgeInsets.only(
                        top: 30, bottom: 10, right: 30, left: 30),
                    padding:
                        EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Bilgileri Eksiksiz Doldurunuz";
                        } else {}
                      },
                      onSaved: (value) {
                        email = value!;
                      },
                      decoration: tema.inputDec("E-posta Adresinizi Girin",
                          Icons.people_alt_outlined),
                      style: GoogleFonts.quicksand(color: Colors.black),
                    ),
                  ),
                  Container(
                    decoration: tema.inputBoxDec(),
                    margin: EdgeInsets.only(
                        top: 10, bottom: 10, right: 30, left: 30),
                    padding:
                        EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Bilgileri Eksiksiz Doldurunuz";
                              } else {}
                            },
                            onSaved: (value) {
                              pass = value!;
                            },
                            obscureText: passcheck,
                            decoration: tema.inputDec(
                                "Şifrenizi Girin", Icons.vpn_key_outlined),
                            style: GoogleFonts.quicksand(color: Colors.black),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                passcheck = !passcheck;
                              });
                            },
                            icon: Icon(passcheck
                                ? Icons.remove_red_eye
                                : Icons.remove_red_eye_outlined))
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      if (formkey.currentState!.validate()) {
                        formkey.currentState!.save();
                        try {
                          final userResult =
                              await firebaseAuth.signInWithEmailAndPassword(
                                  email: email, password: pass);
                          Navigator.pushReplacementNamed(context, "/homePage");
                          print(userResult.user!.email);
                        } catch (e) {
                          print(e.toString());
                        }
                      }
                    },
                    child: Container(
                      //margin: EdgeInsets.only(right: 30, left: 30),
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: 55,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Colors.blue.shade600,
                            Colors.blue.shade400
                          ]),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.blue.shade200,
                                offset: Offset(0, 4),
                                blurRadius: 5)
                          ]),

                      child: Center(
                        child: Text(
                          "GİRİŞ YAP",
                          style: GoogleFonts.quicksand(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 125),
                    child: Container(
                      height: 20,
                      child: Row(children: [
                        Theme(
                            data:
                                ThemeData(unselectedWidgetColor: Colors.white),
                            child: Checkbox(
                              value: isRememberMe,
                              checkColor: Colors.green,
                              activeColor: Colors.white,
                              onChanged: (value) {
                                setState(() {
                                  isRememberMe = value!;
                                });
                              },
                            )),
                        Text(
                          "Beni Hatırla",
                          style: GoogleFonts.quicksand(
                              fontSize: 16, color: Colors.black),
                        )
                      ]),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void log() {
    if (isRememberMe) {
      box1.put("email", email);
      box1.put("pass", pass);
    }
  }
}
