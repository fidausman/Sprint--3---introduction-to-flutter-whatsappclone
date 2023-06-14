import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/chatmodel.dart';
import 'package:whatsapp_clone/pages/chatdetailsscreen.dart';

class ChatTile extends StatelessWidget {
  ChatTile({Key? key,required this.chatdata
  }):super(key: key);
  Chat chatdata;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatDetails(chatdata: chatdata),
        
      )),
      title:Text(chatdata.name!),
      leading: CircleAvatar(
        backgroundImage:(chatdata.avatar=="")?AssetImage((chatdata.isGroup!)?'assets/images/group.png':"assets/images/dp.png"):AssetImage(chatdata.avatar!),),
      subtitle: Text(chatdata.message!),
      trailing: Text(chatdata.updatedAt!),
    );
    
  }
}
