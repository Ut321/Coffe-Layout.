import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'coffee_tile.dart';
import 'coffee_type.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //list of coffee types
  final List coffeeType = [
     //[coffee, isSelected]
    [
      'cappucino',
      true,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Tea',
      false,
    ],
  ];

// user trapped on coffee Types
  void coffeeTypedSelected(index) {
    setState(() {
      // this for loop makes every selection false
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Icon(Icons.menu),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(Icons.person),
            )
          ]),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text("Find the best cofee for you ",
                style: GoogleFonts.bebasNeue(
                  fontSize: 56,
                )),
          ),
          SizedBox(
            height: 25,
          ),
          //horizontal List View of coffee types
          Container(
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: coffeeType.length,
                  itemBuilder: (context, index) {
                    return CoffeeType(
                      coffeeType: coffeeType[index][0],
                      isSelected: coffeeType[index][1],
                      onTap: () {
                        coffeeTypedSelected(index);
                      },
                    );
                  })),

          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Find your coffee...',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CoffeeTile(
                coffeeImagePath: 'assets/images/coffee2.jpg',
                coffeeName: 'Latte',
                coffeePrice: '4.20',
              ),
              CoffeeTile(
                coffeeImagePath: 'assets/images/coffee2.jpg',
                coffeeName: 'Black',
                coffeePrice: '4.50',
              ),
              CoffeeTile(
                coffeeImagePath: 'assets/images/lake.jpg',
                coffeeName: 'Milk',
                coffeePrice: '4.60',
              ),
            ],
          ))
        ],
      ),
    );
  }
}
