import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;
  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 5),
        // Not null image verifiy
        if (message.imageUrl != null) _ImageBubble(message.imageUrl!)
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;
  const _ImageBubble(this.imageUrl);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var myImage = imageUrl;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        myImage,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.fill,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return _MessageLoandingDefauld(size: size);
        },
      ),
    );
  }
}

class _MessageLoandingDefauld extends StatelessWidget {
  const _MessageLoandingDefauld({
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.7,
      height: 150,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: const Center(child: Text('Mi amor esta enviando una imagen')),
    );
  }
}
