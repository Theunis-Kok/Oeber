import 'package:flutter/material.dart';
import 'package:oeber/providers/cart_product.dart';
import 'package:oeber/providers/product.dart';
import 'package:oeber/themes/theme_data.dart';
import 'package:oeber/widgets/cart_product_container.dart';

class CartPage extends StatefulWidget {
  final List<Product> products;
  const CartPage(this.products, {super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartProduct> selectedProducts = [];
  final GlobalKey<AnimatedListState> listKey = GlobalKey();

  void populateSelectedProducts() {
    for (Product product in widget.products) {
      CartProduct cartProduct = CartProduct(product: product, quantity: 1);
      selectedProducts.add(cartProduct);
    }
  }

  void removeProduct(int index) {
    selectedProducts.removeAt(index);
    listKey.currentState!.removeItem(index, (context, animation) {
      return SizeTransition(
        sizeFactor: animation,
        child: CartProductContainer(
          cartProduct: selectedProducts[index],
          onRemove: () {},
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();

    populateSelectedProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mainBackgroundColour,
          title: const Text(
            "Cart",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              AnimatedList(
                key: listKey,
                shrinkWrap: true,
                initialItemCount: selectedProducts.length,
                itemBuilder: (context, index, animation) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1, 0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: CartProductContainer(
                      cartProduct: selectedProducts[index],
                      onRemove: () => removeProduct(index),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
