import 'package:flutter/material.dart';

import '../constant.dart';

class Product extends StatelessWidget {
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
              'Strawberry',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            '\$17.00/Kg',
            style: TextStyle(fontSize: 15,color: Colors.grey),
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
                  onTap: () {},
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
