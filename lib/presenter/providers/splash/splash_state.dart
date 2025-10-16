import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:caveo_gaguargo/domain/entities/product_entity.dart';

part 'splash_state.freezed.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.initial() = SplashInitial;
  const factory SplashState.loading() = SplashLoading;
  const factory SplashState.loaded({required List<ProductEntity> products}) = SplashLoaded;
  const factory SplashState.error({required String message}) = SplashError;
}