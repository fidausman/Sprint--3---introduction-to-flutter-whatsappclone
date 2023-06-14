import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/chatmodel.dart';
import 'package:whatsapp_clone/models/single_chat_model.dart';
import 'package:whatsapp_clone/pages/chatbubble.dart';

class ChatDetails extends StatefulWidget {
  ChatDetails({super.key, required this.chatdata});
  Chat chatdata;

  @override
  State<ChatDetails> createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  List<SingleChat> messages = [
    SingleChat(
        isSend: true, isReaded: true, message: "Hello", sendAt: "9:00 am"),
    SingleChat(
        isSend: true, isReaded: false, message: "Heyyy", sendAt: "10:00 am"),
    SingleChat(
        isSend: false, isReaded: false, message: "Gm", sendAt: "10:10 am"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leadingWidth: 80,
        leading: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back),
            ),
            CircleAvatar(
              backgroundImage: (widget.chatdata.avatar == "")
                  ? AssetImage((widget.chatdata.isGroup!)
                      ? 'assets/images/group.png'
                      : "assets/images/dp.png")
                  : AssetImage(widget.chatdata.avatar!),
            ),
          ],
        ),
        title: Column(
          children: [
            Text(
              widget.chatdata.name!,
              style: TextStyle(color: Colors.greenAccent, fontSize: 18),
            ),
            Text(
              widget.chatdata.status!,
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.video_call)),
          // UtilityWidget().widthSpacer(10),
          IconButton(onPressed: () {}, icon: Icon(Icons.call)),
          PopupMenuButton(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(value: 1, child: Text("view contact")),
                PopupMenuItem(value: 2, child: Text("media")),
                PopupMenuItem(value: 3, child: Text("search")),
                PopupMenuItem(value: 4, child: Text("mute notifications")),
                PopupMenuItem(value: 5, child: Text("wallpaper")),
                PopupMenuItem(value: 6, child: Text("more")),
              ];
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              "https://i.pinimg.com/736x/8c/98/99/8c98994518b575bfd8c949e91d20548b.jpg",
              fit: BoxFit.cover,
            ),
          ),
          ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              return ChatBubble(message: messages[index]);
            },
          ),
         Align(
          alignment: Alignment.bottomCenter,
           child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width -70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)
                      ),
                      child: TextField(
                        cursorColor: Colors.teal,
                        style: TextStyle(
                          fontSize: 20
                        ),
                        decoration: InputDecoration(
                        prefix: IconButton(onPressed: () {
                          
                        }, icon:Icon(Icons.emoji_emotions_outlined)),
                        hintText: "type a message",
                        suffixIcon: Row(mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(onPressed: () {
                              
                            }, icon: Icon(Icons.attach_file)),
                            IconButton(onPressed: () {
                              
                            }, icon: Icon(Icons.currency_rupee)),
                            IconButton(onPressed: () {
                              
                            }, icon:Icon(Icons.camera)),
                          ],
                        )  
                        ),
                      )),
                  ],
                ),
              ],
            ),
         ),
        
        ],
      ),
    );
  }
}
