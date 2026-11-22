import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String id;
  final String name;
  final String description;
  final double price;
  final double rating;
  final String image;
  final List<String> sizes;
  final List<String> images;
  final String categoryId;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.image,
    required this.sizes,
    required this.images,
    required this.categoryId,
  });

  @override
  List<Object> get props => [
    id,
    name,
    description,
    price,
    rating,
    image,
    sizes,
    images,
    categoryId,
  ];
}
