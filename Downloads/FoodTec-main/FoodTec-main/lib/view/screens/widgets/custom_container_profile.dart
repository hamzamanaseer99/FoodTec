import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Widget customContainer(Widget child) {
//   return Padding(
//     padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
//     child: Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             blurRadius: 15,
//             offset: Offset(0, 0),
//             spreadRadius: 0,
//           ),
//         ],
//       ),
//       child: child,
//     ),
//   );
// }

Widget customContainer(BuildContext context, Widget child) {
  return Padding(
    padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).cardColor,
        boxShadow: Theme.of(context).brightness == Brightness.light
            ? [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 15,
            offset: Offset(0, 0),
            spreadRadius: 0,
          ),
        ]
            : [],
      ),
      child: child,
    ),
  );
}
