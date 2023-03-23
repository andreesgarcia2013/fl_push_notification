import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:notifications_app/providers/noti_screen.dart';
import 'package:notifications_app/screens/screens.dart';
import 'package:notifications_app/services/message_screen_observer.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

class MessageNotification extends StatelessWidget {
  final VoidCallback onReplay;
  final String action;
  const MessageNotification({Key? key, required this.onReplay, required  this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
         // Obtener la referencia a MessageScreen utilizando un NavigatorObserver
        // final messageScreenObserver = MessageScreenObserver.instance;
        // final isMessageScreenOpen = messageScreenObserver.isMessageScreenOpen;

        // if (isMessageScreenOpen) {
        //   // Si ya se encuentra en MessageScreen, llamar al método setState en MessageScreen
        //   messageScreenObserver.isMessageScreenOpen = true;
        //   Navigator.of(context).pop();
        //   Navigator.of(context).pushNamed('message');
        // } else {
        //   // Si no se encuentra en MessageScreen, empujar una nueva instancia de MessageScreen
        //   Navigator.of(context).pushNamed('message');
        // }
        //TODO: Hace falta recargar la pantalla
        print(NotiScreen.isScreenOpen);
        if (NotiScreen.isScreenOpen==false) {
          print('Puedes abrir el buzon');
          OverlaySupportEntry.of(context)?.dismiss();
          NotiScreen.isScreenOpen = true;
          await Navigator.of(context).push(MaterialPageRoute(builder: (_) => MessageScreen()));
        }
        else{
          OverlaySupportEntry.of(context)?.dismiss();
          // Navigator.pop(context);
          // print('Hice pop y la pantalla esta ${NotiScreen.isScreenOpen}');
          
          
          print('te mantienes en buzon');
          // NotiScreen.isScreenOpen = true;
          return;
        }
        
        // final openScreen=Provider.of<NotiScreen>(context, listen: false);
        // print(openScreen.notiScreen);
        // if (openScreen.notiScreen==true) {
        //   print('deberias actualizar');
        //   Navigator.pop(context);
        //   openScreen.notiScreen=true;
        //   Navigator.of(context).push(MaterialPageRoute(builder: (contexto) => MessageScreen()));
        //   OverlaySupportEntry.of(context)?.dismiss();
        //   return;
        // }
        // else{
        //   OverlaySupportEntry.of(context)?.dismiss();
        //   openScreen.notiScreen=true;
        //   print('abreteeeee');
        //   Navigator.of(context).push(MaterialPageRoute(builder: (contexto) => MessageScreen()));
        // }
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