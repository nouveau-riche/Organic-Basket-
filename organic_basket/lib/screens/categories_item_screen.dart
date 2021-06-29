import 'package:flutter/material.dart';
import 'package:organic_basket/models/product_model.dart';

import '../widgets/product.dart';
import '../constant.dart';

class CategoriesItemScreen extends StatelessWidget {
  final String title;
  final List<ProductModel> productModel;

  CategoriesItemScreen({ this.title,this.productModel});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0,
        title: Text(title),
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Container(
              height: mq.height,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.6),
                  itemBuilder: (ctx, index) => Product(productModel: productModel[index],),
                  itemCount: productModel.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
