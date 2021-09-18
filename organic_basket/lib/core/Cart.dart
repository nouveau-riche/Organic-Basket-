import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:organic_basket/core/firebase_methods.dart';
import 'package:organic_basket/core/store.dart';
import 'package:organic_basket/models/product_model.dart';
import 'package:velocity_x/velocity_x.dart';

class Cart {
  List<ProductModel> allProductsInCart = [];
  int totalPrice = 0;
}

class AddProduct extends VxMutation<MyStore> {
  final ProductModel product;
  final String uid;

  AddProduct(this.product,this.uid);

  @override
  perform() {
    store.cart.allProductsInCart.add(product);


    FirebaseMethods.addProductToCartOnFirebase(uid, product);

    int sum = 0;
    store.cart.allProductsInCart.forEach((element) {
      sum = sum + element.itemPrice;
    });
    store.cart.totalPrice = sum;
  }
}

class RemoveProduct extends VxMutation<MyStore> {
  final ProductModel product;

  RemoveProduct(this.product);

  @override
  perform() {
    store.cart.allProductsInCart.remove(product);
    int sum = 0;
    store.cart.allProductsInCart.forEach((element) {
      sum = sum + element.itemPrice;
    });
    store.cart.totalPrice = sum;
  }
}
