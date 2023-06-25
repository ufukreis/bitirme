//import 'dart:js';

import 'package:bitirme/Screens/Login.dart';
import 'package:bitirme/Screens/statistics.dart';
import 'package:bitirme/class/constants.dart';
import 'package:flutter/material.dart';

import '../data/listdata.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(height: 340, child: _head(context)),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Ödeme Geçmişi",
                  style:
                      constants().inputText(FontWeight.w600, 20, Colors.black),
                ),
                Text(
                  "Hepsini Gör",
                  style:
                      constants().inputText(FontWeight.w600, 20, Colors.grey),
                )
              ],
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, index) {
            return ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  'assets/image/${geter()[index].image!}',
                  height: 40,
                ),
              ),
              title: Text(
                geter()[index].name!,
                style:
                    constants().inputText(FontWeight.w500, null, Colors.black),
              ),
              subtitle: Text(
                geter()[index].time!,
              ),
              trailing: Text(
                geter()[index].fee!,
              ),
            );
          },
          childCount: geter().length,
        ))
      ],
    )));
  }

  Widget _head(BuildContext context ) {
    return Stack(children: [
      Column(
        children: [
          Container(
            width: double.infinity,
            height: 240,
            decoration: BoxDecoration(
                color: Colors.blue[300],
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Stack(
              children: [
                Positioned(
                    top: 35,
                    left: 340,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: Container(
                          height: 40,
                          width: 40,
                          color: Colors.blue.shade100,
                          child: IconButton(
                               onPressed: () => {
                             Navigator.push( context , MaterialPageRoute(builder: (context)=>Login()))
                               },                            
                            icon: Icon(Icons.output_outlined),
                        
                            color: Colors.white,
                          )),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 35, left: 10),
                  child: Column(
                    children: [
                      Text(
                        "İyi Günler",
                        style: constants()
                            .inputText(FontWeight.w500, 16, Colors.white),
                      ),
                      Text(
                        "Ufuk Reis",
                        style: constants()
                            .inputText(FontWeight.w500, 20, Colors.white),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      Positioned(
        top: 140,
        left: 37,
        child: Container(
          height: 170,
          width: 320,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  offset: Offset(0, 6),
                  blurRadius: 12,
                  spreadRadius: 6,
                ),
              ],
              color: Colors.blue.shade500,
              borderRadius: BorderRadius.circular(15)),
          child: Column(children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Toplam Bakiye",
                    style: constants()
                        .inputText(FontWeight.w500, 16, Colors.white),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))
                ],
              ),
            ),
            SizedBox(height: 7),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Text(
                    "\₺ 2,908",
                    style: constants()
                        .inputText(FontWeight.bold, 25, Colors.white),
                  ),
                ],
              ),
            )
          ]),
        ),
      )
    ]);
  }
}
