import 'package:organic_basket/models/category_model.dart';

import '../widgets/popular_item.dart';
import '../widgets/offer.dart';

class Data {
  static final categories = [

    Category(id: 1, title: 'Vegetables', image: ''),
    Category(id: 2, title: 'Fruits', image: ''),
    Category(id: 3, title: 'Meat', image: ''),
    Category(id: 4, title: 'Milk & Egg', image: ''),
    Category(id: 5, title: 'Drinks', image: ''),
    Category(id: 5, title: 'Sea Food', image: ''),
    Category(id: 5, title: 'Cake', image: ''),
    Category(id: 5, title: 'Bakery', image: ''),
    Category(id: 5, title: 'Icecream', image: ''),
    Category(id: 5, title: 'Juice', image: ''),

  ];

  static final offers = [
    Offer(),
    Offer(),
    Offer(),
    Offer(),
    Offer(),
  ];

  static final popularDeals = [
    PopularItem(),
    PopularItem(),
    PopularItem(),
    PopularItem(),
    PopularItem(),
  ];
}
