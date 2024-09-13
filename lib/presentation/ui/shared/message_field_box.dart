import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/app/config/app_colors.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    return TextFormField(
      focusNode: focusNode,
      controller: textController,
      decoration: InputDecoration(
        hintText: 'End your message with a (?)',
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: AppColors.secondaryColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        suffixIcon: IconButton(
          icon: const Icon(Icons.send),
          onPressed: () {
            final textValue = textController.text.trim();  
            if (textValue.isNotEmpty) {
              onValue(textValue);
              textController.clear();  
              focusNode.requestFocus(); 
            }
          },
        ),
      ),
      onFieldSubmitted: (value) {
        if (value.trim().isNotEmpty) {
          onValue(value);
          textController.clear();  
          focusNode.requestFocus(); 
        }
      },
    );
  }
}
