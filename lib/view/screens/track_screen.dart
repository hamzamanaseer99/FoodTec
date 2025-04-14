

import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  int _currentNavIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildOrderInfoRow('Order ID', 'www-8432', '25m'),
            SizedBox(height: 24),

            _buildSectionHeader('Order Status'),
            SizedBox(height: 16),
            _buildTrackingProgress(),
            SizedBox(height: 24),

            _buildSectionHeader('Delivery Info'),
            SizedBox(height: 16),
            _buildDeliveryPersonInfo(),
            SizedBox(height: 24),

            _buildSectionHeader('Delivery Address'),
            SizedBox(height: 16),
            _buildLocationSection(),
            SizedBox(height: 32),

            _buildLiveTrackButton(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() => _currentNavIndex = 2); // تحديث الفهرس عند الضغط
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.location_on, color: Colors.white),
        elevation: 2.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomAppBar(context, _currentNavIndex),
    );
  }

  Widget _buildBottomAppBar(BuildContext context, int currentIndex) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 4.0,
      color: Colors.green[100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(context, Icons.home_outlined, "Home", 0, currentIndex),
          _buildNavItem(context, Icons.favorite_outline, "Favorites", 1, currentIndex),
          const SizedBox(width: 48), // مساحة للزر العائم
          _buildNavItem(context, Icons.history, "History", 2, currentIndex),
          _buildNavItem(context, Icons.person_outline_outlined, "Profile", 3, currentIndex),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, IconData icon, String label, int index, int currentIndex) {
    return GestureDetector(
      onTap: () {
        setState(() => _currentNavIndex = index);
        // يمكنك إضافة التنقل هنا حسب الحاجة
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: currentIndex == index ? Colors.green : Colors.black54,
            size: 28,
          ),
          Text(
            label,
            style: TextStyle(
              color: currentIndex == index ? Colors.green : Colors.black54,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildOrderInfoRow(String label, String value, String time) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Text('$label: ', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(value, style: TextStyle(fontSize: 16)),
            Spacer(),
            Chip(
              label: Text(time),
              backgroundColor: Colors.green.withOpacity(0.2),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrackingProgress() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildEnhancedProgressStep('Order received', isCompleted: true),
            Divider(height: 24, thickness: 1),
            _buildEnhancedProgressStep('Cooking your order', isCompleted: true),
            Divider(height: 24, thickness: 1),
            _buildEnhancedProgressStep('Courier is picking up order', isCompleted: false),
            Divider(height: 24, thickness: 1),
            _buildEnhancedProgressStep('Order delivered', isCompleted: false),
          ],
        ),
      ),
    );
  }

  Widget _buildEnhancedProgressStep(String title, {bool isCompleted = false}) {
    return Row(
      children: [
        Icon(
          isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
          color: isCompleted ? Colors.green : Colors.grey,
          size: 28,
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: isCompleted ? FontWeight.bold : FontWeight.normal,
                  color: isCompleted ? Colors.black : Colors.grey,
                ),
              ),
              if (isCompleted)
                Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: Text(
                    'Completed at ${TimeOfDay.now().format(context)}',
                    style: TextStyle(fontSize: 12, color: Colors.green),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDeliveryPersonInfo() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: Colors.green.withOpacity(0.2),
              child: Icon(Icons.delivery_dining, color: Colors.green),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Delivery Hero',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Aleksandr. V. 4.0',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      Icon(Icons.star_half, color: Colors.amber, size: 16),
                    ],
                  ),
                ],
              ),
            ),
            Icon(Icons.chat_bubble_outline, color: Colors.green),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationSection() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.green, size: 20),
                SizedBox(width: 8),
                Text(
                  'Delivery Address',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 12),
            Text(
              '123 Al-Madina Street',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Abdali, Amman, Jordan',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.access_time, color: Colors.grey, size: 16),
                SizedBox(width: 4),
                Text(
                  'Estimated delivery: 25 min',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLiveTrackButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        minimumSize: Size(double.infinity, 56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(vertical: 16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.location_searching, color: Colors.white),
          SizedBox(width: 8),
          Text(
            'Live Track Order',
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