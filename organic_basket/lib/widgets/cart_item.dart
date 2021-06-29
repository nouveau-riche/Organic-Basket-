import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:organic_basket/core/Cart.dart';
import 'package:organic_basket/core/store.dart';
import 'package:organic_basket/models/product_model.dart';

import '../constant.dart';

class CartItem extends StatelessWidget {
  final ProductModel productModel;

  CartItem({this.productModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            child: Image.network(
                'https://static.libertyprim.com/files/familles/fraise-large.jpg?1569271765'),
          ),
          SizedBox(
            width: 25,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productModel.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                '\$17.00/Kg',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.grey),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                '\$17.00',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: kPrimaryColor),
              ),
            ],
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              RemoveProduct(productModel);
            },
            icon: Icon(Icons.delete),
          ),
          // Column(
          //   children: [
          //     Icon(CupertinoIcons.add),
          //     Container(
          //       height: 30,
          //       width: 30,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(4),
          //         color: kPrimaryColor,
          //       ),
          //       child: Center(
          //         child: Text(
          //           '01',
          //           style: TextStyle(
          //               color: Colors.white,
          //               fontWeight: FontWeight.w900),
          //         ),
          //       ),
          //     ),
          //     Icon(CupertinoIcons.minus),
          //   ],
          // ),
        ],
      ),
    );
  }
}
