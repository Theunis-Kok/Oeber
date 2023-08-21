import 'dart:ui';

import 'package:flutter/material.dart';

class CuppucinoDetailsScreen extends StatefulWidget {
  const CuppucinoDetailsScreen({super.key});

  @override
  State<CuppucinoDetailsScreen> createState() => _CuppucinoDetailsScreenState();
}

class _CuppucinoDetailsScreenState extends State<CuppucinoDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 500, //550
            child: Stack(
              fit: StackFit.passthrough,
              children: [
                const ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  child: Image(
                    image: NetworkImage(
                      'https://images.pexels.com/photos/2396220/pexels-photo-2396220.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ClipRRect(
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
                                      const Text(
                                        'Cuppucino',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.symmetric(vertical: 4.0),
                                        child: Text(
                                          'With Cream',
                                          style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.8),
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 12.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                              size: 26,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10.0, right: 6),
                                              child: Text('4.5',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 2.0),
                                              child: Text(
                                                '(6.986)',
                                                style: TextStyle(
                                                    color: Colors.white70,
                                                    fontSize: 13,
                                                    letterSpacing: 0.5),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
