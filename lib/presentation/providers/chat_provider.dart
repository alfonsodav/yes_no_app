import 'dart:io';
import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:path_provider/path_provider.dart';

class ChatProvider extends ChangeNotifier {
  late File fileMessageList;
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();
  List<Message> messagesList = [
    Message(text: 'hola amor', fromWho: FromWho.me),
    Message(text: 'ya regresaste del trabajo?', fromWho: FromWho.me),
    Message(
        text: 'si amor',
        imageUrl:
            'https://tatic.myfigurecollection.net/upload/items/1/1298203-1c352.jpg',
        fromWho: FromWho.hers),
    Message(text: 'como estas?', fromWho: FromWho.hers),
  ];
  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messagesList.add(newMessage);
    if (text.endsWith('?')) {
      herReply();
    }
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messagesList.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }

  Future<File> getFileMessage() async {
    final applicatioDir = await getApplicationCacheDirectory();
    final path = applicatioDir.path;
    fileMessageList = File('$path/message_list.json');
    return fileMessageList;
  }

  Future<String> getChatMessages() async {
    final file = await getFileMessage();
    final String contents = await file.readAsString();
    return contents;
  }
}
