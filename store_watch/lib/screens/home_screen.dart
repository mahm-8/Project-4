import 'package:flutter/material.dart';
import 'package:store_watch/widgets/product_display.dart';
import 'package:store_watch/widgets/top_deals.dart';
import 'package:store_watch/widgets/type_watch.dart';

import 'filter_screen.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: const Color(0xff233b67),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.menu_rounded),
            onPressed: () {},
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/logo.jpeg",
                cacheHeight: 25,
                cacheWidth: 25,
              ),
              const Text(
                'ADS Watch',
                style:
                    TextStyle(fontFamily: 'Lora', fontWeight: FontWeight.w500),
              ),
            ],
          ),
          centerTitle: true,
          actions: [
            InkWell(
              child: const Icon(Icons.filter_list),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const FilterScreen(),
                ));
              },
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        body: const SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Hello',
                      style: TextStyle(
                          fontFamily: 'Lora',
                          fontSize: 28,
                          color: Color(0xff233b67),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Choose Your Top Brands',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lora',
                      ),
                    ),
                  ),
                  TypeWatch(),
                  ProductDisplay(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Top Deals",
                          style: TextStyle(
                              fontFamily: 'Lora',
                              fontSize: 22,
                              color: Color(0xff233b67)),
                        ),
                        Text('View All',
                            style: TextStyle(
                              fontSize: 22,
                              color: Color(0xff233b67),
                              fontFamily: 'Lora',
                            ))
                      ],
                    ),
                  ),
                  TopDeals(),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
