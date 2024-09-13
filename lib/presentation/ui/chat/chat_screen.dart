import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message_entities.dart';
import 'package:yes_no_app/presentation/app/config/app_colors.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/ui/chat/widgets/her_message.dart';
import 'package:yes_no_app/presentation/ui/chat/widgets/my_message.dart';
import 'package:yes_no_app/presentation/ui/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const  
        Center(
          child: Text('Chat ', style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold ),),
        ),
        leading: const Padding(
            padding: EdgeInsets.all(8.0), 
            child: CircleAvatar(
                backgroundImage:NetworkImage('https://ih1.redbubble.net/image.4598437271.1234/st,small,507x507-pad,600x600,f8f8f8.webp'),
            ),
        
      )),
      body: _ChatView(),
    );
  }
}
class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: chatProvider.scrollController,
              itemCount: chatProvider.messages.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messages[index];
                return  message.fromWho == FromWho.me ?  MyMessageBubble(message:message) :  HerMessageBubble( message: message);
              },
            ),
          ),
          const Divider(height: 1),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: MessageFieldBox(
              onValue: (value)=> chatProvider.sendMessage(value),
            ) ,
          )
        ],
      ),
    );
  }
}
