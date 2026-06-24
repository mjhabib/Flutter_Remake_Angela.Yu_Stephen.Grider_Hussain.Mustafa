import 'package:flutter_riverpod/flutter_riverpod.dart';
// 01. import
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopping_app/models/product.dart';

// 02. part
part 'cart_provider.g.dart';
// 03. Run in Terminal: dart run build_runner watch

// Our previous Provider (ProductsProvider) was static and designed to pass values around different widgets
// This Provider (NotifierProvider) is dynamic and its job is to update states and notify consumer about those changes

// 01. Using Provider generator
@riverpod
class CartNotifier extends _$CartNotifier {
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

// final cartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>(() {
//   return CartNotifier();
// });
