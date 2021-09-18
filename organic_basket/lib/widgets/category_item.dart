import 'package:flutter/material.dart';
import 'package:organic_basket/models/product_model.dart';

import '../screens/categories_item_screen.dart';
import '../constant.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String image;
  final List<ProductModel> productModel;


  CategoryItem({ this.title,this.productModel,this.image});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => CategoriesItemScreen(
              title: title,
              productModel: productModel,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: mq.height * 0.12,
              width: mq.width * 0.25,
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(image,fit: BoxFit.cover,),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
