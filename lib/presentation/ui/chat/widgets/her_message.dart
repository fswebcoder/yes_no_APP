import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message_entities.dart';
import 'package:yes_no_app/presentation/app/config/app_colors.dart';

class HerMessageBubble extends StatelessWidget {
  final MessageEntities message;

  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration:const  BoxDecoration(
            color: AppColors.secondaryColor,
            borderRadius: BorderRadius.only(
               topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(message.text, style: const TextStyle(color: Colors.white),),
          ),
        ),
        _ImageBubble(imagurl: message.imageUrl!)
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {

  final String imagurl;

  const _ImageBubble({required this.imagurl});


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
          imagurl,
         width:size.width * 0.7,
         height:  150,
         fit: BoxFit.cover,
         loadingBuilder: (context, child, loadingProgress) {
           if(loadingProgress == null ) return child ;
           return const Padding(
             padding:  EdgeInsets.all(8.0),
             child:  Center(child:  CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
             )),
           );
         },
        ),  
     
    );
  }
}