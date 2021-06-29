class ProductModel {
  final int id;
  final String title;
  final num perItemPrice;
  final num itemPrice;
  final String image;
  final List reviews;
  final String description;
  final bool isAvailable;

  ProductModel(
      { this.id,
       this.title,
       this.perItemPrice,
       this.itemPrice,
       this.reviews,
       this.description,
       this.isAvailable,
       this.image});
}
