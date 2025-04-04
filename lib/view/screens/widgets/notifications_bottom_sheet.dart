import 'package:flutter/material.dart';

class NotificationsBottomSheet extends StatefulWidget {
  @override
  _NotificationsBottomSheetState createState() =>
      _NotificationsBottomSheetState();
}

class _NotificationsBottomSheetState extends State<NotificationsBottomSheet> {
  List<String> unreadNotifications = [
    "طلبك #23456 قيد المعالجة!",
    "تم إضافة عرض جديد على البيتزا 🍕",
    "تم تحديث سياسة الخصوصية."
  ];
  List<String> readNotifications = [
    "تم توصيل طلبك بنجاح!",
    "تم تحديث بيانات حسابك."
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "الإشعارات",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          Expanded(
            child: ListView(
              children: [
                if (unreadNotifications.isNotEmpty) ...[
                  Text("غير مقروءة", style: TextStyle(fontWeight: FontWeight.bold)),
                  ...unreadNotifications.map((notif) => ListTile(
                    leading: Icon(Icons.notifications_active, color: Colors.red),
                    title: Text(notif),
                    onTap: () {
                      setState(() {
                        readNotifications.add(notif);
                        unreadNotifications.remove(notif);
                      });
                    },
                  )),
                  Divider(),
                ],
                Text("المقروءة", style: TextStyle(fontWeight: FontWeight.bold)),
                ...readNotifications.map((notif) => ListTile(
                  leading: Icon(Icons.notifications_none, color: Colors.grey),
                  title: Text(notif),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
