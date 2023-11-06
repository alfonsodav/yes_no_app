import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();
    final chatProvider = context.watch<ChatProvider>();

    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(30));
    // final colors = Theme.of(context).colorScheme;
    var inputDecoration = InputDecoration(
        hintText: 'End you message with a "??"',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: () {
            final textValue = textController.value.text;
            // Usando OnValue para devolver el valor cambiado -->[S6/L07] Flutter Móvil: de Cero a Experto - Añadir mensajes al provider
            onValue(textValue);
            textController.clear();
          },
        ));
    return TextFormField(
        focusNode: focusNode,
        controller: textController,
        decoration: inputDecoration,
        onTapOutside: (event) {
          focusNode.unfocus();
        },
        autofocus: true,
        onFieldSubmitted: (value) {
          print('Summit: $value');
          // Usando el provider directamente
          chatProvider.sendMessage(value);
          textController.clear();
          focusNode.requestFocus();
        });
  }
}
