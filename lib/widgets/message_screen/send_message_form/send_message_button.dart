import 'package:flutter/material.dart';

class SendMessageButton extends StatelessWidget {
  const SendMessageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: const SendMessageButtonUI(),
    );
  }
}

class SendMessageButtonUI extends StatelessWidget {
  const SendMessageButtonUI({super.key});
  @override
  Widget build(BuildContext context) {
    return Container( 
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(100)
      ),
      child: Icon(Icons.send,color: Theme.of(context).primaryColor,),
    );
  }
}