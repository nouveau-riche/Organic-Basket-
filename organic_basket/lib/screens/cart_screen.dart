import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:organic_basket/constant.dart';
import 'package:organic_basket/core/Cart.dart';
import 'package:organic_basket/core/store.dart';
import 'package:organic_basket/models/product_model.dart';
import 'package:organic_basket/widgets/cart_item.dart';
import 'package:velocity_x/velocity_x.dart';

class CartScreen extends StatelessWidget {
  final String uid = FirebaseAuth.instance.currentUser.uid;

  @override
  Widget build(BuildContext context) {
    MyStore store = VxState.store;
    print('nikunj');

    // VxState.watch(context, on: [RemoveProduct]);

    final mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        title: Text('Cart'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              height: mq.height * 0.6,
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(30),
              ),
              child: VxBuilder(
                mutations: {RemoveProduct},
                builder: (context, _, status) => Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),

                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .doc(uid)
                        .snapshots(),
                    builder: (ctx, snapshot) {
                      if (snapshot.hasData) {
                        var data = snapshot.data;

                        List<ProductModel> list;

                        data['cart'].forEach((ele) {
                          list.add(
                            ProductModel(
                              title: ele['title'],
                            ),
                          );
                        });

                        return ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (ctx, index) => Dismissible(
                            key: UniqueKey(),
                            direction: DismissDirection.endToStart,
                            onDismissed: (direction) {
                              FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(uid)
                                  .update({
                                'cart': FieldValue.arrayRemove([
                                  {
                                    'id': list[index].id,
                                    'title': list[index].title,
                                    'itemPrice': list[index].itemPrice,
                                  }
                                ]),
                              });

                              // RemoveProduct(
                              //     // store.cart.allProductsInCart[index],
                              // );
                            },
                            child: CartItem(
                              productModel: list[index],
                            ),
                          ),
                        );
                      } else {
                        return Text('No Product added ');
                      }
                    },
                  ),

                  // child: store.cart.allProductsInCart.length == 0
                  //     ? Text('No Product added ')
                  //     : ListView.builder(
                  //         itemCount: store.cart.allProductsInCart.length,
                  //         itemBuilder: (ctx, index) => Dismissible(
                  //           key: UniqueKey(),
                  //           direction: DismissDirection.endToStart,
                  //           onDismissed: (direction) {
                  //             RemoveProduct(
                  //                 store.cart.allProductsInCart[index]);
                  //           },
                  //           child: CartItem(
                  //             productModel: store.cart.allProductsInCart[index],
                  //           ),
                  //         ),
                  //       ),
                ),
              ),
            ),
            Container(
              height: mq.height * 0.15,
              // color: Colors.redAccent,
              color: kPrimaryColor.withOpacity(0.2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .doc(uid)
                        .snapshots(),
                    builder: (ctx, snapshot) {
                      if (snapshot.hasData) {
                        var data = snapshot.data;

                        int totalPrice = 0;

                        data['cart'].forEach((ele) {
                          totalPrice = totalPrice + ele['itemPrice'];
                        });

                        return Text(
                          'Total: $totalPrice',
                          style: TextStyle(
                              fontSize: 21, fontWeight: FontWeight.bold),
                        );
                      } else {
                        return Text(
                          'Total: 0',
                          style: TextStyle(
                              fontSize: 21, fontWeight: FontWeight.bold),
                        );
                      }
                    },
                  ),

                  // VxBuilder(
                  //   mutations: {AddProduct, RemoveProduct},
                  //   builder: (context, _, __) => Text(
                  //     'Total: ${store.cart.totalPrice}',
                  //     style:
                  //         TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                  //   ),
                  // ),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: kPrimaryColor),
                      onPressed: () {},
                      child: Text(
                        'Checkout >',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
