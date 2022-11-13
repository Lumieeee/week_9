import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:minggu_9/controller/demoController.dart';
import 'package:minggu_9/controller/purchase.dart';

class HomePage extends StatelessWidget {
 final purchase = Get.put(Purchase());
 DemoController cart = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.orange,
      ),
      bottomSheet: SafeArea(
        child: Card(
          elevation: 12.0,
          margin: EdgeInsets.zero,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.orange,
            ),
            height: 50,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: [
                      Icon(Icons.shopping_cart_rounded,
                        size: 30, color: Colors.white),
                      Positioned(
                        right: 0,
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          child: Center(
                            child: GetX<DemoController>(builder: (controller) {
                              return Text(
                                '${controller.cartCount}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11.0
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                  GetX<DemoController>(builder: (controller) {
                    return Text(
                      'Total Amount - ${controller.totalAmount}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 16.0
                      ),
                    );
                  }),
                  IconButton(
                    onPressed: () => Get.toNamed('/cart',
                    arguments: "Home Page to Demo Page -> Passing Arguments"),
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        child: GetX<Purchase>(builder: (controller) {
          return ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Column(
                  children: [
                    Image.asset(
                    "assets/images/w.jpeg",
                    width: 200.0,
                    height: 100.0,
                    fit: BoxFit.cover,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.products[index].productName,
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0
                                  ),
                                ),
                                Text(
                                  controller.products[index].productDescription,
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12.0
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () => cart.addToCart(controller.products[index]),
                            child: Text(
                              'Shop Now',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 12.0
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                    height: 50.0,
                    ),
                  ],
                ),
              ),
            )
           );
        }),
      ),
    );
  }
}