import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String id;
  final String name;
  final String image_url;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.image_url,
  });

  @override
  List<Object> get props => [id, name, image_url];
}
