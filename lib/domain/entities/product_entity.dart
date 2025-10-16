import 'package:caveo_gaguargo/data/dtos/product_dto.dart';

class ProductEntity {
  final int id;
  final String title;
  final num price;
  final String description;
  final String category;
  final String image;

  ProductEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  factory ProductEntity.fromDto(ProductDto dto) {
    return ProductEntity(
      id: dto.id,
      title: dto.title,
      price: dto.price,
      description: dto.description,
      category: dto.category,
      image: dto.image,
    );
  }
}
