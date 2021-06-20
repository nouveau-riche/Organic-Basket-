import 'package:flutter/material.dart';
import 'package:organic_basket/widgets/category_item.dart';

import '../constant.dart';
import '../data/data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: Text('Catagories'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
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
                      crossAxisCount: 3,
                      mainAxisSpacing: 20,
                      childAspectRatio: 0.8),
                  itemBuilder: (ctx, index) => CategoryItem(
                    title: Data.categories[index].title,
                  ),
                  itemCount: Data.categories.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
