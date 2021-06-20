class Product {
  final int id;
  final String title;
  final num perItemPrice;
  final num itemPrice;
  final String image;
  final List reviews;
  final String description;
  final bool isAvailable;

  Product(
      {required this.id,
      required this.title,
      required this.perItemPrice,
      required this.itemPrice,
      required this.reviews,
      required this.description,
      required this.isAvailable,
      required this.image});
}
