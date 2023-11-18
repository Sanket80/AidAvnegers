// Now i want to design the home screen of the app
// It contains a home text and a user profile icon in single row at the starting of screen
// It contains 2 buttons side by side in a row for viewing the list of help and map view
// A text for categories and prefix a categories icon
// A list of categories with 2 categories in a row(make it scrollable) and each category contains a category icon and a category name , must be card view
// At the bottom of screen 4 buttons in a row for home, timeline, contacts and raise alert

import 'dart:collection';

import 'package:aidavengers/Pages/CategoryScreen.dart';
import 'package:aidavengers/Pages/Alert.dart';
import 'package:aidavengers/Pages/MapView.dart';
import 'package:flutter/material.dart';

import 'Alert.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 16,
                top: 8,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Home',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                        child: Icon(
                          Icons.person,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          // Handle the button tap for 'List of Help'
                        },
                        child: Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey[600], // Adjusted color here
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              'List of Help',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // Handle the button tap for 'Map View'
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MapView(
                                latitude: 19.0169152339643,
                                longitude: 73.09627963399967,
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                          ),
                          child: Container(
                            width: 150,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey[300], // Adjusted color here
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                'Map View',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.list_alt_outlined,
                        color: Colors.grey[500],
                        size: 30,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const Text(
                        'Categories',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 25,
                  mainAxisSpacing: 20,
                  children: [
                    _buildCategoryContainer(Icons.food_bank, 'Food'),
                    _buildCategoryContainer(Icons.medical_services, 'Medical'),
                    _buildCategoryContainer(Icons.person, 'Human Resources'),
                    _buildCategoryContainer(Icons.search, 'Search and Rescue'),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // Now at the bottom of screen 4 buttons in a row for home, timeline, contacts and raise alert along with their icons and labels
            Container(
              color: Colors.grey[300],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildBottomButton(Icons.home, 'Home', HomeScreen()),
                    // _buildBottomButton(Icons.timeline, 'Timeline', TimelineScreen()),
                    // _buildBottomButton(Icons.contacts, 'Contacts', ContactsScreen()),
                    _buildBottomButton(Icons.add_alert, 'Raise Alert', Alert()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomButton(IconData icon, String label, Widget screen) {
    return InkWell(
      onTap: () {
        // Handle the tap for the button
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Column(
        children: [
          Center(
            child: Icon(
              icon,
              color: Colors.black87,
              size: 35,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            label,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryContainer(IconData icon, String label) {
    return InkWell(
      onTap: () {
        // Navigate to the category screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryScreen(selectedCategory: label),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[700], // Adjusted color here
              ),
              child: Center(
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              label,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
