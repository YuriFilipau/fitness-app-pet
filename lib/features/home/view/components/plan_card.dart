import 'package:fitness_app/app/design/design_tokens.dart';
import 'package:flutter/material.dart';

class PlanCard extends StatelessWidget {
  final Color color;
  final String difficulty;
  final String title;
  final String date;
  final String time;
  final String room;
  final String trainer;
  final String trainerImage;
  final bool isLeft;
  final VoidCallback onTap;

  const PlanCard({
    super.key,
    required this.color,
    required this.difficulty,
    required this.title,
    required this.date,
    required this.time,
    required this.room,
    required this.trainer,
    required this.trainerImage,
    required this.isLeft,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(DesignTokens.s4),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(DesignTokens.radiusChip),
          boxShadow: [
            BoxShadow(
              color: DesignTokens.shadowMedium,
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(DesignTokens.s2),
                color: DesignTokens.bgWhite.withValues(alpha: 0.3),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: DesignTokens.s2,
                vertical: DesignTokens.s1,
              ),
              child: Text(
                difficulty,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: DesignTokens.textPrimary,
                ),
              ),
            ),
            Text(
              date,
              style: TextStyle(fontSize: 12, color: DesignTokens.textSecondary),
            ),
            Text(
              time,
              style: TextStyle(fontSize: 12, color: DesignTokens.textSecondary),
            ),
            Text(
              room,
              style: TextStyle(fontSize: 12, color: DesignTokens.textSecondary),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  if (isLeft) ...[
                    CircleAvatar(radius: 12, backgroundImage: NetworkImage(trainerImage)),
                    SizedBox(width: DesignTokens.s2),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Trainer',
                          style: TextStyle(
                            fontSize: 10,
                            color: DesignTokens.textSecondary,
                          ),
                        ),
                        Text(
                          trainer,
                          style: TextStyle(
                            fontSize: 12,
                            color: DesignTokens.textPrimary,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
