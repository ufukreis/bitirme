import 'package:bitirme/data/1.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String cardNumber = '';
  String expiryDate = '';
  String cvvCode = '';
  String cardHolderName = '';
  String amount = '';

  bool isCvvFocused = false;
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ödeme Ekranı'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ödenecek Miktar',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Ödenecek miktarı girin',
                ),
                onChanged: (value) {
                  setState(() {
                    amount = value;
                  });
                },
              ),
              SizedBox(height: 24),
              Text(
                'Kart Üzerindeki İsim',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Kart üzerindeki ismi girin',
                ),
                onChanged: (value) {
                  setState(() {
                    cardHolderName = value;
                  });
                },
              ),
              SizedBox(height: 16),
              Text(
                'Kart Numarası',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Kart numaranızı girin',
                ),
                keyboardType: TextInputType.number,
                maxLength: 16,
                onChanged: (value) {
                  setState(() {
                    cardNumber = value;
                  });
                },
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Son Kullanma Tarihi',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'AA/YY',
                          ),
                          keyboardType: TextInputType.number,
                          maxLength: 4,
                          onChanged: (value) {
                            setState(() {
                              expiryDate = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'CVV Kodu',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'CVV',
                            ),
                            keyboardType: TextInputType.number,
                            maxLength: 3,
                            onChanged: (value) {
                              setState(() {
                                cvvCode = value;
                              });
                            },
                            focusNode: FocusNode(),
                            onTap: () {
                              setState(() {
                                isCvvFocused = true;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Ödeme işlemlerini burada gerçekleştirin
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Ödeme Başarılı'),
                            content: Text('Ödeme işlemi başarıyla tamamlandı.'),
                            actions: [
                              TextButton(
                                child: Text('Tamam'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text('Ödemeyi Tamamla'),
                  ),
                  SizedBox(width: 80),
                  Checkbox(
                    value: rememberMe,
                    onChanged: (value) {
                      setState(() {
                        rememberMe = value!;
                      });
                    },
                  ),
                  Text('Beni Hatırla'),
                ],
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
