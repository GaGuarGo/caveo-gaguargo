import 'package:caveo_gaguargo/app_provider.dart';
import 'package:caveo_gaguargo/domain/entities/product_entity.dart';
import 'package:caveo_gaguargo/presenter/providers/product/product_provider.dart';
import 'package:caveo_gaguargo/presenter/providers/product/product_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mock_classes.dart';

void main() {
  late MockProductUsecase mockProductUsecase;
  late ProviderContainer container;

  setUp(() {
    mockProductUsecase = MockProductUsecase();

    container = ProviderContainer(
      overrides: [productUseCaseProvider.overrideWithValue(mockProductUsecase)],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('ProductNotifier Provider', () {
    test('deve iniciar no estado inicial', () {
      final state = container.read(productNotifierProvider);
      expect(state, const ProductState.initial(products: []));
    });

    test('should load products successfully', () async {
      final fakeProducts = [
        ProductEntity(
          id: 1,
          title: 'Produto 1',
          description: 'Desc 1',
          category: 'Cat 1',
          price: 20.0,
          image: 'img1',
        ),
        ProductEntity(
          id: 2,
          title: 'Produto 2',
          description: 'Desc 2',
          category: 'Cat 2',
          price: 30.0,
          image: 'img2',
        ),
      ];

      when(
        () => mockProductUsecase.fetchProducts(),
      ).thenAnswer((_) async => fakeProducts);

      final notifier = container.read(productNotifierProvider.notifier);

      await notifier.loadMoreProducts();

      final state = container.read(productNotifierProvider);
      state.maybeWhen(
        loaded: (loadedProducts) {
          expect(loadedProducts, equals(fakeProducts));
        },
        orElse: () => fail('Esperado estado loaded, mas foi $state'),
      );
    });

    test('should return error on loading failure', () async {
      when(
        () => mockProductUsecase.fetchProducts(),
      ).thenThrow(Exception('Erro ao buscar produtos'));

      final notifier = container.read(productNotifierProvider.notifier);
      await notifier.loadMoreProducts();

      final state = container.read(productNotifierProvider);

      state.maybeWhen(
        error: (message) {
          expect(message, contains('Erro ao buscar produtos'));
        },
        orElse: () => fail('Esperado estado error, mas foi $state'),
      );
    });
  });
}
