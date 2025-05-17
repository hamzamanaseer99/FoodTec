// import 'package:flutter/material.dart';
// import 'notifications_bottom_sheet.dart';
//
// class NotificationIcon extends StatefulWidget {
//   @override
//   _NotificationIconState createState() => _NotificationIconState();
// }
//
// class _NotificationIconState extends State<NotificationIcon> {
//   bool hasNotification = true;
//
//   void showNotifications(BuildContext context) {
//     setState(() {
//       hasNotification = false;
//     });
//
//     showModalBottomSheet(
//       context: context,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
//       backgroundColor: Colors.white,
//       builder: (context) => NotificationsBottomSheet(),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: GestureDetector(
//         onTap: () => showNotifications(context),
//         child: Container(
//           height: 34,
//           width: 34,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//             color: Color(0xffF5F5F5),
//           ),
//           child: Stack(
//             clipBehavior: Clip.none,
//             children: [
//               Center(
//                 child: Icon(Icons.notifications_none_outlined, color: Colors.black, size: 20),
//               ),
//               if (hasNotification)
//                 Positioned(
//                   top: 8,
//                   right: 8,
//                   child: Container(
//                     height: 8,
//                     width: 8,
//                     decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'notifications_bottom_sheet.dart';

class NotificationIcon extends StatefulWidget {
  @override
  _NotificationIconState createState() => _NotificationIconState();
}

class _NotificationIconState extends State<NotificationIcon> {
  bool hasNotification = true;

  void showNotifications(BuildContext context) {
    setState(() {
      hasNotification = false;
    });

    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      backgroundColor: Theme.of(context).cardColor, // ✅ يتبع الثيم
      builder: (context) => NotificationsBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => showNotifications(context),
        child: Container(
          height: 34,
          width: 34,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isDark ? Color(0xFF1C1C1C) : Color(0xffF5F5F5), // ✅ حسب الثيم
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Center(
                child: Icon(
                  Icons.notifications_none_outlined,
                  color: Theme.of(context).iconTheme.color, // ✅ أيقونة ديناميكية
                  size: 20,
                ),
              ),
              if (hasNotification)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    height: 8,
                    width: 8,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
