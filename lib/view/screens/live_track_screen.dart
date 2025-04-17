// import 'package:flutter/material.dart';
// import 'package:foodtek/responsive.dart';
// import 'package:foodtek/view/screens/chat%20screen.dart';
// import 'package:foodtek/view/screens/order_details_screen.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class LiveTrackScreen extends StatefulWidget {
//   const LiveTrackScreen({super.key});
//
//   @override
//   State<LiveTrackScreen> createState() => _LiveTrackScreenState();
// }
//
// class _LiveTrackScreenState extends State<LiveTrackScreen> {
//   GoogleMapController? mapController;
//   Set<Marker> markers = {};
//   int _currentStep = 1;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Add initial marker
//     markers.add(
//       Marker(
//         markerId: MarkerId("delivery"),
//         position: LatLng(31.963158, 35.930359), // Amman
//         infoWindow: InfoWindow(title: "Delivery Hero"),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       backgroundColor: Colors.white,
//       body: Stack(
//         children: [
//           // Google Map Widget
//           GoogleMap(
//             initialCameraPosition: CameraPosition(
//               target: LatLng(31.963158, 35.930359),
//               zoom: 14,
//             ),
//             onMapCreated: (controller) {
//               mapController = controller;
//             },
//             myLocationEnabled: true,
//             myLocationButtonEnabled: true,
//             zoomControlsEnabled: false,
//             markers: markers,
//           ),
//
//           // Header
//           Positioned(
//             top: responsiveHeight(context, 50),
//             left: responsiveWidth(context, 20),
//             child: Row(
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(8),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.1),
//                         blurRadius: 6,
//                         spreadRadius: 1,
//                       ),
//                     ],
//                   ),
//                   child: IconButton(
//                     icon: const Icon(Icons.arrow_back),
//                     onPressed: () => Navigator.pop(context),
//                   ),
//                 ),
//                 SizedBox(width: responsiveWidth(context, 15)),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Your order is",
//                       style: TextStyle(
//                         fontSize: responsiveWidth(context, 16),
//                         color: Colors.grey[600],
//                       ),
//                     ),
//                     Text(
//                       "On the way!",
//                       style: TextStyle(
//                         fontSize: responsiveWidth(context, 22),
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//
//           // Bottom Sheet
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: _buildBottomSheet(context),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildBottomSheet(BuildContext context) {
//     return Container(
//       height: responsiveHeight(context, 400),
//       padding: EdgeInsets.symmetric(
//         horizontal: responsiveWidth(context, 24),
//         vertical: responsiveHeight(context, 16),
//       ),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.15),
//             blurRadius: 12,
//             spreadRadius: 2,
//             offset: const Offset(0, -4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "On the way!",
//                 style: TextStyle(
//                   fontSize: responsiveWidth(context, 22),
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               TextButton(
//                 onPressed: () => Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const OrderDetailsScreen()),
//                 ),
//                 child: Text(
//                   'All details',
//                   style: TextStyle(
//                     fontSize: responsiveWidth(context, 16),
//                     fontWeight: FontWeight.bold,
//                     color: const Color(0xff25AE4B),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: responsiveHeight(context, 16)),
//
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               _buildStatusStep(context, label: 'Order Placed', isActive: _currentStep >= 0, isCompleted: true),
//               _buildStatusStep(context, label: 'On The Way', isActive: _currentStep >= 1, isCompleted: false),
//               _buildStatusStep(context, label: 'Delivered', isActive: _currentStep >= 2, isCompleted: false),
//             ],
//           ),
//           SizedBox(height: responsiveHeight(context, 12)),
//           Container(
//             height: 2,
//             margin: EdgeInsets.only(bottom: responsiveHeight(context, 8)),
//             child: Stack(
//               children: [
//                 Container(width: double.infinity, color: Colors.grey[300]),
//                 AnimatedContainer(
//                   duration: const Duration(milliseconds: 300),
//                   width: MediaQuery.of(context).size.width * (_currentStep + 1) / 3,
//                   color: const Color(0xff25AE4B),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(top: responsiveHeight(context, 12)),
//             child: Row(children: [Expanded(child: _buildDeliveryPersonInfo())]),
//           ),
//           const Divider(thickness: 0.5),
//           _buildLocationSection()
//         ],
//       ),
//     );
//   }
//
//   Widget _buildStatusStep(BuildContext context, {
//     required String label,
//     required bool isActive,
//     required bool isCompleted,
//   }) {
//     return Column(
//       children: [
//         Container(
//           width: responsiveWidth(context, 24),
//           height: responsiveWidth(context, 24),
//           decoration: BoxDecoration(
//             color: isCompleted ? const Color(0xff25AE4B)
//                 : isActive ? Colors.white : Colors.grey[300],
//             borderRadius: BorderRadius.circular(30),
//             border: Border.all(
//               color: isActive ? const Color(0xff25AE4B) : Colors.transparent,
//               width: 2,
//             ),
//           ),
//           child: isCompleted ? const Icon(Icons.check, size: 16, color: Colors.white) : null,
//         ),
//         SizedBox(height: responsiveHeight(context, 4)),
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: responsiveWidth(context, 12),
//             fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
//             color: isActive ? Colors.black : Colors.grey[600],
//           ),
//         ),
//       ],
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
//                 width: 56,
//                 height: 56,
//               ),
//             ),
//           ),
//           SizedBox(width: responsiveWidth(context, 12)),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Your Delivery Hero',
//                     style: TextStyle(fontSize: responsiveWidth(context, 12),
//                         fontWeight: FontWeight.bold, color: Color(0xff878787))),
//                 const SizedBox(height: 4),
//                 Row(
//                   children: [
//                     const Text('Aleksandr V.', style: TextStyle(fontSize: 14, color: Color(0xff2F2E36))),
//                     SizedBox(width: responsiveWidth(context, 8)),
//                     const Icon(Icons.star, color: Colors.amber, size: 16),
//                     SizedBox(width: responsiveWidth(context, 4)),
//                     Text('4.9', style: TextStyle(fontSize: responsiveWidth(context, 12),
//                         color: const Color(0xffB8B8B8), fontWeight: FontWeight.w400)),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           _buildIconButton(Icons.call, Colors.green),
//           SizedBox(width: responsiveWidth(context, 12)),
//           _buildIconButton(Icons.chat, const Color(0xffF2AB58)),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildIconButton(IconData icon, Color color) {
//     return Container(
//       width: responsiveWidth(context, 40),
//       height: responsiveHeight(context, 40),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(40),
//         color: const Color(0xffF5F5F5),
//       ),
//       child: IconButton(
//         onPressed: () {
//           Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen()));
//         },
//         icon: Icon(icon, color: color, size: responsiveWidth(context, 22)),
//       ),
//     );
//   }
//
//   Widget _buildLocationSection() {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: responsiveWidth(context, 24)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text('your location',
//               style: TextStyle(fontSize: responsiveWidth(context, 12),
//                   color: const Color(0xff878787), fontWeight: FontWeight.w500)),
//           SizedBox(height: responsiveHeight(context, 12)),
//           Row(
//             children: [
//               const Icon(Icons.location_on, color: Colors.green, size: 20),
//               SizedBox(width: responsiveWidth(context, 12)),
//               Expanded(
//                 child: Text('123 Al-Madina Street, Abdali, Amman, Jordan',
//                     style: TextStyle(fontSize: responsiveWidth(context, 12),
//                         color: const Color(0xff6C7278))),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:foodtek/responsive.dart';
import 'package:foodtek/view/screens/chat%20screen.dart';
import 'package:foodtek/view/screens/order_details_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../homescreen.dart';

class LiveTrackScreen extends StatefulWidget {
  const LiveTrackScreen({super.key});

  @override
  State<LiveTrackScreen> createState() => _LiveTrackScreenState();
}

class _LiveTrackScreenState extends State<LiveTrackScreen> {
  GoogleMapController? mapController;
  Set<Marker> markers = {};
  int _currentStep = 1;

  // المحاكاة: حالة التوصيل (غيّرها لاحقًا عند ربط الـ API)
  bool delivered = true;

  @override
  void initState() {
    super.initState();
    markers.add(
      Marker(
        markerId: MarkerId("delivery"),
        position: LatLng(31.963158, 35.930359),
        infoWindow: InfoWindow(title: "Delivery Hero"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(31.963158, 35.930359),
              zoom: 14,
            ),
            onMapCreated: (controller) {
              mapController = controller;
            },
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            zoomControlsEnabled: false,
            markers: markers,
          ),
          Positioned(
            top: responsiveHeight(context, 50),
            left: responsiveWidth(context, 20),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                SizedBox(width: responsiveWidth(context, 15)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your order is",
                      style: TextStyle(
                        fontSize: responsiveWidth(context, 16),
                        color: Colors.grey[600],
                      ),
                    ),
                    Text(
                      "On the way!",
                      style: TextStyle(
                        fontSize: responsiveWidth(context, 22),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildBottomSheet(context),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: responsiveHeight(context, 450),
        padding: EdgeInsets.symmetric(
          horizontal: responsiveWidth(context, 24),
          vertical: responsiveHeight(context, 16),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 12,
              spreadRadius: 2,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "On the way!",
                  style: TextStyle(
                    fontSize: responsiveWidth(context, 22),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OrderDetailsScreen()),
                  ),
                  child: Text(
                    'All details',
                    style: TextStyle(
                      fontSize: responsiveWidth(context, 16),
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff25AE4B),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: responsiveHeight(context, 16)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatusStep(context, label: 'Order Placed', isActive: _currentStep >= 0, isCompleted: true),
                _buildStatusStep(context, label: 'On The Way', isActive: _currentStep >= 1, isCompleted: false),
                _buildStatusStep(context, label: 'Delivered', isActive: _currentStep >= 2, isCompleted: false),
              ],
            ),
            SizedBox(height: responsiveHeight(context, 12)),
            Container(
              height: 2,
              margin: EdgeInsets.only(bottom: responsiveHeight(context, 8)),
              child: Stack(
                children: [
                  Container(width: double.infinity, color: Colors.grey[300]),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: MediaQuery.of(context).size.width * (_currentStep + 1) / 3,
                    color: const Color(0xff25AE4B),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: responsiveHeight(context, 12)),
              child: Row(children: [Expanded(child: _buildDeliveryPersonInfo())]),
            ),
            const Divider(thickness: 0.5),
            _buildLocationSection(),
            if (delivered) ...[
              SizedBox(height: responsiveHeight(context, 5)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff25AE4B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: responsiveHeight(context, 12),
                  ),
                ),
                onPressed: () {
                  _showConfirmationDialog(context);
                },
                child: Center(
                  child: Text(
                    "Confirm Receipt",
                    style: TextStyle(
                      fontSize: responsiveWidth(context, 20),
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }

  Widget _buildStatusStep(BuildContext context, {
    required String label,
    required bool isActive,
    required bool isCompleted,
  }) {
    return Column(
      children: [
        Container(
          width: responsiveWidth(context, 24),
          height: responsiveWidth(context, 24),
          decoration: BoxDecoration(
            color: isCompleted ? const Color(0xff25AE4B)
                : isActive ? Colors.white : Colors.grey[300],
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: isActive ? const Color(0xff25AE4B) : Colors.transparent,
              width: 2,
            ),
          ),
          child: isCompleted ? const Icon(Icons.check, size: 16, color: Colors.white) : null,
        ),
        SizedBox(height: responsiveHeight(context, 4)),
        Text(
          label,
          style: TextStyle(
            fontSize: responsiveWidth(context, 12),
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            color: isActive ? Colors.black : Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildDeliveryPersonInfo() {
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
                width: 56,
                height: 56,
              ),
            ),
          ),
          SizedBox(width: responsiveWidth(context, 12)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Your Delivery Hero',
                    style: TextStyle(fontSize: responsiveWidth(context, 12),
                        fontWeight: FontWeight.bold, color: Color(0xff878787))),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Text('Aleksandr V.', style: TextStyle(fontSize: 14, color: Color(0xff2F2E36))),
                    SizedBox(width: responsiveWidth(context, 8)),
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    SizedBox(width: responsiveWidth(context, 4)),
                    Text('4.9', style: TextStyle(fontSize: responsiveWidth(context, 12),
                        color: const Color(0xffB8B8B8), fontWeight: FontWeight.w400)),
                  ],
                ),
              ],
            ),
          ),
          _buildIconButton(Icons.call, Colors.green),
          SizedBox(width: responsiveWidth(context, 12)),
          _buildIconButton(Icons.chat, const Color(0xffF2AB58)),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon, Color color) {
    return Container(
      width: responsiveWidth(context, 40),
      height: responsiveHeight(context, 40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: const Color(0xffF5F5F5),
      ),
      child: IconButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()));
        },
        icon: Icon(icon, color: color, size: responsiveWidth(context, 22)),
      ),
    );
  }

  Widget _buildLocationSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsiveWidth(context, 24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('your location',
              style: TextStyle(fontSize: responsiveWidth(context, 12),
                  color: const Color(0xff878787), fontWeight: FontWeight.w500)),
          SizedBox(height: responsiveHeight(context, 12)),
          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.green, size: 20),
              SizedBox(width: responsiveWidth(context, 12)),
              Expanded(
                child: Text('123 Al-Madina Street, Abdali, Amman, Jordan',
                    style: TextStyle(fontSize: responsiveWidth(context, 12),
                        color: const Color(0xff6C7278))),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            "Confirm Receipt",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text("Are you sure you received your order?"),
          actions: [
            // زر التأكيد - أخضر بخط أبيض
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                      (route) => false,
                );
              },
              child: Text(
                "Yes, I received it!",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),

            // زر الإلغاء - خط أسود
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }

}
