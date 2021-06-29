import 'package:organic_basket/models/product_model.dart';

class Category {
  final int id;
  final String title;
  final String image;
  final List<ProductModel> productModels;

  Category({this.id, this.title, this.image, this.productModels});
}
