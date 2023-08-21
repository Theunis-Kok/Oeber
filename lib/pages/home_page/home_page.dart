import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oeber/providers/product.dart';
import 'package:oeber/themes/theme_data.dart';
import 'package:oeber/util/coffee_type.dart';
import 'package:oeber/widgets/product_item.dart';

import '../../widgets/input_textfield_decoration.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  List<String> notifications = ["Alert"];
  List<Product> products = [];

//------------------------------Widget Rendering------------------------------\\
  Widget renderHeaderSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: GestureDetector(
                    child: const CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiYXE8Ek1M_tOGkdTGsgLwLQe3UPdBMGcfYg&usqp=CAU"),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  greeting(),
                  style: defaultTextStyle(),
                ),
                Text(
                  FirebaseAuth.instance.currentUser!.displayName ?? "",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),
        Column(children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: 45,
              height: 45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      const Icon(
                        Icons.notifications,
                        color: Color.fromARGB(255, 97, 97, 97),
                        size: 30,
                      ),
                      if (notifications.isNotEmpty)
                        Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ])
      ],
    );
  }

  Widget renderFeaturedCoffee() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            products.map((product) => ProductCard(product: product)).toList(),
      ),
    );
  }

  Widget renderSearchBar() {
    return Padding(
      padding: const EdgeInsets.only(
          top: 15.0, left: 16.0, right: 16.0, bottom: 20.0),
      child: TextField(
        decoration: textfieldDecoration(
          const Icon(
            Icons.search,
            size: 30,
          ),
          "Search",
        ),
        controller: searchController,
      ),
    );
  }

  Widget renderFeaturedTitle() {
    return SizedBox(
      height: 50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: coffeeType.length,
          itemBuilder: (context, index) {
            return CoffeeType(
              coffeeType: coffeeType[index][0],
              isSelected: coffeeType[index][1],
              onTap: () => coffeeTypeSelected(index),
            );
          }),
    );
  }

  Widget renderSpecialsTitle() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Specials for you",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

//-------------------------------------------------------------------------\\

//-----------------------------Functionality--------------------------------\\

  @override
  void initState() {
    super.initState();
    Product product1 = Product(
      photoUrl:
          "https://consumerfiles.com/wp-content/uploads/2021/07/Is-Drinking-Espresso-Good-or-Bad-for-You-11-Health-Benefits-Espresso-Consumer-Files.webp",
      id: 1,
      name: 'Product 1',
      description: 'Description of Product 1',
      price: 10.99,
      rating: 4.4,
    );

    Product product2 = Product(
      photoUrl:
          "https://consumerfiles.com/wp-content/uploads/2021/07/Is-Drinking-Espresso-Good-or-Bad-for-You-11-Health-Benefits-Espresso-Consumer-Files.webp",
      id: 2,
      name: 'Product 2',
      description: 'Description of Product 2',
      price: 19.99,
      rating: 4.6,
    );
    Product product3 = Product(
      photoUrl:
          "https://consumerfiles.com/wp-content/uploads/2021/07/Is-Drinking-Espresso-Good-or-Bad-for-You-11-Health-Benefits-Espresso-Consumer-Files.webp",
      id: 3,
      name: 'Product 3',
      description: 'Description of Product 3',
      price: 10.99,
      rating: 4.4,
    );

    Product product4 = Product(
      photoUrl:
          "https://consumerfiles.com/wp-content/uploads/2021/07/Is-Drinking-Espresso-Good-or-Bad-for-You-11-Health-Benefits-Espresso-Consumer-Files.webp",
      id: 4,
      name: 'Product 4',
      description: 'Description of Product 4',
      price: 19.99,
      rating: 4.3,
    );

    products.add(product1);
    products.add(product2);
    products.add(product3);
    products.add(product4);
  }

  final List coffeeType = [
    ['All', true],
    ['Cuppucino', false],
    ['Espresso', false],
    ['Latte', false],
    ['Flat White', false],
    ['Hot Chocolate', false],
  ];

  void coffeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  String greeting() {
    final currentTime = DateTime.now();

    if (currentTime.hour >= 0 && currentTime.hour < 12) {
      return "Good Morning";
    } else if (currentTime.hour >= 12 && currentTime.hour < 18) {
      return "Good Afternoon";
    } else {
      return "Good Evening";
    }
  }

//--------------------------------------------------------------------------\\

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: mainBackgroundColour,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                renderHeaderSection(),
                renderSearchBar(),
                renderFeaturedTitle(),
                renderFeaturedCoffee(),
                renderSpecialsTitle(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
