import 'package:bootx_app/core/entity/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.name,
    required super.description,
    required super.price,
    required super.rating,
    required super.image,
    required super.sizes,
    required super.images,
    required super.categoryId,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      image: json['image_url'] as String,
      sizes: List<String>.from(json['sizes'] as List),
      images: List<String>.from(json['images'] as List),
      categoryId: json['category_id'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'rating': rating,
      'image': image,
      'sizes': sizes,
      'images': images,
      'categoryId': categoryId,
    };
  }
}
