import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message_entities.dart';
import 'package:yes_no_app/presentation/app/config/app_colors.dart';

class MyMessageBubble extends StatelessWidget {
  final MessageEntities message ;
  const MyMessageBubble({super.key, required this.message});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration:const  BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.only(
               topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
            )
          ),
          child:  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(message.text, style: const TextStyle(color: Colors.white),),
          ),
        )
      ],
    );
  }
}