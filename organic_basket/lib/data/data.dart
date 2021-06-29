import 'package:organic_basket/models/category_model.dart';
import 'package:organic_basket/models/product_model.dart';

import '../widgets/popular_item.dart';
import '../widgets/offer.dart';

class Data {
  static final categories = [
    Category(id: 1, title: 'Vegetables', image: '', productModels: [
      ProductModel(title: 'Mango',itemPrice: 10),
      ProductModel(title: 'Papaya',itemPrice: 12),
      ProductModel(title: 'Banana',itemPrice: 15),
      ProductModel(title: 'Grapes',itemPrice: 16),
      ProductModel(title: 'Potato',itemPrice: 20)
    ]),
    Category(
        id: 2,
        title: 'Fruits',
        image: '',
        productModels: [ProductModel(title: 'Manho')]),
    Category(
        id: 3,
        title: 'Meat',
        image: '',
        productModels: [ProductModel(title: 'Mango')]),
    Category(
        id: 4,
        title: 'Milk & Egg',
        image: '',
        productModels: [ProductModel(title: 'Mango')]),
    Category(
        id: 5,
        title: 'Drinks',
        image: '',
        productModels: [ProductModel(title: 'Mango')]),
    Category(
        id: 5,
        title: 'Sea Food',
        image: '',
        productModels: [ProductModel(title: 'Mango')]),
    Category(
        id: 5,
        title: 'Cake',
        image: '',
        productModels: [ProductModel(title: 'Mango')]),
    Category(
        id: 5,
        title: 'Bakery',
        image: '',
        productModels: [ProductModel(title: 'Mango')]),
    Category(
        id: 5,
        title: 'Icecream',
        image: '',
        productModels: [ProductModel(title: 'Mango')]),
    Category(
        id: 5,
        title: 'Juice',
        image: '',
        productModels: [ProductModel(title: 'Mango')]),
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
