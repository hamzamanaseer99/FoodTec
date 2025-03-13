// import 'package:flutter/material.dart';
//
// class OtpScreen extends StatelessWidget {
//   const OtpScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }
// import 'package:flutter/material.dart';
// import 'login_screen.dart';
//
// class OtpVerificationScreen extends StatefulWidget {
//   const OtpVerificationScreen({super.key});
//
//   @override
//   State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
// }
//
// class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
//   final List<TextEditingController> otpControllers =
//   List.generate(4, (index) => TextEditingController());
//   final List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());
//
//   void _nextField(String value, int index) {
//     if (value.isNotEmpty && index < 3) {
//       FocusScope.of(context).requestFocus(focusNodes[index + 1]);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.green,
//       body: Stack(
//         children: [
//           Image.asset(
//             'assets/images/Pattern.png',
//             fit: BoxFit.cover,
//             width: double.infinity,
//             height: double.infinity,
//           ),
//           SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 74),
//                 const Center(
//                   child: Text(
//                     'Foodtek',
//                     style: TextStyle(
//                       fontSize: 80,
//                       color: Colors.white,
//                       fontFamily: "Protest Riot",
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(24),
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * 0.9,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(12),
//
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//
//                           const SizedBox(height: 24),
//                            Center(
//                             child: Image.asset('assets/images/Verify.png'),
//                           ),
//                           const SizedBox(height: 12),
//                           const Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 12),
//                             child: Center(
//                               child: Text(
//                                 "A 4-digit code has been sent to your email. Please enter it to verify.",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   color: Colors.grey,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 24),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: List.generate(4, (index) {
//                               return SizedBox(
//                                 width: 60,
//                                 child: TextField(
//                                   controller: otpControllers[index],
//                                   focusNode: focusNodes[index],
//                                   keyboardType: TextInputType.number,
//                                   textAlign: TextAlign.center,
//                                   maxLength: 1,
//                                   decoration: InputDecoration(
//                                     counterText: "",
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(10),
//                                       borderSide: BorderSide(color: Color(0xffEDF1F3))
//                                     ),
//                                   ),
//                                   onChanged: (value) => _nextField(value, index),
//                                 ),
//                               );
//                             }),
//                           ),
//                           const SizedBox(height: 24),
//                           Column(
//                             children: [
//                               ElevatedButton(
//                                 onPressed: () {
//                                   // تحقق من الكود وانتقل للخطوة التالية
//                                 },
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: Color(0xff25AE4B),
//                                   minimumSize: const Size(double.infinity, 50),
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                 ),
//                                 child: const Text(
//                                   "Verify",
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// // }
// import 'package:flutter/material.dart';
// import 'dart:ui';
// import 'login_screen.dart';
//
// class OtpVerificationScreen extends StatefulWidget {
//   const OtpVerificationScreen({super.key});
//
//   @override
//   State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
// }
//
// class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
//   final List<TextEditingController> otpControllers =
//   List.generate(4, (index) => TextEditingController());
//   final List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());
//
//   void _nextField(String value, int index) {
//     if (value.isNotEmpty && index < 3) {
//       FocusScope.of(context).requestFocus(focusNodes[index + 1]);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.green,
//       body: Stack(
//         children: [
//           Image.asset(
//             'assets/images/Pattern.png',
//             fit: BoxFit.cover,
//             width: double.infinity,
//             height: double.infinity,
//           ),
//
//
//                Column(
//                 children: [
//                   const SizedBox(height: 74),
//                   const Center(
//                     child: Text(
//                       'Foodtek',
//                       style: TextStyle(
//                         fontSize: 80,
//                         color: Colors.white,
//                         fontFamily: "Protest Riot",
//                       ),
//                     ),
//                   ),
//       BackdropFilter(
//             filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20), // تطبيق تأثير التمويه (Blur)
//             child: Container(
//               width: double.infinity,
//               height: double.infinity,
//               color: Colors.black.withOpacity(0.3),
//                   Expanded(
//                     child: SingleChildScrollView(
//                       child: Padding(
//                         padding: const EdgeInsets.all(24),
//                         child: Container(
//                           width: MediaQuery.of(context).size.width * 0.9,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const SizedBox(height: 24),
//                                 Center(
//                                   child: Image.asset('assets/images/Verify.png'),
//                                 ),
//                                 const SizedBox(height: 12),
//                                 const Padding(
//                                   padding: EdgeInsets.symmetric(horizontal: 12),
//                                   child: Center(
//                                     child: Text(
//                                       "A 4-digit code has been sent to your email. Please enter it to verify.",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         fontSize: 12,
//                                         color: Colors.grey,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 24),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                   children: List.generate(4, (index) {
//                                     return SizedBox(
//                                       width: 60,
//                                       child: TextField(
//                                         controller: otpControllers[index],
//                                         focusNode: focusNodes[index],
//                                         keyboardType: TextInputType.number,
//                                         textAlign: TextAlign.center,
//                                         maxLength: 1,
//                                         decoration: InputDecoration(
//                                           counterText: "",
//                                           border: OutlineInputBorder(
//                                             borderRadius: BorderRadius.circular(10),
//                                             borderSide: const BorderSide(color: Color(0xffEDF1F3)),
//                                           ),
//                                         ),
//                                         onChanged: (value) => _nextField(value, index),
//                                       ),
//                                     );
//                                   }),
//                                 ),
//                                 const SizedBox(height: 24),
//                                 Column(
//                                   children: [
//                                     ElevatedButton(
//                                       onPressed: () {
//                                         // تحقق من الكود وانتقل للخطوة التالية
//                                       },
//                                       style: ElevatedButton.styleFrom(
//                                         backgroundColor: const Color(0xff25AE4B),
//                                         minimumSize: const Size(double.infinity, 50),
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.circular(10),
//                                         ),
//                                       ),
//                                       child: const Text(
//                                         "Verify",
//                                         style: TextStyle(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//}
// import 'package:flutter/material.dart';
// import 'dart:ui';
// import 'login_screen.dart';
//
// class OtpVerificationScreen extends StatefulWidget {
//   const OtpVerificationScreen({super.key});
//
//   @override
//   State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
// }
//
// class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
//   final List<TextEditingController> otpControllers =
//   List.generate(4, (index) => TextEditingController());
//   final List<FocusNode> focusNodes =
//   List.generate(4, (index) => FocusNode());
//
//   void _nextField(String value, int index) {
//     if (value.isNotEmpty && index < 3) {
//       FocusScope.of(context).requestFocus(focusNodes[index + 1]);
//     }
//   }
//
//   @override
//   void dispose() {
//     // Dispose of the controllers and focus nodes to avoid memory leaks
//     for (var controller in otpControllers) {
//       controller.dispose();
//     }
//     for (var focusNode in focusNodes) {
//       focusNode.dispose();
//     }
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.green,
//       body: Stack(
//         children: [
//           Image.asset(
//             'assets/images/Pattern.png',
//             fit: BoxFit.cover,
//             width: double.infinity,
//             height: double.infinity,
//           ),
//           Column(
//             children: [
//               const SizedBox(height: 74),
//               const Center(
//                 child: Text(
//                   'Foodtek',
//                   style: TextStyle(
//                     fontSize: 80,
//                     color: Colors.white,
//                     fontFamily: "Protest Riot",
//                   ),
//                 ),
//               ),
//               BackdropFilter(
//                 filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Apply blur effect
//                 child: SingleChildScrollView(
//                   child: Padding(
//                     padding: const EdgeInsets.all(24),
//                     child: Container(
//                       width: MediaQuery.of(context).size.width * 0.9,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 24, horizontal: 24),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const SizedBox(height: 24),
//                             Center(
//                               child: Image.asset('assets/images/Verify.png'),
//                             ),
//                             const SizedBox(height: 12),
//                             const Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 12),
//                               child: Center(
//                                 child: Text(
//                                   "A 4-digit code has been sent to your email. Please enter it to verify.",
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     color: Colors.grey,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 24),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: List.generate(4, (index) {
//                                 return SizedBox(
//                                   width: 60,
//                                   child: TextField(
//                                     controller: otpControllers[index],
//                                     focusNode: focusNodes[index],
//                                     keyboardType: TextInputType.number,
//                                     textAlign: TextAlign.center,
//                                     maxLength: 1,
//                                     decoration: InputDecoration(
//                                       counterText: "",
//                                       border: OutlineInputBorder(
//                                         borderRadius:
//                                         BorderRadius.circular(10),
//                                         borderSide: const BorderSide(
//                                             color: Color(0xffEDF1F3)),
//                                       ),
//                                     ),
//                                     onChanged: (value) =>
//                                         _nextField(value, index),
//                                   ),
//                                 );
//                               }),
//                             ),
//                             const SizedBox(height: 24),
//                             Column(
//                               children: [
//                                 ElevatedButton(
//                                   onPressed: () {
//                                     // Verify code and proceed to the next step
//                                   },
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: const Color(0xff25AE4B),
//                                     minimumSize: const Size(double.infinity, 50),
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                   ),
//                                   child: const Text(
//                                     "Verify",
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:foodtek/view/screens/rest_screen.dart';
import '../../cubit/otp_cubit.dart';

// Import the cubit
class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final List<TextEditingController> otpControllers =
  List.generate(4, (index) => TextEditingController());
  final List<FocusNode> focusNodes =
  List.generate(4, (index) => FocusNode());

  void _nextField(String value, int index) {
    if (value.isNotEmpty && index < 3) {
      FocusScope.of(context).requestFocus(focusNodes[index + 1]);
    }
  }

  @override
  void dispose() {
    // Dispose of the controllers and focus nodes to avoid memory leaks
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;


    return Scaffold(
      backgroundColor: Colors.green,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/Pattern.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SingleChildScrollView( // أضف هذا هنا لحل المشكلة
            child: Column(
              children: [
                const SizedBox(height: 74),
                Center(
                  child: Text(
                    'Foodtek',
                    style: TextStyle(
                      fontSize: screenWidth * 0.1,
                      color: Colors.white,
                      fontFamily: "Protest Riot",
                    ),
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 24, horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 24),
                            Center(child: Image.asset('assets/images/Verify.png')),
                            const SizedBox(height: 12),
                             Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Center(
                                child: Text(
                                  "A 4-digit code has been sent to your email. Please enter it to verify.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.02 ,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(4, (index) {
                                return SizedBox(
                                  width: 60,
                                  child: TextField(
                                    controller: otpControllers[index],
                                    focusNode: focusNodes[index],
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    maxLength: 1,
                                    decoration: InputDecoration(
                                      counterText: "",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Color(0xffEDF1F3)),
                                      ),
                                    ),
                                    onChanged: (value) =>
                                        _nextField(value, index),
                                  ),
                                );
                              }),
                            ),
                            const SizedBox(height: 24),
                            Column(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ResetScreen()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff25AE4B),
                                    minimumSize: const Size(double.infinity, 50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child:  Text(
                                    "Verify",
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.03,                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
              ],
            ),
          ),
        ],
      ),

    );
  }
}