import 'package:caveo_gaguargo/presenter/modules/error/error_view.dart';
import 'package:caveo_gaguargo/presenter/modules/products/widgets/product_card.dart';
import 'package:caveo_gaguargo/presenter/providers/product/product_provider.dart';
import 'package:caveo_gaguargo/presenter/providers/product/product_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductsView extends ConsumerWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Products', style: Theme.of(context).textTheme.titleMedium),
      ),
      body: state.whenOrNull(
        initial: (products) => SizedBox.shrink(),
        error: (message) => ErrorView(message: message),
        loading: () => const Center(child: CircularProgressIndicator()),
        loaded: (products) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: GridView.builder(
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
                childAspectRatio: 0.85,
              ),
              itemBuilder: (_, index) {
                return ProductCard(product: products[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
