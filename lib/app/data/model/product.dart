class Product {
  final String title;
  final String description;
  final double price;
  final double rating;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String> images;

  Product(
      {required this.title,
      required this.description,
      required this.price,
      required this.rating,
      required this.brand,
      required this.category,
      required this.thumbnail,
      required this.images
      });

factory Product.fromMap(Map<String, dynamic> map) {
  return Product(
  title: map['title'],
  description: map['descripition'],
  price:map['price'],
  rating:map['rating'],
  brand:map['brand'],
  category:map['category'],
  thumbnail: map['thumbnail'],
  images: List<String>.from((map['images' as List])),
  );
  }
}
