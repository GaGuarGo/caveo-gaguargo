//gerar um freezed
import 'package:caveo_gaguargo/domain/entities/product_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_state.freezed.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial({required List<ProductEntity> products}) = _Initial;
  const factory ProductState.loading() = _Loading;
  const factory ProductState.loaded({required List<ProductEntity> products}) = _Loaded;
  const factory ProductState.error({required String message}) = _Error;
}
