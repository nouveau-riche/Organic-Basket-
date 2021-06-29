import 'package:organic_basket/core/Cart.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  Cart cart;

  MyStore() {
    cart = Cart();
  }
}
