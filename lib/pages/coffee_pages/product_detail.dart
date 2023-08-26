import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:oeber/providers/product.dart';

class ProductDetail extends StatefulWidget {
  final Product product;

  const ProductDetail(this.product, {super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  String selectedSize = '';

  Widget buildSizeContainer(String size) {
    bool isSelected = selectedSize == size;

    return GestureDetector(
      onTap: () {
        setState(() => selectedSize = size);
      },
      child: Container(
        width: 110,
        alignment: Alignment.center,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? Colors.orange : Colors.white,
            width: 2,
          ),
        ),
        child: Text(
          size,
          style: TextStyle(
            fontSize: 18,
            color: isSelected ? Colors.orange : Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.47,
                child: Stack(
                  fit: StackFit.passthrough,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      child: Hero(
                        tag: widget.product.id,
                        child: Image(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            widget.product.photoUrl,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              color: Colors.white10,
                              child: Container(
                                color: Colors.black.withOpacity(0.5),
                                child: Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget.product.name,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 30,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 4.0),
                                            child: Text(
                                              widget.product.description,
                                              style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.8),
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 12.0),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                const Icon(
                                                  Icons.star,
                                                  color: Colors.orange,
                                                  size: 26,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 10.0,
                                                    right: 6,
                                                  ),
                                                  child: Text(
                                                    widget.product.rating
                                                        .toStringAsFixed(1),
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context); // Pop the page
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Description",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 18,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        widget.product.detailedDescription,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildSizeContainer('S'),
                  buildSizeContainer('M'),
                  buildSizeContainer('L'),
                ],
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
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
                            "Price",
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
                                  widget.product.price.toStringAsFixed(2),
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 20),
                          child: Text(
                            'Buy Now',
                            style: TextStyle(
                              fontSize: 24,
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
      ),
    );
  }
}
