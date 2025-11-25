import 'package:fitness_app/app/design/design_tokens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationScaffold extends StatelessWidget {
  final StatefulNavigationShell shell;

  const BottomNavigationScaffold({super.key, required this.shell});

  void _onTap(int index) =>
      shell.goBranch(index, initialLocation: index == shell.currentIndex);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: shell,
      bottomNavigationBar: Container(
        height: 95,
        decoration: BoxDecoration(
          color: DesignTokens.bg,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: DesignTokens.bgBlack,
            borderRadius: BorderRadius.circular(30),
          ),
          margin: EdgeInsets.fromLTRB(24, 12, 24, 32),
          padding: EdgeInsets.symmetric(vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _NavigationItem(
                icon: Icons.home_outlined,
                isSelected: shell.currentIndex == 0,
                onTap: () => _onTap(0),
              ),
              _NavigationItem(
                icon: Icons.fitness_center_outlined,
                isSelected: shell.currentIndex == 1,
                onTap: () => _onTap(1),
              ),
              _NavigationItem(
                icon: Icons.person_outline,
                isSelected: shell.currentIndex == 2,
                onTap: () => _onTap(2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavigationItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavigationItem({
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? DesignTokens.bg : Colors.transparent,
        ),
        child: Icon(
          icon,
          color: isSelected ? DesignTokens.bgBlack : DesignTokens.bg,
          size: DesignTokens.s6,
        ),
      ),
    );
  }
}
