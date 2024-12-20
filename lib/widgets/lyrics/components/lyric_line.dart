import 'package:flutter/material.dart';
import 'package:asmrapp/core/audio/models/subtitle.dart';

class LyricLine extends StatelessWidget {
  final Subtitle subtitle;
  final bool isActive;
  final double opacity;
  
  const LyricLine({
    super.key,
    required this.subtitle,
    this.isActive = false,
    this.opacity = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: opacity,
      child: Text(
        subtitle.text,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontSize: 18,
          height: 1.2,
          color: isActive 
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
          fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
        ),
        textAlign: TextAlign.center,
        maxLines: isActive ? null : 1,
        overflow: isActive ? TextOverflow.visible : TextOverflow.ellipsis,
      ),
    );
  }
} 