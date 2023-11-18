// 1. Add help text and profile icon in a row
// 2. Add 2 buttons in a row for help and map view
// 3. Add the selected category text and category icon prefix to it
// 4. Add the list of categories related to selected category and 1 category in a row with card view
// and cards must be scrollable with text inside those items and cards are tapable , so that i can navigate further
// 5. Add 4 buttons in a row at the bottom of screen for home, timeline, contacts and raise alert

import 'dart:collection';

import 'package:aidavengers/Pages/Alert.dart';
import 'package:aidavengers/Pages/RequestHelp.dart';
import 'package:aidavengers/Pages/MapView.dart';
import 'package:flutter/material.dart';

import '../DummyData/CategoryDummyData.dart';
import 'HomeScreen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, required this.selectedCategory});

  final String selectedCategory;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late List<CategoryData> categoryDataList;

  @override
  void initState() {
    super.initState();
    // Add the code to fetch the list of categories related to the selected category
    // You can use the selected category name to fetch the list of categories
    // For example, if the selected category is 'Food', you can fetch the list of categories related to 'Food'
    categoryDataList =
        CategoryDataRepository.categoryData[widget.selectedCategory] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          // 1. Add help text and profile icon in a row
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
                        'Help',
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
                  // 2. Add 2 buttons in a row for help and map view, i need buttons to be tapable
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
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
                  // 3. Add the selected category text and category icon prefix to it
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // i want icon for the selected category
                      Icon(
                        Icons.medical_services_outlined,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        widget.selectedCategory,
                        style: TextStyle(
                          fontSize: 25,
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

            // 4. Add the list of categories related to selected category and 1 category in a row with card view
            // and cards must be scrollable with text inside those items and cards are tapable , so that i can navigate further
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 16,
                ),
                child: ListView.builder(
                  itemCount: categoryDataList.length ?? 0,
                  itemBuilder: (context, index) {
                    return _buildCategoryCard(categoryDataList[index]);
                  },
                ),
              ),
            ),
            // 5. Add 4 buttons in a row at the bottom of screen for home, timeline, contacts and raise alert
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

  // Helper method to build a category card
  Widget _buildCategoryCard(CategoryData categoryData) {
    return InkWell(
      onTap: () {
        // Handle the tap for the card, navigate to the next screen
        // You can pass additional information related to the tapped category
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MapView(
              latitude: categoryData.latitude, // Pass latitude to MapView
              longitude: categoryData.longitude, // Pass longitude to MapView
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '${categoryData.category}',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  ': ${categoryData.count}',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Organization: ${categoryData.organization}',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
