import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:electronics_app/features/home/data/models/product_model.dart';

class CartCubit extends Cubit<List<ProductModel>> {
  CartCubit() : super([]) {
    loadCartFromPrefs();
  }

  Future<void> addToCart(ProductModel product) async {
    final updatedCart = [...state, product];
    emit(updatedCart);
    await saveCartToPrefs(updatedCart);
  }

  void removeFromCart(ProductModel product) async {
    final updatedCart = state.where((item) => item.id != product.id).toList();
    emit(updatedCart);
    await saveCartToPrefs(updatedCart);
  }

  void clearCart() async {
    emit([]);
    await clearCartInPrefs();
  }

  Future<void> saveCartToPrefs(List<ProductModel> cart) async {
    final prefs = await SharedPreferences.getInstance();
    final cartJson = cart.map((item) => item.toJson()).toList();
    await prefs.setString('cartItems', jsonEncode(cartJson));
  }

  Future<void> loadCartFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final stringCart = prefs.getString('cartItems');
    if (stringCart != null) {
      final decodedCart = jsonDecode(stringCart) as List;
      final loadedCart = decodedCart
          .map((e) => ProductModel.fromJson(e))
          .toList();
      emit(loadedCart);
    }
  }

  Future<void> clearCartInPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('cartItems');
  }
}
