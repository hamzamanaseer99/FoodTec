class Product {
  final String name;
  final String description;
  final double price;
  final String image;
  bool isFavorite;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    this.isFavorite = false,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      image: json['image'] ?? '',
      isFavorite: json['isFavorite'] ?? false,
    );
  }
}
