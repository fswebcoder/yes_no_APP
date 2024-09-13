import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message_entities.dart';
import 'package:yes_no_app/presentation/app/config/helpers/get_yes_no_answer.dart';

class ChatProvider extends ChangeNotifier{

  final ScrollController scrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<MessageEntities> messages = [];

  Future<void>  sendMessage(String text) async{
    if(text.isEmpty) return;
     final newMessage  =  MessageEntities(text: text, fromWho: FromWho.me);
     messages.add(newMessage);
     if(text.endsWith('?')){
       herReply();
     }
     notifyListeners();
     moveScrollToBottom();
  }

  Future<void> herReply() async{
    final herMessage = getYesNoAnswer.getAnswer();
    messages.add(await herMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  void moveScrollToBottom() async{
    await Future.delayed(const Duration(milliseconds: 100));
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.bounceInOut,
    );
  }

}