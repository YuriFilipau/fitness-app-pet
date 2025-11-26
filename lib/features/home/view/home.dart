import 'package:fitness_app/app/design/design_tokens.dart';
import 'package:fitness_app/features/home/view/components/daily_challenge_card.dart';
import 'package:fitness_app/features/home/view/components/plan_card.dart';
import 'package:fitness_app/features/home/view/components/weekly_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime _selected = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: DesignTokens.bg,
        appBar: AppBar(
          backgroundColor: DesignTokens.bg,
          elevation: 0,
          toolbarHeight: 100,
          title: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: DesignTokens.s4),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: DesignTokens.bgWhite, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: DesignTokens.shadowMedium,
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.network(
                    'src',
                    //'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=100&h=100&fit=crop&crop=face',
                    fit: BoxFit.cover,
                    errorBuilder:
                        (context, error, stackTrace) =>
                        Container(
                          color: DesignTokens.iconLightGrey.withValues(
                            alpha: 0.3,
                          ),
                          child: Icon(
                              Icons.person, color: DesignTokens.iconGrey),
                        ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hello, Yury',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: DesignTokens.textPrimary,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: DesignTokens.s1)),
                    Text(
                      'Today ${DateFormat('d.MM.').format(DateTime.now())}',
                      style: TextStyle(
                        fontSize: 14,
                        color: DesignTokens.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: DesignTokens.bgWhite,
                  borderRadius: BorderRadius.circular(
                    DesignTokens.radiusCardSmall,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: DesignTokens.shadowLight,
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                    Icons.search, color: DesignTokens.iconGrey, size: 20),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(DesignTokens.s5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DailyChallengeCard(),
              WeeklyList(
                selectedDate: _selected,
                onDateSelected: (date) => setState(() => _selected = date),
              ),
              GridView.builder(
                itemCount: 7,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  final isLeft = index % 2 == 0;
                  return PlanCard(
                    color: isLeft ? DesignTokens.cardYellow : DesignTokens
                        .cardBlue,
                    difficulty: isLeft ? 'Medium' : 'Light',
                    title: isLeft ? 'Yoga Group' : 'Stretch',
                    date: isLeft ? '25 Nov.' : '28 Nov.',
                    time: isLeft ? '14:00-15:00' : '18:00-19:30',
                    room: isLeft ? 'A5 room' : 'A2 room',
                    trainer: 'Tiffany Way',
                    trainerImage:
                    'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=40&h=40&fit=crop&crop=face',
                    isLeft: isLeft,
                    onTap: () => context.go('/session-detail'),
                  );
                },
              ),
            ],
          ),
        )
    );
  }
}
