// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'test.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

    // You can handle navigation to different screens based on the index
  

  final List<Widget> _pages = [
    HomeConPage(), // Use HomeConPage as the main page
    TestPage(),
    TestPage(),
    TestPage(),
    TestPage(),
    // Add additional pages here if needed
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 254, 254),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              button(context);
            },
            icon: Image.asset('assets/ok.png')
          )
        ],
        title: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Row(
            children: [
              Image.asset(
                'assets/circle.png',
                height: 40,
                width: 60,
              ),
              SizedBox(width: 5),
              Text(
                "Stylish",
                style: GoogleFonts.saira(
                  color: const Color.fromRGBO(67, 146, 249, 1.0),
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                ),
              )
            ],
          ),
        ),
      ),

       // Creating a functional drawer
       
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text("Demo 1"),
              onTap: () {},
            ),
            ListTile(
              title: Text("Demo 2"),
              onTap: () {},
            )
          ],
        ),
      ),

      // Bottom Navigation Bar

      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

void button(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Alert'),
        content: Text('Button works'),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
        ],
      );
    },
  );
}

class HomeConPage extends StatelessWidget {
  const HomeConPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [

              // Search bar

              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search any Product",
                    hintStyle: GoogleFonts.saira(fontSize: 20),
                    border: InputBorder.none,

                    //adding icons to the search bar

                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    suffixIcon: Icon(Icons.mic, color: Colors.grey),
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ),
              SizedBox(height: 10),

              // Sorting and filter row

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "All Featured",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                      ),
                    ),
                    SizedBox(width: 60),
                    Text("Sort", style: GoogleFonts.roboto(fontSize: 20)),
                    IconButton(
                      onPressed: () {
                        button(context);
                      },
                      icon: Image.asset(
                        "assets/sort.png",
                        color: Colors.black,
                      )
                    ),
                    Text("Filter", style: GoogleFonts.roboto(fontSize: 20)),
                    IconButton(
                      onPressed: () {
                        button(context);
                      },
                      icon: Image.asset(
                        "assets/f1.png",
                        color: Colors.black,
                      )
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Column with Multiple Circle containers

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    // BEAUTY Container
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            button(context);
                          },
                          child: Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage("assets/beauty.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text("Beauty")
                      ],
                    ),
                    SizedBox(width: 5),

                    // Fashion Container
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            button(context);
                          },
                          child: Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage("assets/fashion.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text("Fashion")
                      ],
                    ),
                    SizedBox(width: 5),

                    // KIDS Container
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            button(context);
                          },
                          child: Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage("assets/kids.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text("Kids")
                      ],
                    ),
                    SizedBox(width: 5),

                    // MEN Container
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            button(context);
                          },
                          child: Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage("assets/men.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text("Men")
                      ],
                    ),
                    SizedBox(width: 5),

                    // WOMEN Container
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            button(context);
                          },
                          child: Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage("assets/women.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text("Women")
                      ],
                    ),
                    SizedBox(width: 5),
                  ],
                ),
              ),

              // Discount big pink banner

              Padding(
                padding: const EdgeInsets.only(right: 40),
                child: SizedBox(
                  width: 350,
                  height: 200,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Positioned.fill(
                        child: Image.asset(
                          'assets/pink.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        top: 30,
                        left: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "50-60% OFF",
                              style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Now in (Product)",
                              style: GoogleFonts.roboto(
                                fontSize: 15,
                                color: Colors.white
                              ),
                            ),
                            Text(
                              "All colours",
                              style: GoogleFonts.roboto(
                                fontSize: 15,
                                color: Colors.white
                              ),
                            ),
                            SizedBox(height: 12),
                            // Shop now button
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Alert'),
                                      content: Text('Button works'),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text('OK'),
                                          onPressed: () {
                                            Navigator.of(context).pop(); // Close the dialog
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8), // Add padding for better spacing
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min, // Ensures the Row takes minimum space
                                  children: <Widget>[
                                    Text(
                                      "Shop Now",
                                      style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),

              // Blue Box
              
              Container(
                margin: EdgeInsets.only(right: 40),
                width: 350,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  children: [
                    // Add the text to the blue container
                    Positioned(
                      left: 15, // Adjust the position as needed
                      top: 25,
                      child: Text(
                        "Deal of the Day", // Text inside the blue container
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 23,
                        ),
                      ),
                    ),
                    // The inner container with the button
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(left: 180),
                        width: 120,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: GestureDetector(
                            onTap: () {
                              button(context); // Action for the button
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min, // Ensures the Row takes minimum space
                              children: <Widget>[
                                Text(
                                  "View all",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),

              // Grid View
              SizedBox(
                height: 400,
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('Products')
                    .where(FieldPath.documentId, whereIn: ['1', '2', '3'])
                    .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Center(child: Text('No Data Available'));
                    }

                    var products = snapshot.data!.docs;

                    return GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1, // 1 item per row
                        crossAxisSpacing: 1.0, // Space between columns
                        mainAxisSpacing: 0, // Space between rows
                        childAspectRatio: 2 / 1, // Aspect ratio of each grid item
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        var product = products[index].data() as Map<String, dynamic>;

                        return Card(
                          color: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              button(context);
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Image.network(
                                    product['_imageUrl'] ?? '',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product['name'] ?? 'Unknown',
                                        style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        product['details'] ?? 'No details available',
                                        style: GoogleFonts.roboto(fontSize: 14),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        '\$${product['price'] ?? '0.00'}',
                                        style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Row(
                                        children: [
                                          for (var i = 1; i <= 5; i++)
                                            Icon(
                                              i <= product['rating']
                                                  ? Icons.star
                                                  : (i - product['rating'] < 1 &&
                                                      i - product['rating'] > 0)
                                                      ? Icons.star_half
                                                      : Icons.star_border,
                                              color: Colors.orange,
                                              size: 16,
                                            ),
                                          SizedBox(width: 4),
                                          Text(
                                            '${product['rating'] ?? '0.0'}',
                                            style: const TextStyle(fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
                              
