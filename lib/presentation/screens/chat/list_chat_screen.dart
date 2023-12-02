import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/screens/chat/chat_screen.dart';
import 'package:yes_no_app/presentation/widgets/shared/appbar.dart';

class ListChatScreen extends StatelessWidget {
  const ListChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final listChat = [1, 2, 3, 4, 5];

    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: listChat.length,
                  itemBuilder: (context, index) => const _Items())),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            listChat.add(1);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ChatScreen()));
          },
          icon: const Icon(Icons.add),
          label: const Text("Nuevo Chat")),
    );
  }
}

class _Items extends StatelessWidget {
  final int index;
  const _Items({this.index = 0});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: NetworkImage(
            'https://i.pinimg.com/474x/c9/85/52/c98552956665393920c4dc005712fd8c.jpg'),
      ),
      title: Text('hola mundo $index'),
      subtitle: Text('contenido $index'),
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => const ChatScreen())),
    );
  }
}
