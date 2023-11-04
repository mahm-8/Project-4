import 'package:flutter/material.dart';
import 'package:store_watch/data/global.dart';
import 'package:store_watch/models/product.dart';
import 'package:store_watch/screens/order_screen.dart';

class Detalis extends StatefulWidget {
  const Detalis({super.key, required this.product});
  final Product product;
  @override
  State<Detalis> createState() => _DetalisState();
}

class _DetalisState extends State<Detalis> {
  double globalPrice = 0;
  int count = 1;
  @override
  void initState() {
    super.initState();
    globalPrice = double.parse(widget.product.price);
    count = 1;
  }
  @override
  Widget build(BuildContext context) {
    calculateGlobalPrice();
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {
          if (!orderProducts.contains(widget.product)) {
            orderProducts.add(widget.product);
            widget.product.count = widget.product.count! + count;
          } else {
            widget.product.count = widget.product.count! + count;
          }
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const OrderScreen(),
              ));
        },
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(20), right: Radius.circular(20)),
          ),
          backgroundColor: Colors.orange[200],
          fixedSize: Size(MediaQuery.of(context).size.width * 0.9, 1),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_bag_outlined,
              color: Color(0xff233b67),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Add to Cart',
              style: TextStyle(color: Color(0xff233b67), fontFamily: 'Lora'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(widget.product.name),
        centerTitle: true,
        actions: const [Icon(Icons.shopping_bag_outlined)],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment(0, 0),
                      end: Alignment(1, 1.5),
                      colors: [
                        Colors.transparent,
                        Color.fromARGB(80, 255, 255, 255),
                      ]),
                  borderRadius: BorderRadius.circular(15)),
              child: Image.asset(widget.product.image),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 29),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.name,
                      style: const TextStyle(
                          fontFamily: 'Lora',
                          fontSize: 28,
                          color: Color(0xff233b67)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text('\$ ${globalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontFamily: 'Lora',
                            fontSize: 20,
                            fontWeight: FontWeight.bold))
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.orange[200]),
                      child: InkWell(
                          onTap: () {
                            if (count > 1) {
                              count--;

                              globalPrice =
                                  (double.parse(widget.product.price) *
                                      count.toDouble());
                            }
                            setState(() {});
                          },
                          child: const Icon(Icons.remove)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        count.toString(),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.orange[200]),
                      child: InkWell(
                          onTap: () {
                            count++;

                            globalPrice = (double.parse(widget.product.price) *
                                count.toDouble());

                            setState(() {});
                          },
                          child: const Icon(Icons.add)),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              widget.product.description,
              style: const TextStyle(fontFamily: 'Lora', color: Colors.grey),
            ),
          ),
        ]),
      ),
    );
  }
}
