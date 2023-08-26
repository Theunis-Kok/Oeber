import 'package:oeber/providers/product.dart';

class CartProduct {
  final Product product;
  int quantity;

  CartProduct({
    required this.product,
    required this.quantity,
  });
}
