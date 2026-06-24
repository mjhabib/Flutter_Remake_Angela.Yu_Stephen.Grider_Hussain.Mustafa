// import 'package:flutter_riverpod/flutter_riverpod.dart';
// 01.
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopping_app/models/product.dart';

// 02.
part 'products_provider.g.dart';
// 03. Run in Terminal: dart run build_runner watch

const List<Product> allProducts = [
  Product(
    id: '1',
    title: 'Groovy Shorts',
    price: 12,
    image: 'products/shorts.png',
  ),
  Product(
    id: '2',
    title: 'Karati Kit',
    price: 34,
    image: 'products/karati.png',
  ),
  Product(
    id: '3',
    title: 'Denim Jeans',
    price: 54,
    image: 'products/jeans.png',
  ),
  Product(
    id: '4',
    title: 'Red Backpack',
    price: 14,
    image: 'products/backpack.png',
  ),
  Product(
    id: '5',
    title: 'Drum & Sticks',
    price: 29,
    image: 'products/drum.png',
  ),
  Product(
    id: '6',
    title: 'Blue Suitcase',
    price: 44,
    image: 'products/suitcase.png',
  ),
  Product(
    id: '7',
    title: 'Roller Skates',
    price: 52,
    image: 'products/skates.png',
  ),
  Product(
    id: '8',
    title: 'Electric Guitar',
    price: 79,
    image: 'products/guitar.png',
  ),
];

// the most general and simple type of Riverpod Provider
// final productsProvider = Provider((ref) {
//   return allProducts;
// });

// return products with the price of less than 50
// final reducedProductsProvider = Provider((ref) {
//   return allProducts.where((p) => p.price < 50).toList();
// });

// 1. Generated providers
@riverpod
List<Product> products(Ref ref) {
  return allProducts;
}

@riverpod
List<Product> reducedProducts(Ref ref) {
  return allProducts.where((p) => p.price < 50).toList();
}
