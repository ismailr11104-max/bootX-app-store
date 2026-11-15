import 'package:bootx_app/features/home/domain/entity/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required super.id,
    required super.name,
    required super.image_url,
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'name_en': name, 'image_url': image_url};
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as String,
      name: map['name_en'] as String,
      image_url: map['image_url'] as String,
    );
  }
}
