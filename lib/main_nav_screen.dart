import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color accent = Color(0xFF7B61FF); // Purple
  static const Color glassBg = Color.fromRGBO(255, 255, 255, 0.15);
}

/// A clean, responsive glassy bottom nav bar with:
/// - 4 tabs
/// - 1 center floating button
/// - automatic active highlighting
/// - customizable center icon + action
class MainNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemSelected;

  /// NEW → customizable center button parameters
  final IconData centerIcon;
  final VoidCallback? centerAction;

  const MainNavBar({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
    this.centerIcon = Icons.local_parking_rounded, // Default is "P" icon
    this.centerAction,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(26),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: 75,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: AppColors.glassBg,
            borderRadius: BorderRadius.circular(26),
            border: Border.all(color: Colors.white.withOpacity(0.08)),
          ),
          child: Row(
            children: [
              _expandedNavItem(Icons.home, "Home", 0),
              _expandedNavItem(Icons.map_outlined, "Map", 1),

              /// Center main action button
              _centerButton(),

              _expandedNavItem(Icons.list_alt, "Bookings", 2),
              _expandedNavItem(Icons.account_circle, "Profile", 3),
            ],
          ),
        ),
      ),
    );
  }

  /// LEFT & RIGHT NAV ITEMS (Even Spacing)
  Widget _expandedNavItem(IconData icon, String label, int index) {
    final bool active = (currentIndex == index);

    return Expanded(
      child: GestureDetector(
        onTap: () => onItemSelected(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 22,
              color: active ? AppColors.accent : Colors.white70,
            ),
            const SizedBox(height: 3),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 10,
                fontWeight: active ? FontWeight.w600 : FontWeight.w400,
                color: active ? AppColors.accent : Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// CENTER ACTION BUTTON (Customizable)
  Widget _centerButton() {
    final bool active = (currentIndex == 10);

    return Container(
      width: 70,
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: centerAction ?? () => onItemSelected(10),
        child: Container(
          height: 58,
          width: 58,
          decoration: BoxDecoration(
            color: AppColors.accent,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              if (active)
                BoxShadow(
                  color: AppColors.accent.withOpacity(0.4),
                  blurRadius: 16,
                  offset: const Offset(0, 8),
                ),
            ],
          ),
          child: Icon(
            centerIcon,
            color: Colors.white,
            size: 26,
          ),
        ),
      ),
    );
  }
}
