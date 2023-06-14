import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/chatmodel.dart';
import 'package:whatsapp_clone/pages/chattile.dart';

class ChatPage extends StatelessWidget {
   ChatPage({super.key});
  List<Chat> chatList = [
    Chat(avatar: "assets/images/dp1.jpg", name: "fida", isGroup: false, updatedAt: "1:06 pm", message:"hi",status: "online",),
    Chat(avatar: "", name: "shada", isGroup: false, updatedAt: "1:16 pm", message:"how r u",status: "last seen 3 mins ago",),
    Chat(avatar: "", name: "rinu", isGroup: false, updatedAt: "1:11 pm", message:"okay",status: "online",),
    Chat(avatar: "", name: "besties", isGroup: true, updatedAt: "1:16 pm", message:"hey guys",status: "online",),
    
    
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
       itemCount: chatList.length,
        itemBuilder: (context, index) {
          return ChatTile(chatdata: chatList[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.chat),
      ),
    );
  }
}
