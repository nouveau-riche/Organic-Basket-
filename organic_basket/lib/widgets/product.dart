import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:organic_basket/core/Cart.dart';
import 'package:organic_basket/core/store.dart';
import 'package:organic_basket/models/product_model.dart';

import '../constant.dart';

class Product extends StatelessWidget {
  final ProductModel productModel;

  final String uid = FirebaseAuth.instance.currentUser.uid;

  Product({this.productModel});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Container(
      height: mq.height * 0.2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: mq.height * 0.18,
            width: mq.width,
            child: Image.network(
              'https://static.libertyprim.com/files/familles/fraise-large.jpg?1569271765',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              productModel.title,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            '\$17.00/Kg',
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$17.20',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    AddProduct(productModel, uid);
                  },
                  child: Container(
                    height: 50,
                    width: 45,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add_shopping_cart,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
