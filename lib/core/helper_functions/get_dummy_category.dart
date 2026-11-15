import 'package:bootx_app/features/home/data/model/category_model.dart';

List<CategoryModel> getDummyCategories() {
  return const [
    CategoryModel(id: 'Nike', name: 'Nike', image_url: 'assets/icons/nike.svg'),
    CategoryModel(id: 'Puma', name: 'Puma', image_url: 'assets/icons/puma.svg'),
    CategoryModel(
      id: 'Under Armour',
      name: 'Under Armour',
      image_url: 'assets/icons/under_armour.svg',
    ),
    CategoryModel(
      id: 'Adidas',
      name: 'Adidas',
      image_url: 'assets/icons/adidas.svg',
    ),
    CategoryModel(
      id: 'Converse',
      name: 'Converse',
      image_url: 'assets/icons/converse.svg',
    ),
  ];
}
