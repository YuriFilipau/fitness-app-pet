import 'package:fitness_app/app/design/design_tokens.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeeklyList extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;

  const WeeklyList({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    final currentTime = DateTime.now();
    final startOfWeek = currentTime.subtract(
      Duration(days: currentTime.weekday - 1),
    );

    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 16),
      child: SizedBox(
        height: 60,
        child: ListView.builder(
          itemCount: 7,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final date = startOfWeek.add(Duration(days: index));
            final isSelected =
                date.day == selectedDate.day &&
                date.month == selectedDate.month &&
                date.year == selectedDate.year;
            return GestureDetector(
              onTap: () => onDateSelected(date),
              child: Container(
                width: 60,
                margin: EdgeInsets.only(right: DesignTokens.s3),
                decoration: BoxDecoration(
                  color: isSelected ? DesignTokens.bgBlack : DesignTokens.bgWhite,
                  borderRadius: BorderRadius.circular(
                    DesignTokens.radiusCardSmall,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: DesignTokens.shadowMedium,
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      DateFormat('E').format(date),
                      style: TextStyle(
                        color:
                            isSelected
                                ? DesignTokens.textWhite
                                : DesignTokens.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
