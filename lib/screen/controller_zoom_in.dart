import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class ZoomIconWidget extends StatelessWidget {
  const ZoomIconWidget({
    super.key,
    required this.controller,
    required this.iconWidget,
    required this.onTap,
    required this.text,
  });

  final MapController controller;
  final String text;
  final IconData iconWidget;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Row(
        children: [
          Icon(iconWidget),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Colors.black),
          )
        ],
      ),
    );
  }
}
