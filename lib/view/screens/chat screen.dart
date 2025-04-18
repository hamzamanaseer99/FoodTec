// import 'package:flutter/material.dart';
// import 'package:foodtek/responsive.dart';
//
// class ChatScreen extends StatefulWidget {
//   const ChatScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//   final TextEditingController _controller = TextEditingController();
//   final List<Map<String, dynamic>> _messages = [];
//
//   void _sendMessage() {
//     if (_controller.text.trim().isEmpty) return;
//
//     setState(() {
//       _messages.add({
//         'text': _controller.text.trim(),
//         'isMe': true,
//       });
//     });
//
//     _controller.clear();
//
//     // simulate reply (for demo)
//     Future.delayed(Duration(seconds: 1), () {
//       setState(() {
//         _messages.add({
//           'text': " ${_messages.last['text']}",
//           'isMe': false,
//         });
//       });
//     });
//   }
//
//   Widget _buildMessage(Map<String, dynamic> message) {
//     bool isMe = message['isMe'];
//     return Align(
//       alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
//       child: Container(
//         margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
//         padding: EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: isMe ? Color(0xff25AE4B) : Color(0xffEEEEEE),
//           borderRadius: BorderRadius.only(bottomRight: Radius.circular(12),
//           bottomLeft:  Radius.circular(12),
//           topLeft:  Radius.circular(12)),
//         ),
//         child: Text(
//           message['text'],
//           style: TextStyle(
//             color: isMe ? Colors.white : Colors.black,
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//
//         backgroundColor: Colors.white,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               reverse: true,
//               padding: EdgeInsets.all(8),
//               itemCount: _messages.length,
//               itemBuilder: (context, index) {
//                 return _buildMessage(_messages[_messages.length - 1 - index]);
//               },
//             ),
//           ),
//
//           Padding(
//             padding:  EdgeInsets.symmetric(
//               horizontal: responsiveWidth(context, 24),
//               vertical: responsiveHeight(context, 24)
//             ),
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(50),
//                 boxShadow: [
//                   BoxShadow(
//                     color: const Color(0xff000000).withOpacity(0.13),
//                     blurRadius: 20,
//                     offset: const Offset(5, 4),
//                   ),
//                 ],
//               ),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       controller: _controller,
//                       style: const TextStyle(
//                         color: Colors.black87,
//                         fontWeight: FontWeight.w500,
//                       ),
//                       decoration:  InputDecoration(
//                         hintText: "Write your message",
//                         hintStyle: TextStyle(
//                           color: Color(0xff6E6E6E),
//                           fontWeight: FontWeight.bold,
//                           fontSize: responsiveWidth(context, 16),
//                         ),
//                         border: InputBorder.none,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 8),
//                   IconButton(
//                     icon: const Icon(Icons.send_rounded,
//                       color:Color(0xff25AE4B),
//                     ),
//                     onPressed: _sendMessage,
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:foodtek/responsive.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;

    setState(() {
      _messages.add({
        'text': _controller.text.trim(),
        'isMe': true,
      });
    });

    _controller.clear();

    // simulate reply (for demo)
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _messages.add({
          'text': " ${_messages.last['text']}",
          'isMe': false,
        });
      });
    });
  }

  Widget _buildMessage(Map<String, dynamic> message) {
    bool isMe = message['isMe'];
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isMe
              ? Color(0xff25AE4B) // Green for sent messages
              : (isDarkMode ? Color(0xff4E4E4E) : Color(0xffEEEEEE)), // Dark/Light background for received messages
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
            topLeft: Radius.circular(12),
          ),
        ),
        child: Text(
          message['text'],
          style: TextStyle(
            color: isMe ? Colors.white : (isDarkMode ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        iconTheme: IconThemeData(
          color: isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: EdgeInsets.all(8),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _buildMessage(_messages[_messages.length - 1 - index]);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: responsiveWidth(context, 24),
              vertical: responsiveHeight(context, 24),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: isDarkMode ? Color(0xff333333) : Colors.white, // Dark mode or light mode
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: isDarkMode
                        ? Colors.black.withOpacity(0.4)
                        : Color(0xff000000).withOpacity(0.13),
                    blurRadius: 20,
                    offset: const Offset(5, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        hintText: "Write your message",
                        hintStyle: TextStyle(
                          color: isDarkMode ? Color(0xffB0B0B0) : Color(0xff6E6E6E),
                          fontWeight: FontWeight.bold,
                          fontSize: responsiveWidth(context, 16),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(
                      Icons.send_rounded,
                      color: Color(0xff25AE4B),
                    ),
                    onPressed: _sendMessage,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
