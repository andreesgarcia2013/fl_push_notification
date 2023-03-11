import 'package:flutter/material.dart';

class MessageNotification extends StatelessWidget {
  final VoidCallback onReplay;

  const MessageNotification({Key? key, required this.onReplay}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(80),),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: SafeArea(
        child: ListTile(
          leading: SizedBox.fromSize(
              size: const Size(40, 40),
              child: ClipOval(child: Image.asset('assets/Apple_logo_black.svg.png'))),
          title: Text('Lily MacDonald'),
          subtitle: Text('Do you want to see a movie?'),
          trailing: IconButton(
              icon: Icon(Icons.reply),
              onPressed: () {
                ///TODO i'm not sure it should be use this widget' BuildContext to create a Dialog
                ///maybe i will give the answer in the future
                if (onReplay != null) onReplay();
              }),
        ),
      ),
    );
  }
}