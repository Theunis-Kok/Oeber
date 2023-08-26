import 'package:flutter/material.dart';
import 'package:oeber/pages/coffee_pages/product_detail.dart';
import 'package:oeber/providers/cart_product.dart';
import 'package:oeber/themes/theme_data.dart';
import 'package:oeber/widgets/custom_dialog.dart';

// ignore: must_be_immutable
class CartProductContainer extends StatefulWidget {
  CartProduct cartProduct;
  final VoidCallback onRemove;
  CartProductContainer(
      {required this.cartProduct, required this.onRemove, super.key});

  @override
  State<CartProductContainer> createState() => _CartProductContainerState();
}

class _CartProductContainerState extends State<CartProductContainer> {
  void removeItem() {
    if (widget.cartProduct.quantity == 1) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return DefaultDialog(
            heading: "Remove",
            body:
                "Are you sure you want to remove ${widget.cartProduct.product.name} from your cart?",
            leftButtonText: "Cancel",
            rightButtonText: "Remove",
            onLeftButtonPress: () => Navigator.pop(context),
            onRightButtonPress: () {
              removeProduct();

              Navigator.pop(context);
            },
          );
        },
      );
    } else {
      decreaseQuantity();
    }
  }

  decreaseQuantity() {
    setState(() => widget.cartProduct.quantity--);
  }

  void removeProduct() {
    widget.onRemove();
  }

  increaseQuantity() {
    setState(() => widget.cartProduct.quantity++);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 125,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: greyBackgroundColour,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
              child: Image.network(
                widget.cartProduct.product.photoUrl,
                height: 75,
                width: 75,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.cartProduct.product.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    widget.cartProduct.product.description,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 6.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'R ',
                            style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.cartProduct.product.price.toStringAsFixed(2),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(
                  Icons.remove,
                  size: 24,
                ),
              ),
              onTap: () => removeItem(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.cartProduct.quantity.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(
                  Icons.add,
                  size: 24,
                ),
              ),
              onTap: () => increaseQuantity(),
            ),
          ],
        ),
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductDetail(widget.cartProduct.product)),
      ),
    );
  }
}
