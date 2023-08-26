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
  double totalPrice = 0;

  void populateSelectedProducts() {
    for (Product product in widget.products) {
      CartProduct cartProduct = CartProduct(product: product, quantity: 1);
      selectedProducts.add(cartProduct);
      totalPrice += cartProduct.product.price;
    }
  }

  void removeProduct(int index) {
    setState(() => totalPrice -= selectedProducts[index].product.price);

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
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
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
            Container(
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Price",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 20,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            children: [
                              const Text(
                                'R ',
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                totalPrice.toStringAsFixed(2),
                                style: const TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print("\$");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFD17842),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        child: Text(
                          'Check Out',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
