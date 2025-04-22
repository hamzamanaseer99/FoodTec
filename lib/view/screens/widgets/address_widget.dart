import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//
// class AddressWidget extends StatefulWidget {
//   AddressWidget({
//     super.key,
//     required this.addressEditingController,
//   });
//   final TextEditingController addressEditingController;
//
//   @override
//   State<AddressWidget> createState() => _AddressWidgetState();
// }
//
// class _AddressWidgetState extends State<AddressWidget> {
//   bool showErrorName = false;
//
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 0),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white, // Background color
//           borderRadius: BorderRadius.circular(12), // Rounded corners
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.2), // Soft shadow color
//               blurRadius: 2, // How soft the shadow is
//               spreadRadius: 0, // How much the shadow spreads
//               offset: Offset(0, 1), // Moves shadow down (x: 0, y: 4)
//             ),
//           ],
//         ),
//         child: TextField(
//           controller: widget.addressEditingController,
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//             fontSize: screenWidth * 0.03,
//           ),
//           decoration: InputDecoration(
//             labelText: 'Address',labelStyle: TextStyle(
//             fontSize: screenWidth * 0.025,
//
//           ),
//             hintText: "123 Al-Madina Street, Abdali,...",
//             hintStyle:TextStyle(
//               fontSize: screenWidth * 0.025,
//
//             ),
//             fillColor: Colors.white, // ✅ Matches container color
//             contentPadding: EdgeInsets.symmetric(
//               vertical: screenWidth * 0.04, // ✅ نفس التناسب مع الشاشة
//               horizontal: screenWidth * 0.04,
//             ),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide.none, // ✅ No border (shadow does the job)
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: BorderSide(color: Color(0xffEDF1F3), width: 1),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: BorderSide(color: Color(0xffEDF1F3), width: 2),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class AddressWidget extends StatefulWidget {
  AddressWidget({
    super.key,
    required this.addressEditingController,
  });

  final TextEditingController addressEditingController;

  @override
  State<AddressWidget> createState() => _AddressWidgetState();
}

class _AddressWidgetState extends State<AddressWidget> {
  bool showErrorName = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Container(
        decoration:
        BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.black26
                  : Colors.grey.withOpacity(0.2),
              blurRadius: 6,
              spreadRadius: 1,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: TextField(
          controller: widget.addressEditingController,
          style: TextStyle(
            color: theme.textTheme.bodyLarge?.color, // ✅ لون النص ديناميكي
            fontWeight: FontWeight.bold,
            fontSize: screenWidth * 0.03,
          ),
          decoration: InputDecoration(
            labelText: 'Address',
            labelStyle: TextStyle(
              fontSize: screenWidth * 0.035,
              color: Theme.of(context).textTheme.bodyMedium?.color,
            ),
            hintText: "123 Al-Madina Street, Abdali,...",
            hintStyle: TextStyle(
              fontSize: screenWidth * 0.035,
              color: Theme.of(context).hintColor,
            ),
            filled: true,
            fillColor: Theme.of(context).colorScheme.surface,
            contentPadding: EdgeInsets.symmetric(
              vertical: screenWidth * 0.045,
              horizontal: screenWidth * 0.04,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).dividerColor,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
