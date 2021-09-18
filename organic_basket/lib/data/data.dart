import '../widgets/offer.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';
import '../widgets/popular_item.dart';

class Data {
  static final categories = [
    Category(id: 1, title: 'Vegetables', image: 'assets/images/vegetable.jpg', productModels: [
      ProductModel(title: 'Mango',itemPrice: 10),
      ProductModel(title: 'Papaya',itemPrice: 12),
      ProductModel(title: 'Banana',itemPrice: 15),
      ProductModel(title: 'Grapes',itemPrice: 16),
      ProductModel(title: 'Potato',itemPrice: 20)
    ]),
    Category(
        id: 2,
        title: 'Fruits',
        image: 'assets/images/fruit.jpg',
        productModels: [ProductModel(title: 'Manho')]),
    Category(
        id: 3,
        title: 'Meat',
        image: 'assets/images/meat.jpeg',
        productModels: [ProductModel(title: 'Mango')]),
    Category(
        id: 4,
        title: 'Milk & Egg',
        image: 'assets/images/milk.jpg',
        productModels: [ProductModel(title: 'Mango')]),
    Category(
        id: 5,
        title: 'Soft Drinks',
        image: 'assets/images/softdrink.jpg',
        productModels: [ProductModel(title: 'Mango')]),
    Category(
        id: 5,
        title: 'Sea Food',
        image: 'assets/images/seafood.jpg',
        productModels: [ProductModel(title: 'Mango')]),
    Category(
        id: 5,
        title: 'Cake',
        image: 'assets/images/cake.jpg',
        productModels: [ProductModel(title: 'Mango')]),
    Category(
        id: 5,
        title: 'Bakery',
        image: 'assets/images/bakery.jpg',
        productModels: [ProductModel(title: 'Mango')]),
    Category(
        id: 5,
        title: 'Icecream',
        image: 'assets/images/icecream.jpg',
        productModels: [ProductModel(title: 'Mango')]),
    Category(
        id: 5,
        title: 'Juice',
        image: 'assets/images/juice.jpg',
        productModels: [ProductModel(title: 'Mango')]),
  ];

  static final offers = [
    Offer(image: 'assets/images/offer1.jpg',),
    Offer(image: 'assets/images/offer2.jpg',),
  ];

  static final popularDeals = [
    PopularItem(image: 'assets/images/popular1.jpg',),
    PopularItem(image: 'assets/images/popular2.jpg',),
    PopularItem(image: 'assets/images/popular3.jpg',),
  ];
}
