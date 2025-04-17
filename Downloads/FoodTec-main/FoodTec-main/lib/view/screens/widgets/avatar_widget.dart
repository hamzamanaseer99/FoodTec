import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Avatar with border
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xffF3F3F5), // Add border width
              ),
            ),
            child: const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZFs01SPDw0Brlpl7_bbZadld5oZ6kVmgFWvpQI4xg3m98yz4c',
              ),
            ),
          ),
          const SizedBox(height: 8), // Spacing between avatar and text
          // Name
          const Text(
            'Ahmad Daboor',
            style: TextStyle(
              color: Color(0xff1B1B1B),
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),

          const Text(
            'ahmad1709@gmail.com',
            style: TextStyle(
              color: Color(0xff838383),
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}