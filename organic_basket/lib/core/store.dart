import 'package:organic_basket/core/Cart.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  Cart cart;

  bool isLoading = false;

  MyStore() {
    cart = Cart();
  }
}

class ToggleLoading extends VxMutation<MyStore> {
  @override
  perform() {
    store.isLoading = !store.isLoading;
  }
}
