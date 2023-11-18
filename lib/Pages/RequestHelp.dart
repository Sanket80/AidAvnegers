// // 1. Add RequestHelp Text along with profile icon in a row
// // 2. Add 2 buttons in a row for request help and map view, i need buttons to be tapable
// // 3. A card with black border it contains organization profile icon and help id
// // 4. 2 texts to display selected category from HomeScreen and categroy selected from CategoryScreen along with count
// // 5. Text to display the discription of the help
// // 6. A text box with location of organization
// // 7. A button to request help
// // 8. A button to cancel the request
// // 9. 4 buttons in a row for home, timeline, contacts and raise alert
//
// import 'package:aidavengers/Pages/MapView.dart';
// import 'package:flutter/material.dart';
//
// import '../DummyData/CategoryDummyData.dart';
// import 'Alert.dart';
// import 'HomeScreen.dart';
//
// class RequestHelp extends StatefulWidget {
//   const RequestHelp({super.key, required this.mainCategory ,required this.selectedCategoryData});
//
//   final CategoryData selectedCategoryData;
//   final String mainCategory;
//
//   @override
//   State<RequestHelp> createState() => _RequestHelpState();
// }
//
// class _RequestHelpState extends State<RequestHelp> {
//   bool isButtonPressed = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: Column(
//             // 1. Add RequestHelp Text along with profile icon in a row
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(
//                   left: 20,
//                   right: 16,
//                   top: 8,
//                 ),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Text(
//                           'Request Help',
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Container(
//                           width: 40,
//                           height: 40,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             border: Border.all(
//                               color: Colors.black,
//                               width: 1.0,
//                             ),
//                           ),
//                           child: Icon(
//                             Icons.person,
//                             size: 30,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 16,
//                     ),
//                     // 2. Add 2 buttons in a row for request help and map view, i need buttons to be tapable
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         InkWell(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => HomeScreen()));
//                           },
//                           child: Container(
//                             width: 150,
//                             height: 50,
//                             decoration: BoxDecoration(
//                               color: Colors.grey[600], // Adjusted color here
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: Center(
//                               child: Text(
//                                 'List of Help',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         InkWell(
//                           onTap: () {
//                             // Handle the button tap for 'Map View'
//                             Navigator.push(context, MaterialPageRoute(builder: (context) => MapView()));
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.only(
//                               left: 20,
//                             ),
//                             child: Container(
//                               width: 150,
//                               height: 50,
//                               decoration: BoxDecoration(
//                                 color: Colors.grey[300], // Adjusted color here
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   'Map View',
//                                   style: TextStyle(
//                                     color: Colors.black87,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 26,
//                     ),
//                     // 3. A card with black border it contains organization profile icon and help id
//                     Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: Colors.black,
//                           width: 1.0,
//                         ),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       padding: const EdgeInsets.all(16),
//                       child: Column(
//                         children: [
//                           Row(
//                             children: [
//                               const SizedBox(width: 90),
//                               // Help ID
//                               Text(
//                                 'Help ID: ABC123', // Replace with the actual help ID
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(
//                             height: 25,
//                           ),
//                           // 4. 2 texts to display selected category from HomeScreen and categroy selected from CategoryScreen along with count
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Container(
//                                 padding: EdgeInsets.all(8),
//                                 decoration: BoxDecoration(
//                                   color: Colors.grey[300],
//                                 ),
//                                 child: Text(
//                                   widget.mainCategory, // Replace with the actual category
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.black87,
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 padding: EdgeInsets.all(8),
//                                 decoration: BoxDecoration(
//                                   color: Colors.grey[300],
//                                 ),
//                                 child: Text(
//                                   '${widget.selectedCategoryData.category}: ${widget.selectedCategoryData.count}', // Concatenate subCategory and count
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.black87,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(
//                             height: 30,
//                           ),
//                           // 5. Text to display the discription of the help
//                           Text(
//                             widget.selectedCategoryData
//                                 .description, // Replace with the actual description
//                             style: TextStyle(
//                               fontSize: 16,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 30,
//                           ),
//                           // 6. A text box with location of organization
//                           Container(
//                             padding: const EdgeInsets.all(8),
//                             decoration: BoxDecoration(
//                               color: Colors.grey[300],
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: RichText(
//                               text: TextSpan(
//                                 children: [
//                                   TextSpan(
//                                     text: 'Location: ',
//                                     style: TextStyle(
//                                       color: Colors.black87,
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   TextSpan(
//                                     text: 'ABC Road Pune, Maharashtra, India',
//                                     style: TextStyle(
//                                       color: Colors.black87,
//                                       fontSize: 16,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 30,
//                           ),
//                           // 7. A button to request help
//                           Container(
//                             width: MediaQuery.of(context).size.width / 2,
//                             height: 50,
//                             decoration: BoxDecoration(
//                               color:
//                               isButtonPressed ? Colors.green : Colors.grey[600],
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: TextButton(
//                               onPressed: () {
//                                 // Handle the button tap for 'Request Help'
//                                 setState(() {
//                                   isButtonPressed = !isButtonPressed;
//                                 });
//                               },
//                               child: Text(
//                                 "Request",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 18,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                   ],
//                 ),
//               ),
//               // 9. 4 buttons in a row for home, timeline, contacts and raise alert
//               Container(
//                 color: Colors.grey[300],
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       _buildBottomButton(Icons.home, 'Home', HomeScreen()),
//                       // _buildBottomButton(Icons.timeline, 'Timeline', TimelineScreen()),
//                       // _buildBottomButton(Icons.contacts, 'Contacts', ContactsScreen()),
//                       _buildBottomButton(Icons.add_alert, 'Raise Alert', Alert()),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//       ),
//     );
//   }
//
//   Widget _buildBottomButton(IconData icon, String label, Widget screen) {
//     return InkWell(
//       onTap: () {
//         // Handle the tap for the button
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => screen),
//         );
//       },
//       child: Column(
//         children: [
//           Center(
//             child: Icon(
//               icon,
//               color: Colors.black87,
//               size: 35,
//             ),
//           ),
//
//           const SizedBox(
//             height: 4,
//           ),
//           Text(
//             label,
//             style: TextStyle(
//               color: Colors.black87,
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
