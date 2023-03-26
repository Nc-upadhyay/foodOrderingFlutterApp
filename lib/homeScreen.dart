import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var listOfCatergry = [
    "1.png",
    "2.png",
    "3.png",
    "4.png",
    "5.png",
    "6.png",
    "7.png",
    "8.png",
    "9.png"
  ];
  var listOfCatergryName = [
    "Burger",
    "Recipe",
    "Pizza",
    "Drink",
    "Burger",
    "Recipe",
    "Pizza",
    "Drink",
    "tt"
  ];

  Widget foodCatergryContainer(int po) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          margin: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage('images/${listOfCatergry[po]}'))),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          listOfCatergryName[po].toString(),
          style: TextStyle(color: Colors.white, fontSize: 15),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2b2b2b),
      appBar: AppBar(
        backgroundColor: Color(0xff2b2b2b),
        elevation: 0.0,
        leading: Icon(Icons.sort),
        actions: [
          Padding(
            padding: EdgeInsets.all(9.0),
            child: CircleAvatar(
              backgroundImage: AssetImage("images/profile.jpg"),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Search Food',
                    hintStyle: TextStyle(color: Colors.white, fontSize: 15),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    filled: true,
                    fillColor: Color(0xff3b3b3b),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                height: 120,
                width: 400,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int position) {
                      return foodCatergryContainer(position);
                    },
                    itemCount: listOfCatergry.length),
              ),
            ),
            SizedBox(
              height: 500,
              width: 400,
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return middleContainer(index);
                },
                itemCount: listOfCatergry.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget makeStart() {
    return Icon(
      Icons.star,
      color: Colors.white,
      size: 20,
    );
  }

  Widget middleContainer(int po) {
    return Container(
      height: 660,
      width: 200,
      decoration: BoxDecoration(
          color: Color(0xff3b3b3b), borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("images/${listOfCatergry[po]}"),
            radius: 60,
          ),
          ListTile(
            leading: Text(
              listOfCatergryName[po],
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            trailing: Text(
              '\$123',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                makeStart(),
                makeStart(),
                makeStart(),
                makeStart(),
                makeStart()
              ],
            ),
          )
        ],
      ),
    );
  }
}
