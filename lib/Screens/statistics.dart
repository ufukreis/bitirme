import 'package:flutter/material.dart';
import 'package:bitirme/class/constants.dart';

import '../data/listdata.dart';

class Statistics extends StatefulWidget {
  Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  List day = ["Gün", "Hafta", "Ay", "Yıl"];
  int index_color = 0;
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      "İstatistikler",
                      style: constants()
                          .inputText(FontWeight.w700, 20, Colors.black),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ...List.generate(
                            4,
                            (index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    index_color = index;
                                  });
                                },
                                child: Container(
                                  height: 40,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: index_color == index
                                          ? Colors.blue.shade300
                                          : Colors.white),
                                  alignment: Alignment.center,
                                  child: Text(
                                    day[index],
                                    style: constants().inputText(
                                        FontWeight.w500,
                                        16,
                                        index_color == index
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 120,
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Harcama",
                                  style: constants().inputText(
                                      FontWeight.bold, 16, Colors.grey),
                                ),
                                Icon(
                                  Icons.arrow_downward_sharp,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8)),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      child: Image.asset("assets/image/grafik.png"),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Harcamalar",
                            style: constants()
                                .inputText(FontWeight.bold, 20, Colors.black),
                          ),
                          Icon(
                            Icons.swap_vert,
                            size: 25,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ListTile(
                    leading: Image.asset(
                      'assets/image/${geter()[index].image!}',
                      height: 40,
                    ),
                    title: Text(
                      geter()[index].name!,
                      style: constants()
                          .inputText(FontWeight.w600, 17, Colors.black),
                    ),
                    subtitle: Text(geter()[index].time!),
                    trailing: Text(geter()[index].fee!),
                  );
                },
                childCount: geter().length,
              ))
            ],
          ),
        ),
      );
    });
  }
}
