import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopping_app/models/product.dart';

// Our previous Provider (ProductsProvider) was static and designed to pass values around different widgets
// This Provider (NotifierProvider) is dynamic and its job is to update states and notify consumer about those changes
class CartNotifier extends Notifier<Set<Product>> {
  // Initial value
  @override
  Set<Product> build() {
    return const {};
  }

  // Methods to update the state
  void addProduct(Product product) {
    if (!state.contains(product)) {
      state = {...state, product};
    }
  }

  void removeProduct(Product product) {
    if (state.contains(product)) {
      state = state.where((p) => p.id != product.id).toSet();
    }
  }
}

final cartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>(() {
  return CartNotifier();
});
