import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oeber/methods/auth_methods.dart';
import 'package:oeber/pages/profile_page/profile_page.dart';
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
  String selectedType = 'All';

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
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfileHomeScreen(),
                      ),
                    ),
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

  List<Widget> renderFeaturedCoffee() {
    List<Widget> selectedDrink = [];

    for (var product in products) {
      if (selectedType == 'All') {
        selectedDrink.add(ProductCard(product: product));
      } else if (selectedType == product.type) {
        selectedDrink.add(ProductCard(product: product));
      }
    }
    return selectedDrink;
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
          "https://media.istockphoto.com/id/1030018926/photo/coffee-americano-it-made-from-espresso-and-hot-water-uk.jpg?s=612x612&w=0&k=20&c=trsNtjalA6r9eGka845eO1nYOP0yogvLWqBAg-jsBlM=",
      id: 1,
      name: 'Americano',
      description: 'No milk',
      price: 10.99,
      rating: 4.4,
      type: 'Espresso',
      detailedDescription:
          "A classic coffee drink that combines the boldness of espresso with the smoothness of hot water. The result is a balanced and satisfying cup that can be enjoyed black or with your choice of milk and sweetener.",
    );

    Product product2 = Product(
      photoUrl: "https://static.toiimg.com/photo/86699095.cms",
      id: 2,
      name: 'Flat White',
      description: 'Added sugar and milk',
      price: 19.99,
      rating: 4.6,
      type: 'Espresso',
      detailedDescription:
          "A flat white is made with two shots of espresso and steamed milk, with just a thin layer of foam on top. The flat white has a rich and balanced flavor, with the espresso shining through the velvety milk. Its perfect for those who love a strong coffee with a hint of sweetness.",
    );

    Product product3 = Product(
      photoUrl:
          "https://biteswithbri.com/wp-content/uploads/2021/11/ChaiLatte-blog-7-500x375.jpg",
      id: 3,
      name: 'Chai Latte',
      description: 'Contains cinnamon',
      price: 10.99,
      rating: 4.4,
      type: 'Latte',
      detailedDescription:
          "A warm and spicy drink that combines black tea with cinnamon, cardamom, cloves, ginger, and other spices, steamed milk, and a touch of sweetness. Its a fragrant and flavorful drink that can soothe the soul.",
    );

    Product product4 = Product(
      photoUrl:
          "https://www.eatclub.tv/wp-content/uploads/sites/4/2023/05/dirty-chai-latte.jpeg",
      id: 4,
      name: 'Dirty Chai',
      description: 'Contains coffee and tea',
      price: 19.99,
      rating: 4.3,
      type: 'Latte',
      detailedDescription:
          "A strong and spicy drink that combines espresso and masala chai, a black tea with cinnamon, cardamom, cloves, ginger, and other spices. Its a thrilling and aromatic drink that can perk you up.",
    );

    Product product5 = Product(
      photoUrl:
          "https://perfectdailygrind.com/wp-content/uploads/2020/03/Cortadito-1.png",
      id: 5,
      name: 'Cortado',
      description: 'Contains steamed milk',
      price: 19.99,
      rating: 4.3,
      type: 'Espresso',
      detailedDescription:
          "A strong and creamy drink that combines equal parts of espresso and steamed milk. Its a smooth and balanced drink that originated in Spain.",
    );

    Product product6 = Product(
      photoUrl:
          "https://dairyfarmersofcanada.ca/sites/default/files/styles/recipe_image/public/image_file_browser/conso_recipe/2022/Capuccino.jpg.jpeg?itok=J1pWPwe2",
      id: 6,
      name: 'Cappuccino',
      description: 'Super creamy',
      price: 18.99,
      rating: 4.3,
      type: 'Espresso',
      detailedDescription:
          "A strong and frothy drink that combines espresso and steamed milk. Its a creamy and full-bodied drink that originated in Italy.",
    );

    Product product7 = Product(
      photoUrl:
          "https://www.foodandhome.co.za/wp-content/uploads/2023/07/hot-chocolate-1080x608.png",
      id: 7,
      name: 'Hot Chocolate',
      description: 'High sugar',
      price: 19.99,
      rating: 4.3,
      type: 'Hot Chocolate',
      detailedDescription:
          "The hot chocolate has a rich and smooth flavor, with the chocolate satisfying your sweet tooth. Its perfect for those who love a warm and cozy drink that can comfort the soul.",
    );

    Product product8 = Product(
      photoUrl:
          "https://www.southernfatty.com/wp-content/uploads/2023/01/Salted-Caramel-White-Hot-Chocolate-SouthernFatty-2369-720x540.jpg",
      id: 8,
      name: 'White Chocolate',
      description: 'Contains white chocolate',
      price: 19.99,
      rating: 4.3,
      type: 'Hot Chocolate',
      detailedDescription:
          "The white hot chocolate has a smooth and delicate flavor, with the white chocolate adding a touch of vanilla. Its perfect for those who love a light and cozy drink that can brighten up their day.",
    );

    Product product9 = Product(
      photoUrl:
          "https://images.immediate.co.uk/production/volatile/sites/2/2021/11/Mocha-1fc71f7.png?resize=960,872",
      id: 9,
      name: 'Mocha',
      description: 'Coffee and chocolate',
      price: 19.99,
      rating: 4.3,
      type: 'Mocha',
      detailedDescription:
          "A strong and sweet drink that combines espresso, hot milk, and chocolate. Its a decadent and indulgent drink with foam or whipped cream on top.",
    );

    Product product10 = Product(
      photoUrl:
          "https://www.travelgluttons.com/wp-content/uploads/2014/12/espresso.jpeg",
      id: 10,
      name: 'Espresso',
      description: 'Very strong',
      price: 19.99,
      rating: 4.3,
      type: 'Espresso',
      detailedDescription:
          "Its made with finely ground coffee beans and hot water, which are forced through a metal filter under high pressure. The espresso has a thick layer of crema, the golden-brown foam that adds flavor and aroma. Its perfect for those who love a pure and powerful coffee that can wake them up.",
    );

    Product product11 = Product(
      photoUrl:
          "https://www.roastycoffee.com/wp-content/uploads/mBPxUtTx-720x540.jpeg",
      id: 11,
      name: 'Cafe Latte',
      description: 'Contains milk',
      price: 19.99,
      rating: 4.3,
      type: 'Espresso',
      detailedDescription:
          "A cafe latte is a smooth and creamy coffee drink that originated in France. Its made with a shot of espresso and steamed milk, with a thin layer of foam on top. The cafe latte has a mild and balanced flavor, with the milk reducing the acidity of the espresso. Its perfect for those who love a milky coffee with a touch of sweetness.",
    );

    Product product12 = Product(
      photoUrl:
          "https://assets.bonappetit.com/photos/57af6d4f53e63daf11a4e57c/master/w_1280%2Cc_limit/vietnamese-iced-coffee-646.jpg",
      id: 12,
      name: 'Ice Coffee',
      description: 'Contains ice cubes',
      price: 19.99,
      rating: 4.3,
      type: 'Espresso',
      detailedDescription:
          "A cold and sweet drink with brewed coffee, ice, milk, and sugar. Its a refreshing and energizing drink that originated in Algeria.",
    );

    Product product13 = Product(
      photoUrl:
          "https://delightfuladventures.com/wp-content/uploads/2019/01/vegan-mocha-frappe-image.jpg",
      id: 13,
      name: 'Mocha Frappe',
      description: 'Sweet and cold',
      price: 19.99,
      rating: 4.3,
      type: 'Mocha',
      detailedDescription:
          "A cold and sweet drink with espresso, milk, ice, and chocolate syrup. Its a decadent and indulgent drink with whipped cream on top.",
    );

    Product product14 = Product(
      photoUrl:
          "https://images.kitchenstories.io/recipeImages/16_01_140_ChocolatePeanutButterBananaMilkshake_Final_4x3.jpg",
      id: 14,
      name: 'ChocShake',
      description: 'Cold Choc Drink',
      price: 19.99,
      rating: 4.3,
      type: 'Milkshake',
      detailedDescription:
          "A cold and indulgent drink with milk, ice cream, and chocolate syrup. Its a rich and velvety drink that originated in the United States.",
    );

    products.add(product1);
    products.add(product2);
    products.add(product3);
    products.add(product4);
    products.add(product5);
    products.add(product6);
    products.add(product7);
    products.add(product8);
    products.add(product9);
    products.add(product10);
    products.add(product11);
    products.add(product12);
    products.add(product13);
    products.add(product14);
  }

  final List coffeeType = [
    ['All', true],
    ['Espresso', false],
    ['Latte', false],
    ['Hot Chocolate', false],
    ['Mocha', false],
    ['Milkshake', false],
  ];

  void coffeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
      selectedType = coffeeType[index][0];
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: renderFeaturedCoffee()),
                ),
                renderSpecialsTitle(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
