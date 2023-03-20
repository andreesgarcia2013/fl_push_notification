import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class MessageNotification extends StatelessWidget {
  final VoidCallback onReplay;
  final String action;
  const MessageNotification({Key? key, required this.onReplay, required  this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, action);
        OverlaySupportEntry.of(context)?.dismiss();
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: SafeArea(
          child: ListTile(
            leading: SizedBox.fromSize(
                size: const Size(40, 40),
                child: ClipOval(
                    child: Container(
                  color: Colors.black,
                ))),
            title: Text('FilledStacks'),
            subtitle: Text('Thanks for checking out my tutorial'),
            trailing: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  OverlaySupportEntry.of(context)?.dismiss();
                }),
          ),
        ),
      ),
    );
  }
}