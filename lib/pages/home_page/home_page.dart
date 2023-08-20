import 'package:flutter/material.dart';
import 'package:oeber/pages/coffee_pages/cuppucino_detail.dart';
import 'package:oeber/util/coffee_type.dart';

import '../../widgets/input_textfield_decoration.dart';

class FollowingPage extends StatefulWidget {
  const FollowingPage({Key? key}) : super(key: key);

  @override
  _FollowingPageState createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage> {
  TextEditingController searchController = TextEditingController();

//------------------------------Widget Rendering------------------------------\\
  Widget renderHeaderSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Row(
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
                      // onTap: () => Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const ProfileHomeScreen(),
                      //   ),
                      // ),
                      child: const CircleAvatar(
                        radius: 35,
                        backgroundImage: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiYXE8Ek1M_tOGkdTGsgLwLQe3UPdBMGcfYg&usqp=CAU"),
                      ),
                    ),
                  ),
                ],
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Good Evening 👋",
                    style: TextStyle(
                      fontSize: 19,
                    ),
                  ),
                  Text(
                    "John Doe",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      //color: primaryColour,
                      width: 2.0,
                    ),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        child: Icon(
                          Icons.notifications,
                          color: Color.fromARGB(255, 97, 97, 97),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget renderFeaturedCoffee() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            height: 345, //345
            width: 250, //width 300
            padding: const EdgeInsets.all(20), //20
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), //10
              color: const Color(0xFF1F222A),
            ),
            child: Column(
              children: [
                const ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                  child: Image(
                    image: NetworkImage(
                      'https://images.pexels.com/photos/2396220/pexels-photo-2396220.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                    ),
                    height: 200,
                    width: 400, //400
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Cuppucino',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      const Row(
                        children: [
                          Text(
                            'With Cream',
                            style: TextStyle(
                                //color: primaryColour,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    'R 30.00',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const CuppucinoDetailsScreen(),
                                  ));
                            },
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.circular(6)),
                                  child: const Icon(
                                    Icons.add,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            height: 345,
            width: 250, //width 300
            padding: const EdgeInsets.all(20), //20
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), //10
              color: const Color(0xFF1F222A),
            ),
            child: Column(
              children: [
                const ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                  child: Image(
                    image: NetworkImage(
                      'https://media.cnn.com/api/v1/images/stellar/prod/150929101049-black-coffee-stock.jpg?q=x_3,y_1231,h_1684,w_2993,c_crop/h_720,w_1280',
                    ),
                    height: 200,
                    width: 400,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Black coffee',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      const Row(
                        children: [
                          Text(
                            'No Milk',
                            style: TextStyle(),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    'R 32.00',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(6)),
                                child: const Icon(
                                  Icons.add,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
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
    return Container(
      height: 50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: coffeeType.length,
          itemBuilder: (context, index) {
            return CoffeeType(
              coffeeType: coffeeType[index][0],
              isSelected: coffeeType[index][1],
              onTap: () {
                coffeeTypeSelected(index);
              },
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

  final List coffeeType = [
    ['Cuppucino', true],
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

//--------------------------------------------------------------------------\\

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(235, 219, 204, 120),
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
    );
  }
}
