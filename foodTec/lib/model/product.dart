class Product {
  final String name;
  final String description;
  final double price;
  final String image;
  final String images;
  bool isFavorite;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.images,

    this.isFavorite = false,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      image: json['image'] ?? '',
      images: json['images'] ?? '',

      isFavorite: json['isFavorite'] ?? false,
    );
  }
}
