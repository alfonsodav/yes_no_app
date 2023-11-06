import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const avatarImage = NetworkImage(
        'https://i.pinimg.com/474x/c9/85/52/c98552956665393920c4dc005712fd8c.jpg');
    //'https://i0.wp.com/codigoespagueti.com/wp-content/uploads/2022/04/Tienes-tantos-estilos-Asi-se-ve-Rei-Ayanami-con-un-cambio-de-look-en-Evangelion.jpg');
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: avatarImage,
          ),
        ),
        title: const Text('Mi amor'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messagesList.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messagesList[index];
                return (message.fromWho == FromWho.hers)
                    ? HerMessageBubble(message: message)
                    : MyMessageBubble(message: message);
              },
            )),
            MessageFieldBox(
              onValue: (value) => chatProvider.sendMessage(value),
            )
          ],
        ),
      ),
    );
  }
}
