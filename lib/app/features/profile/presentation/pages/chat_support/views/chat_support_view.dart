import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_support_controller.dart';

class ChatSupportView extends GetView<ChatSupportController> {
  const ChatSupportView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatSupportView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ChatSupportView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
