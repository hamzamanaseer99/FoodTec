// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:foodtek/view/screens/widgets/dot_widget.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//
// class NotificationItem {
//   final String title;
//   final String message;
//   final String timestamp;
//   bool isRead;
//
//   NotificationItem({
//     required this.title,
//     required this.message,
//     required this.timestamp,
//     this.isRead = false,
//   });
// }
//
// class NotificationsBottomSheet extends StatefulWidget {
//   @override
//   _NotificationsBottomSheetState createState() => _NotificationsBottomSheetState();
// }
//
// class _NotificationsBottomSheetState extends State<NotificationsBottomSheet> {
//   List<NotificationItem> notifications = [
//     NotificationItem(
//       title: 'Delayed Order'.tr(),
//       message: '"We\'re sorry! Your order is running late. New ETA: 10:30 PM. Thanks for your patience!"',
//       timestamp: 'Last Wednesday at 9:42 AM',
//       isRead: false,
//     ),
//     NotificationItem(
//       title: 'Promotional Offer',
//       message: '"Craving something delicious? 😊 Get 20% off on your next order. Use code: YUMMY20."',
//       timestamp: 'Last Wednesday at 9:42 AM',
//       isRead: true,
//     ),
//     NotificationItem(
//       title: 'Out for Delivery',
//       message: '"Your order is on the way! 🚚 Estimated arrival: 15 mins. Stay hungry!"',
//       timestamp: 'Last Wednesday at 9:42 AM',
//       isRead: true,
//     ),
//     NotificationItem(
//       title: 'Order Confirmation',
//       message: '"Your order has been placed! 😊 We\'re preparing it now. Track your order live!"',
//       timestamp: 'Last Wednesday at 9:42 AM',
//       isRead: true,
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Container(
//         padding: const EdgeInsets.all(16),
//         height: MediaQuery.of(context).size.height * 0.9,
//         child: Column(
//           children: [
//             DotsNav1(),
//             SizedBox(
//               height: 16,
//             ),
//             Stack(
//               children: [
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: IconButton(
//                     icon: const Icon(Icons.arrow_back),
//                     onPressed: () => Navigator.pop(context),
//                   ),
//                 ),
//                  Center(
//                   child: Text( "Notifications".tr(),
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: IconButton(
//                     icon: const Icon(Icons.more_vert),
//                     onPressed: () {},
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 32),
//               child: TabBar(
//                 indicatorColor: const Color(0xFF25AE4B),
//                 dividerColor: Colors.transparent,
//                 labelColor: const Color(0xFF25AE4B),
//                 unselectedLabelColor: Colors.grey,
//                 labelStyle: TextStyle(fontSize: 18),
//                 tabs:  [
//                   Tab(text: 'All'.tr()),
//                   Tab(text: 'Unread'.tr()),
//                   Tab(text: 'Read'.tr()),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: TabBarView(
//                 children: [
//                   _buildNotificationList(notifications),
//                   _buildNotificationList(notifications.where((n) => !n.isRead).toList()),
//                   _buildNotificationList(notifications.where((n) => n.isRead).toList()),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildNotificationList(List<NotificationItem> items) {
//     return ListView.separated(
//       padding: const EdgeInsets.only(top: 16),
//       itemCount: items.length,
//       separatorBuilder: (context, index) => const Divider(
//           height: 24,),
//       itemBuilder: (context, index) {
//         final notification = items[index];
//         return ListTile(
//           contentPadding: EdgeInsets.zero,
//           onTap: !notification.isRead ? () {
//             setState(() => notification.isRead = true);
//           } : null,
//           title: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   if (!notification.isRead) ...[
//                     const Icon(Icons.circle, color: Color(0xFF25AE4B), size: 12),
//                     const SizedBox(width: 8),
//                   ],
//                   Text(
//                     notification.title,
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                       color: notification.isRead ? Colors.grey : Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 notification.message,
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Colors.black,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 notification.timestamp,
//                 style:  TextStyle(
//                   fontSize: 12,
//                   color: Colors.grey[600],
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
//
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foodtek/view/screens/widgets/dot_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class NotificationItem {
  final String title;
  final String message;
  final String timestamp;
  bool isRead;

  NotificationItem({
    required this.title,
    required this.message,
    required this.timestamp,
    this.isRead = false,
  });
}

class NotificationsBottomSheet extends StatefulWidget {
  @override
  _NotificationsBottomSheetState createState() => _NotificationsBottomSheetState();
}

class _NotificationsBottomSheetState extends State<NotificationsBottomSheet> {
  List<NotificationItem> notifications = [
    NotificationItem(
      title: 'Delayed Order'.tr(),
      message: "We're sorry! Your order is running late. New ETA: 10:30 PM. Thanks for your patience!".tr(),
      timestamp: 'Last Wednesday at 9:42 AM'.tr(),
      isRead: false,
    ),
    NotificationItem(
      title: 'Promotional Offer'.tr(),
      message: 'Craving something delicious? 😊 Get 20% off on your next order. Use code: YUMMY20.'.tr(),
      timestamp: 'Last Wednesday at 9:42 AM'.tr(),
      isRead: true,
    ),
    NotificationItem(
      title: 'Out for Delivery'.tr(),
      message: 'Your order is on the way! 🚚 Estimated arrival: 15 mins. Stay hungry!'.tr(),
      timestamp: 'Last Wednesday at 9:42 AM'.tr(),
      isRead: true,
    ),
    NotificationItem(
      title: 'Order Confirmation'.tr(),
      message: 'Your order has been placed! 😊 We\'re preparing it now. Track your order live!'.tr(),
      timestamp: 'Last Wednesday at 9:42 AM'.tr(),
      isRead: true,
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Container(
        padding: const EdgeInsets.all(16),
        height: MediaQuery.of(context).size.height * 0.9,
        child: Column(
          children: [
            DotsNav1(),
            SizedBox(
              height: 16,
            ),
            Stack(
              children: [
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: IconButton(
                //     icon:  Icon(Icons.abc_outlined),
                //     onPressed: () => Navigator.pop(context),
                //   ),
                // ),
                Center(
                  child: Text(
                    "Notifications".tr(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                  ),
                ),
                Align(
                  alignment: EasyLocalization.of(context)!.locale.languageCode == 'ar'
                      ? Alignment.centerRight  // إذا كانت اللغة عربية، عكس الاتجاه
                      : Alignment.centerLeft, // إذا كانت اللغة إنجليزية، السهم يبقى في اليمين
                  child: IconButton(
                    icon: Icon( EasyLocalization.of(context)!.locale.languageCode == 'ar'
                        ? Icons.arrow_back // سهم لليسار (عكس)
                        : Icons.arrow_back, // النقاط العمودية
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: TabBar(
                indicatorColor: const Color(0xFF25AE4B),
                dividerColor: Colors.transparent,
                labelColor: const Color(0xFF25AE4B),
                unselectedLabelColor: Colors.grey,
                labelStyle: TextStyle(fontSize: 18),
                tabs: [
                  Tab(text: 'All'.tr()),
                  Tab(text: 'Unread'.tr()),
                  Tab(text: 'Read'.tr()),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildNotificationList(notifications),
                  _buildNotificationList(notifications.where((n) => !n.isRead).toList()),
                  _buildNotificationList(notifications.where((n) => n.isRead).toList()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationList(List<NotificationItem> items) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 16),
      itemCount: items.length,
      separatorBuilder: (context, index) => const Divider(height: 24),
      itemBuilder: (context, index) {
        final notification = items[index];
        return ListTile(
          contentPadding: EdgeInsets.zero,
          onTap: !notification.isRead
              ? () {
            setState(() => notification.isRead = true);
          }
              : null,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (!notification.isRead) ...[
                    const Icon(Icons.circle, color: Color(0xFF25AE4B), size: 12),
                    const SizedBox(width: 8),
                  ],
                  Text(
                    notification.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: notification.isRead
                          ? Colors.grey
                          : Theme.of(context).textTheme.bodyMedium?.color,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                notification.message,
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).textTheme.bodySmall?.color,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                notification.timestamp,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
