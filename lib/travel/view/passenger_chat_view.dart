import 'package:app_texi_passenger/app/app_router.dart';
import 'package:app_texi_passenger/app/widgets/chat_day_divider_widget.dart';
import 'package:app_texi_passenger/app/widgets/chat_input_bar_widget.dart';
import 'package:app_texi_passenger/app/widgets/chat_location_bubble_widget.dart';
import 'package:app_texi_passenger/app/widgets/chat_message_bubble_widget.dart';
import 'package:app_texi_passenger/app/widgets/person_info_chat_widget.dart';
import 'package:app_texi_passenger/app/widgets/secondary_button_widget.dart';
import 'package:app_texi_passenger/l10n/l10n_extension.dart';
import 'package:app_texi_passenger/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PassengerChatView extends HookWidget {
  const PassengerChatView({super.key});

  @override
  Widget build(BuildContext context) {
    final msgs = <Widget>[
      ChatMessageBubble(text: 'Hola, soy Carlos. Estoy esperando en el punto de recogida indicado.', timeText: '10:15'),
      ChatMessageBubble(text: 'Hola Carlos, estoy saliendo del edificio. Llevo una camisa azul y mochila negra.', timeText: '10:16', isMe: true),
      ChatMessageBubble(text: 'Perfecto. Estoy en un Toyota Corolla gris, placa ABC-123. Estacionado justo frente a la entrada principal.', timeText: '10:17'),
      ChatMessageBubble(text: 'Ya te veo. Estoy cruzando la calle, llego en un minuto.', timeText: '10:18', isMe: true),
      ChatMessageBubble(text: 'Te espero. ¿Necesitas ayuda con equipaje?', timeText: '10:18'),
      ChatLocationBubble(title: 'Ubicación compartida', subtitle: 'Av. Insurgentes Sur 1602', timeText: '10:19'),
      ChatDayDivider(text: 'Hoy 10:20'),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PersonInfoChat(
          name: 'Miguel Angel Rojas',
          avatarImage: NetworkImage(''),
        ),
        Divider(
          thickness: 8,
          color: lightColorScheme.secondaryContainer,
          height: 40,
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            children: msgs,
          ),
        ),
        SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ChatInputBar(
                onTap: (){},
              ),
              SizedBox(height: 10),
              SecondaryButton(
                text: context.intl.btnBack,
                onPressed: () => appRouter.push('/travel/driver_tracking'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}