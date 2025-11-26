import 'package:fitness_app/app/design/design_tokens.dart';
import 'package:flutter/material.dart';

class DailyChallengeCard extends StatelessWidget {
  const DailyChallengeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(DesignTokens.s5),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            DesignTokens.challengeGradientStart,
            DesignTokens.challengeGradientEnd,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(DesignTokens.radiusCard),
        boxShadow: [
          BoxShadow(
            color: DesignTokens.shadowLight,
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Daily challenge',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: DesignTokens.textPrimary,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: DesignTokens.s2),
              child: Text(
                'Do your plan before 9:00 AM',
                style: TextStyle(
                  fontSize: 14,
                  color: DesignTokens.textSecondary,
                ),
              ),
            ),
            Row(
              children: [
                _UserChip(
                  imageUrl:
                      'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=40&h=40&fit=crop&crop=face',
                ),
                Transform.translate(
                  offset: Offset(-8, 0),
                  child: _UserChip(
                    imageUrl:
                        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=40&h=40&fit=crop&crop=face',
                  ),
                ),
                Transform.translate(
                  offset: Offset(-16, 0),
                  child: _UserChip(
                    imageUrl:
                        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=40&h=40&fit=crop&crop=face',
                  ),
                ),
                Transform.translate(
                  offset: Offset(-24, 0),
                  child: _UserChip(
                    imageUrl:
                        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=40&h=40&fit=crop&crop=face',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _UserChip extends StatelessWidget {
  final String imageUrl;

  const _UserChip({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: DesignTokens.bgWhite, width: 2),
      ),
      child: ClipOval(
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder:
              (context, error, stackTrace) => Container(
                color: DesignTokens.iconLightGrey,
                child: Icon(
                  Icons.person,
                  color: DesignTokens.iconGrey,
                  size: 16,
                ),
              ),
        ),
      ),
    );
  }
}
