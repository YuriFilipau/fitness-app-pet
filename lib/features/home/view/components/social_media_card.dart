import 'package:fitness_app/app/design/design_tokens.dart';
import 'package:flutter/material.dart';

class SocialMediaCard extends StatelessWidget {
  const SocialMediaCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _SocialIcon(icon: Icons.camera_alt, color: DesignTokens.socialPink),
          _SocialIcon(
            icon: Icons.play_circle_outline,
            color: DesignTokens.socialRed,
          ),
          _SocialIcon(
            icon: Icons.chat_bubble_outline,
            color: DesignTokens.socialBlue,
          ),
        ],
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  const _SocialIcon({required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: DesignTokens.bgWhite,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: DesignTokens.shadowMedium,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Icon(icon, color: color, size: 20),
    );
  }
}
