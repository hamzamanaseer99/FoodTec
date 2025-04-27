// import 'package:flutter/material.dart';
// import 'package:foodtek/responsive.dart';
// import 'package:foodtek/view/screens/chat%20screen.dart';
// import 'package:foodtek/view/screens/live_track_screen.dart';
//
// class OrderDetailsScreen extends StatefulWidget {
//   const OrderDetailsScreen({Key? key}) : super(key: key);
//
//   @override
//   _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
// }
//
// class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
//   int _currentNavIndex = 2;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       body: SafeArea(
//         child: SingleChildScrollView( // This will ensure the content is scrollable
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal:responsiveWidth(context, 24)),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     BackButton(),
//                     Text(
//                       'Order Details',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.w600,
//                         fontSize: responsiveWidth(context, 20),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: responsiveHeight(context, 35)),
//                 _buildOrderInfoRow('Order ID', '#6579-6432', '25m'),
//                 SizedBox(height: responsiveHeight(context, 20)),
//
//                 _buildTrackingProgress(),
//                 SizedBox(height: responsiveHeight(context, 24),),
//
//                 _buildDeliveryPersonInfo(),
//                 SizedBox(height: responsiveHeight(context, 16),),
//                 Divider(),
//                 SizedBox(height: responsiveHeight(context, 10),),
//                 _buildLocationSection(),
//                 SizedBox(height: responsiveHeight(context, 32),),
//
//                 _buildLiveTrackButton(),
//                 SizedBox(height: responsiveHeight(context, 40),),
//               ],
//             ),
//           ),
//         ),
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: () {
//       //     setState(() => _currentNavIndex = 2);
//       //   },
//       //   backgroundColor: Colors.green,
//       //   child: Icon(Icons.location_on, color: Colors.white),
//       //   elevation: 2.0,
//       // ),
//       // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       // bottomNavigationBar: _buildBottomAppBar(context, _currentNavIndex),
//     );
//   }
//
//   // Widget _buildBottomAppBar(BuildContext context, int currentIndex) {
//   //   return BottomAppBar(
//   //     shape: const CircularNotchedRectangle(),
//   //     notchMargin: 4.0,
//   //     color: Colors.green[100],
//   //     child: Row(
//   //       mainAxisAlignment: MainAxisAlignment.spaceAround,
//   //       children: [
//   //         _buildNavItem(context, Icons.home_outlined, "Home", 0, currentIndex),
//   //         _buildNavItem(
//   //             context, Icons.favorite_outline, "Favorites", 1, currentIndex),
//   //         const SizedBox(width: 48),
//   //         _buildNavItem(context, Icons.history, "History", 2, currentIndex),
//   //         _buildNavItem(
//   //             context, Icons.person_outline_outlined, "Profile", 3, currentIndex),
//   //       ],
//   //     ),
//   //   );
//   // }
//
//   Widget _buildNavItem(
//       BuildContext context, IconData icon, String label, int index, int currentIndex) {
//     return GestureDetector(
//       onTap: () {
//         setState(() => _currentNavIndex = index);
//       },
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(
//             icon,
//             color: currentIndex == index ? Colors.green : Colors.black54,
//             size: 28,
//           ),
//           Text(
//             label,
//             style: TextStyle(
//               color: currentIndex == index ? Colors.green : Colors.black54,
//               fontSize: 12,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildOrderInfoRow(String label, String value, String time) {
//     return Padding(
//       padding: EdgeInsets.all(16.0),
//       child: Row(
//         children: [
//           Image.asset(
//             'assets/images/takeaway_2702533 1.png',
//             height: responsiveHeight(context, 44),
//             width: responsiveWidth(context, 44),
//           ),
//           SizedBox(width: responsiveWidth(context, 12)),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('$label ',
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: responsiveWidth(context, 16))),
//               Text(value,
//                   style: TextStyle(fontSize: responsiveWidth(context, 10))),
//               Text(time,
//                   style: TextStyle(fontSize: responsiveWidth(context, 12))),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildTrackingProgress() {
//     final steps = [
//       {"label": "Order received", "icon": Icons.check, "done": true},
//       {"label": "Cooking your order", "icon": Icons.home_filled, "done": true},
//       {"label": "Courier is picking up order", "icon": Icons.person, "done": true},
//       {"label": "Order delivered", "icon": Icons.home, "done": false},
//     ];
//
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16.0),
//       child: Column(
//         children: List.generate(steps.length, (index) {
//           final step = steps[index];
//           final isLast = index == steps.length - 1;
//
//           return Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Column(
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: (step['done'] as bool) ? Colors.green : Colors.grey[300],
//                     ),
//                     padding: const EdgeInsets.all(8),
//                     child: Icon(
//                       step['icon'] as IconData,
//                       size: 20,
//                       color: (step['done'] as bool) ? Colors.white : Colors.grey,
//                     ),
//                   ),
//                   if (!isLast)
//                     Container(
//                       width: 2,
//                       height: responsiveHeight(context, 40),
//                       color: (step['done'] as bool) ? Colors.green : Colors.grey[300],
//                     ),
//                 ],
//               ),
//
//               SizedBox(width: 12),
//               Padding(
//                 padding: const EdgeInsets.only(top: 8.0),
//                 child: Text(
//                   step['label'] as String,
//                   style: TextStyle(
//                     fontSize: responsiveWidth(context, 16),
//                     fontWeight: FontWeight.w500,
//                     color: (step['done'] as bool) ? Colors.black : Colors.grey,
//                   ),
//                 ),
//               ),
//             ],
//           );
//         }),
//       ),
//     );
//   }
//
//   Widget _buildDeliveryPersonInfo() {
//     return Padding(
//       padding: EdgeInsets.all(16.0),
//       child: Row(
//         children: [
//           CircleAvatar(
//             radius: 28,
//             backgroundColor: Colors.green.withOpacity(0.2),
//             child: ClipOval(
//               child: Image.asset(
//                 "assets/images/deleviry_hero.png",
//                 fit: BoxFit.cover,
//                 width: 56, // double the radius
//                 height: 56,
//               ),
//             ),
//           ),
//
//           SizedBox(width: responsiveWidth(context, 12)),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Your Delivery Hero',
//                     style:
//                     TextStyle(fontSize: responsiveWidth(context, 12),
//                         fontWeight: FontWeight.bold,
//                     color: Color(0xff878787)
//                     ),
//                 ),
//                 SizedBox(height: 4),
//                 Row(
//                   children: [
//                     Text('Aleksandr V. ',
//                         style: TextStyle(fontSize: 14,
//                             color: Color(0xff2F2E36),
//                         ),
//                     ),
//                     SizedBox(width: responsiveWidth(context, 8)),
//                     Icon(Icons.star, color: Colors.amber, size: 16),
//                     SizedBox(width: responsiveWidth(context, 4)),
//
//                     Text('4,9',style: TextStyle(
//                       fontSize: responsiveWidth(context, 12),
//                       color: Color(0xffB8B8B8),
//                       fontWeight: FontWeight.w400
//                     ),)
//                   ],
//                 ),
//
//
//               ],
//             ),
//           ),
//           Stack(
//             children:[
//               Container(
//                 width: responsiveWidth(context, 40),
//                 height: responsiveHeight(context, 40),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(40),
//                   color: Color(0xffF5F5F5),
//                 ),
//               child: Icon(Icons.call,
//                   color: Colors.green,
//               size: responsiveWidth(context, 22),),
//               ),
//             ]
//           ),
//           SizedBox(width: responsiveWidth(context, 12),),
//           Stack(
//               children:[
//                 Container(
//                   width: responsiveWidth(context, 40),
//                   height: responsiveHeight(context, 40),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(40),
//                     color: Color(0xffF5F5F5),
//                   ),
//                   child: IconButton(onPressed: (){
//                     Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen())
//                     );
//                   },
//                       icon: Icon(Icons.chat,color: Color(0xffF2AB58),
//                         size: responsiveWidth(context, 22),
//                       )
//                   )
//
//                 ),
//               ]
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget _buildLocationSection() {
//     return  Padding(
//       padding:  EdgeInsets.symmetric(horizontal: responsiveWidth(context, 24)),
//       child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Text('your location',
//                     style:
//                     TextStyle(fontSize: responsiveWidth(context, 12),
//                         color: Color(0xff878787),
//                         fontWeight: FontWeight.w500)
//                 ),
//                  ],
//             ),
//             SizedBox(
//               height: responsiveHeight(context, 12),
//             ),
//             Row(
//               children: [
//                 Icon(Icons.location_on, color: Colors.green, size: 20),
//                 SizedBox(width: responsiveWidth(context, 12)),
//                 Text('123 Al-Madina Street, Abdali, Amman, Jordan',
//                     style: TextStyle(fontSize: responsiveWidth(context, 12),
//                       color: Color(0xff6C7278)
//                     )),
//
//               ],
//             ),
//
//
//           ],
//         ),
//     );
//
//   }
//
//   Widget _buildLiveTrackButton() {
//     return ElevatedButton(
//       onPressed: () {
//         Navigator.push(context, MaterialPageRoute(builder: (context)=>LiveTrackScreen()));
//       },
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Colors.green,
//         minimumSize: Size(double.infinity, 56),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//         padding: EdgeInsets.symmetric(vertical: 16),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//
//           SizedBox(width: 8),
//           Text(
//             'Live Track ',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//
//         ],
//       ),
//
//     );
//   }
// }

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foodtek/responsive.dart';
import 'package:foodtek/view/screens/chat%20screen.dart';
import 'package:foodtek/view/screens/live_track_screen.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  int _currentNavIndex = 2;

  @override
  Widget build(BuildContext context) {
    // Get current theme mode (light or dark)
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: responsiveWidth(context, 24)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    BackButton(
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                    Text(
                      'Order Details'.tr(),
                      style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: responsiveWidth(context, 20),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: responsiveHeight(context, 35)),
                _buildOrderInfoRow('Order ID'.tr(), '#6579-6432', '25m', isDarkMode),
                SizedBox(height: responsiveHeight(context, 20)),
                _buildTrackingProgress(isDarkMode),
                SizedBox(height: responsiveHeight(context, 24)),
                _buildDeliveryPersonInfo(isDarkMode),
                SizedBox(height: responsiveHeight(context, 16)),
                Divider(color: isDarkMode ? Colors.white : Colors.black),
                SizedBox(height: responsiveHeight(context, 10)),
                _buildLocationSection(isDarkMode),
                SizedBox(height: responsiveHeight(context, 32)),
                _buildLiveTrackButton(isDarkMode),
                SizedBox(height: responsiveHeight(context, 40)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOrderInfoRow(
      String label, String value, String time, bool isDarkMode) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          Image.asset(
            'assets/images/takeaway_2702533 1.png',
            height: responsiveHeight(context, 44),
            width: responsiveWidth(context, 44),
          ),
          SizedBox(width: responsiveWidth(context, 12)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('$label ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: responsiveWidth(context, 16),
                      color: isDarkMode ? Colors.white : Colors.black)),
              Text(value,
                  style: TextStyle(
                      fontSize: responsiveWidth(context, 10),
                      color: isDarkMode ? Colors.white : Colors.black)),
              Text(time,
                  style: TextStyle(
                      fontSize: responsiveWidth(context, 12),
                      color: isDarkMode ? Colors.white : Colors.black)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTrackingProgress(bool isDarkMode) {
    final steps = [
      {"label": "Order received".tr(), "icon": Icons.check, "done": true},
      {"label": "Cooking your order".tr(), "icon": Icons.home_filled, "done": true},
      {
        "label": "Courier is picking up order".tr(),
        "icon": Icons.person,
        "done": true
      },
      {"label": "Order delivered".tr(), "icon": Icons.home, "done": false},
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: List.generate(steps.length, (index) {
          final step = steps[index];
          final isLast = index == steps.length - 1;

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (step['done'] as bool)
                          ? Colors.green
                          : (isDarkMode ? Colors.grey[800] : Colors.grey[300]),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      step['icon'] as IconData,
                      size: 20,
                      color: (step['done'] as bool)
                          ? Colors.white
                          : (isDarkMode ? Colors.grey[700] : Colors.grey[300]),
                    ),
                  ),
                  if (!isLast)
                    Container(
                      width: 2,
                      height: responsiveHeight(context, 40),
                      color: (step['done'] as bool)
                          ? Colors.white
                          : (isDarkMode ? Colors.grey[700] : Colors.grey[300]),
                    ),
                ],
              ),
              SizedBox(width: 12),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  step['label'] as String,

          style: TextStyle(
                    fontSize: responsiveWidth(context, 16),
                    fontWeight: FontWeight.w500,
                    color: (step['done'] as bool)
                        ? isDarkMode ? Colors.white : Colors.black
                        : (isDarkMode ? Colors.white : Colors.black),
                  ),

                ),
          ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildDeliveryPersonInfo(bool isDarkMode) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.green.withOpacity(0.2),
            child: ClipOval(
              child: Image.asset(
                "assets/images/deleviry_hero.png",
                fit: BoxFit.cover,
                width: 56, // double the radius
                height: 56,
              ),
            ),
          ),
          SizedBox(width: responsiveWidth(context, 12)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Your Delivery Hero'.tr(),
                    style: TextStyle(
                        fontSize: responsiveWidth(context, 12),
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : Color(0xff878787))),
                SizedBox(height: 4),
                Row(
                  children: [
                    Text('Aleksandr V. ',
                        style: TextStyle(
                            fontSize: 14,
                            color:
                                isDarkMode ? Colors.white : Color(0xff2F2E36))),
                    SizedBox(width: responsiveWidth(context, 8)),
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    SizedBox(width: responsiveWidth(context, 4)),
                    Text('4,9',
                        style: TextStyle(
                            fontSize: responsiveWidth(context, 12),
                            color:
                                isDarkMode ? Colors.white : Color(0xffB8B8B8),
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                width: responsiveWidth(context, 40),
                height: responsiveHeight(context, 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: isDarkMode ? Colors.grey[800] : Color(0xffF5F5F5),
                ),
                child: Icon(Icons.call,
                    color: Colors.green, size: responsiveWidth(context, 22)),
              ),
            ],
          ),
          SizedBox(width: responsiveWidth(context, 12)),
          Stack(
            children: [
              Container(
                width: responsiveWidth(context, 40),
                height: responsiveHeight(context, 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: isDarkMode ? Colors.grey[800] : Color(0xffF5F5F5),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ChatScreen()));
                  },
                  icon: Icon(Icons.chat,
                      color: Color(0xffF2AB58),
                      size: responsiveWidth(context, 22)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLocationSection(bool isDarkMode) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsiveWidth(context, 24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('your location'.tr(),
                  style: TextStyle(
                      fontSize: responsiveWidth(context, 12),
                      color: isDarkMode ? Colors.white : Color(0xff878787),
                      fontWeight: FontWeight.w500)),
            ],
          ),
          SizedBox(height: responsiveHeight(context, 12)),
          Row(
            children: [
              Icon(Icons.location_on, color: Colors.green, size: 20),
              SizedBox(width: responsiveWidth(context, 12)),
              Text('123 Al-Madina Street, Abdali, Amman, Jordan'.tr(),
                  style: TextStyle(
                      fontSize: responsiveWidth(context, 12),
                      color: isDarkMode ? Colors.white : Color(0xff6C7278))),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLiveTrackButton(bool isDarkMode) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => LiveTrackScreen()));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff25AE4B),
        minimumSize: Size(double.infinity, 56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(vertical: 16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 8),
          Text(
            'Live Track'.tr(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
