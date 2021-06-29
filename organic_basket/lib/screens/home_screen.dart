import 'package:flutter/material.dart';
import 'package:organic_basket/widgets/category_item.dart';
import 'package:organic_basket/widgets/popular_item.dart';

import '../constant.dart';
import '../data/data.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text('Hey\nLet\'s search your organic food'),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(
                'https://t3.ftcdn.net/jpg/02/33/46/24/360_F_233462402_Fx1yke4ng4GA8TJikJZoiATrkncvW6Ib.jpg',
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildSearchBox(),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  buildCategoriesContainer(mq, context),
                  SizedBox(
                    height: 15,
                  ),
                  buildOffer(mq),
                  SizedBox(
                    height: 15,
                  ),
                  buildPopularDeals(mq),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSearchBox() {
    return Container(
      margin: EdgeInsets.all(26),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: TextField(
          cursorColor: Colors.grey,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              size: 35,
              color: Colors.grey,
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCategoriesContainer(Size mq, BuildContext context) {
    return Container(
      height: mq.height * 0.28,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categories',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('./categories-screen');
                },
                child: Text(
                  'See all',
                  style: TextStyle(color: kPrimaryColor, fontSize: 20),
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
          ),
          Container(
            height: mq.height * 0.17,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: Data.categories.length,
              itemBuilder: (ctx, index) =>
                  CategoryItem(title: Data.categories[index].title,productModel: Data.categories[index].productModels,),

            ),
          ),
        ],
      ),
    );
  }

  Widget buildOffer(Size mq) {
    return Container(
      height: mq.height * 0.185,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: Data.offers.length,
        itemBuilder: (ctx, index) => Data.offers[index],
      ),
    );
  }

  Widget buildPopularDeals(Size mq) {
    return Container(
      height: mq.height * 0.28,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular deals',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'See all',
                  style: TextStyle(color: kPrimaryColor, fontSize: 20),
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
          ),
          Container(
            padding: EdgeInsets.only(top: 6),
            height: mq.height * 0.17,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: Data.popularDeals.length,
              itemBuilder: (ctx, index) => PopularItem(),
            ),
          ),
        ],
      ),
    );
  }
}
