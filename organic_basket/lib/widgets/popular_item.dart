import 'package:flutter/material.dart';

import '../constant.dart';

class PopularItem extends StatelessWidget {

  final String image;
  PopularItem({this.image});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(right: 15),
      height: mq.height * 0.12,
      width: mq.width * 0.4,
      decoration: BoxDecoration(
        color: kPrimaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Image.asset(image),
    );
  }
}
