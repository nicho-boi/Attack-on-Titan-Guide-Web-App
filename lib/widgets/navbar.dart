import 'package:flutter/material.dart';
import '/pages/character_page.dart';
import '/pages/home_page.dart';
import '/pages/quiz_page.dart';
import '/pages/user_profile_page.dart';
import '/pages/favorites_page.dart'; // ✅ Import FavoritesPage

class NavBar extends StatefulWidget implements PreferredSizeWidget {
  const NavBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final Map<String, bool> _isHovering = {
    "ABOUT": false,
    "CHARACTERS": false,
    "SCOUT QUIZ": false,
    "FAVORITES": false, // ✅ New
    "PROFILE": false,
  };

  final Map<String, IconData> _iconMap = {
    "CHARACTERS": Icons.person,
    "SCOUT QUIZ": Icons.quiz,
    "FAVORITES": Icons.favorite, // ✅ Fallback icon
    "PROFILE": Icons.account_circle,
  };

  final Map<String, String> _tooltipMap = {
    "ABOUT": "About",
    "CHARACTERS": "Characters",
    "SCOUT QUIZ": "Scout Quiz",
    "FAVORITES": "Your Favorite Characters", // ✅ Tooltip
    "PROFILE": "User Profile",
  };

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black.withOpacity(0.3),
      elevation: 0,
      centerTitle: false,
      titleSpacing: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _desktopIconButton(context, "ABOUT"),
          _desktopIconButton(context, "CHARACTERS"),
          _desktopIconButton(context, "SCOUT QUIZ"),
          _desktopIconButton(context, "FAVORITES"), // ✅ New
          _desktopIconButton(context, "PROFILE"),
        ],
      ),
    );
  }

  Widget _desktopIconButton(BuildContext context, String label) {
    final bool hovering = _isHovering[label] ?? false;

    Widget iconWidget;
    if (label == "ABOUT") {
      iconWidget = Image.asset(
        'assets/images/icon1.png',
        width: 30,
        height: 30,
        fit: BoxFit.contain,
      );
    } else if (label == "CHARACTERS") {
      iconWidget = Image.asset(
        'assets/images/odm.png',
        width: 30,
        height: 30,
        fit: BoxFit.contain,
        color: hovering ? Colors.red : Colors.white,
        colorBlendMode: BlendMode.srcIn,
      );
    } else if (label == "SCOUT QUIZ") {
      iconWidget = Image.asset(
        'assets/images/icon2.png',
        width: 30,
        height: 30,
        fit: BoxFit.contain,
        color: hovering ? Colors.red : Colors.white,
        colorBlendMode: BlendMode.srcIn,
      );
    } else if (label == "FAVORITES") {
      iconWidget = Image.asset(
        'assets/images/favoriteicon.png', // ✅ Your own asset
        width: 30,
        height: 30,
        fit: BoxFit.contain,
        color: hovering ? Colors.red : Colors.white,
        colorBlendMode: BlendMode.srcIn,
      );
    } else if (label == "PROFILE") {
      iconWidget = Image.asset(
        'assets/images/profile_icon.png',
        width: 30,
        height: 30,
        fit: BoxFit.contain,
        color: hovering ? Colors.red : Colors.white,
        colorBlendMode: BlendMode.srcIn,
      );
    } else {
      iconWidget = Icon(
        _iconMap[label],
        size: 30,
        color: hovering ? Colors.red : Colors.white,
      );
    }

    return MouseRegion(
      onEnter: (_) => _setHover(label, true),
      onExit: (_) => _setHover(label, false),
      cursor: SystemMouseCursors.click,
      child: SizedBox(
        width: 74,
        height: 58,
        child: GestureDetector(
          onTap: () => _handleNavigation(context, label),
          child: Tooltip(
            message: _tooltipMap[label] ?? '',
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    boxShadow: hovering
                        ? [
                            BoxShadow(
                              color: Colors.red.withOpacity(0.8),
                              blurRadius: 12,
                              spreadRadius: 1,
                            ),
                          ]
                        : [],
                  ),
                  child: iconWidget,
                ),
                const SizedBox(height: 4),
                Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: hovering ? Colors.red : Colors.white,
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _setHover(String label, bool isHovering) {
    setState(() {
      _isHovering[label] = isHovering;
    });
  }

  void _handleNavigation(BuildContext context, String label) {
    if (label == "ABOUT") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else if (label == "CHARACTERS") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const CharacterPage()),
      );
    } else if (label == "SCOUT QUIZ") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const QuizPage()),
      );
    } else if (label == "FAVORITES") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const FavoritesPage()),
      );
    } else if (label == "PROFILE") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const UserProfilePage()),
      );
    }
  }
}
