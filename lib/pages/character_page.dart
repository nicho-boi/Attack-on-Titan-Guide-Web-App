import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/favorite_provider.dart';
import '../widgets/navbar.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({super.key});

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage>
    with SingleTickerProviderStateMixin {
  bool isHumanSelected = true;
  String selectedCharacter = 'Eren Yeager';

  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;

  final List<Map<String, String>> humans = [
    {
      'name': 'Eren Yeager',
      'image': 'assets/images/Eren.png',
      'thumb': 'assets/images/ERENF.png',
      'description':
          "Once a determined and impulsive youth, Eren Yeager evolves into one of the most complex figures in the battle for humanity's future. Initially driven by revenge against the Titans for destroying his home, Eren inherits the power of the Attack Titan and becomes central to the struggle between freedom and fate. His transformation challenges moral boundaries as he fights for what he believes is true freedom even at great cost.",
    },
    {
      'name': 'Mikasa Ackerman',
      'image': 'assets/images/mikasa.png',
      'thumb': 'assets/images/MIKASAF.png',
      'description':
          "Mikasa is Eren's adoptive sister and one of humanity's most formidable soldiers. Fiercely loyal and highly skilled, she is driven by her devotion to Eren and her friends. Mikasa's Ackerman heritage grants her exceptional strength and combat instincts, making her a key asset in the fight against the Titans.",
    },
    {
      'name': 'Armin Arlert',
      'image': 'assets/images/armin.png',
      'thumb': 'assets/images/ARMINF.png',
      'description':
          "Armin is a brilliant strategist and loyal friend. Despite his initial lack of confidence and physical strength, his intelligence and creativity have saved his comrades countless times. Armin's compassion and moral clarity often guide the group, and he eventually inherits the power of the Colossal Titan, facing difficult decisions for the sake of humanity.",
    },
    {
      'name': 'Levi Ackerman',
      'image': 'assets/images/Levi.png',
      'thumb': 'assets/images/LEVIF.png',
      'description':
          "Levi is humanity's strongest soldier and elite captain of the Survey Corps. Renowned for his exceptional combat skills, discipline, and leadership, Levi is both feared and respected by allies and enemies alike. Despite his stoic demeanor, he deeply cares for his comrades and is unwavering in his mission to protect humanity from the Titans.",
    },
    {
      'name': 'Jean Kirstein',
      'image': 'assets/images/jean.png',
      'thumb': 'assets/images/JEANF.png',
      'description':
          "Jean is a logical and resourceful member of the Survey Corps. Initially seen as pragmatic and sometimes cynical, he grows into a courageous leader who cares deeply for his comrades. Jean's ability to make tough decisions and his strong sense of responsibility make him a vital asset in humanity's fight for survival.",
    },
    {
      'name': 'Erwin Smith',
      'image': 'assets/images/Erwin.png',
      'thumb': 'assets/images/ERWINF.png',
      'description':
          "Erwin is the brilliant former Commander of the Survey Corps, renowned for his strategic genius and unwavering resolve. Driven by a relentless pursuit of truth and freedom for humanity, Erwin inspires loyalty and courage in his soldiers. His willingness to make difficult sacrifices for the greater good cements his legacy as one of humanity's greatest leaders.",
    },
    {
      'name': 'Hange Zoë',
      'image': 'assets/images/Hange.png',
      'thumb': 'assets/images/HANGEF.png',
      'description':
          "Hange is the eccentric and brilliant leader of the Survey Corps after Erwin. Fascinated by Titans, Hange approaches them with scientific curiosity and a desire to understand rather than simply destroy. Their inventive mind, compassion for both comrades and Titans, and fearless leadership make Hange a unique and beloved figure in humanity's fight for survival.",
    },
    {
      'name': 'Reiner Braun',
      'image': 'assets/images/Renier.png',
      'thumb': 'assets/images/RENIERF.png',
      'description':
          "Reiner is a complex and conflicted warrior who struggles with his dual identity as both a Marleyan soldier and a friend to those within the Walls. As the inheritor of the Armored Titan, he is burdened by guilt and responsibility, often torn between duty and personal bonds. Reiner's resilience and leadership make him a pivotal figure in the ongoing conflict.",
    },
  ];

  final List<Map<String, String>> titans = [
    {
      'name': 'Attack Titan',
      'image': 'assets/images/ATTACK.png',
      'thumb': 'assets/images/ATTACKF.png',
      'description':
          'The Attack Titan is known for its agility, combat prowess, and the ability to fight for freedom. It is one of the Nine Titans and is notable for its determination and willpower.',
    },
    {
      'name': 'Colossal Titan',
      'image': 'assets/images/COLOSSAL.png',
      'thumb': 'assets/images/COLF.png',
      'description':
          'The Colossal Titan is known for its immense size and ability to emit scalding steam, making it a formidable force on the battlefield. Its appearance often signals catastrophic destruction.',
    },
    {
      'name': 'Armored Titan',
      'image': 'assets/images/ARMORED.png',
      'thumb': 'assets/images/ARMF.png',
      'description':
          'The Armored Titan is known for its hardened, armor-like skin, making it exceptionally durable and resistant to attacks. It excels in both offense and defense on the battlefield.',
    },
    {
      'name': 'Beast Titan',
      'image': 'assets/images/BEAST.png',
      'thumb': 'assets/images/BEASTF.png',
      'description':
          'The Beast Titan is known for its unique ape-like appearance and intelligence. It possesses the ability to throw objects with devastating accuracy and can command Pure Titans, making it a formidable force in battle.',
    },
    {
      'name': 'Female Titan',
      'image': 'assets/images/FEMALE.png',
      'thumb': 'assets/images/FEMALEF.png',
      'description':
          'The Female Titan is known for its speed, agility, and ability to harden its skin. It is highly versatile in combat and can attract Pure Titans with its scream.',
    },
    {
      'name': 'Jaw Titan',
      'image': 'assets/images/JAW.png',
      'thumb': 'assets/images/JAWF.png',
      'description':
          'The Jaw Titan is known for its incredible speed, agility, and powerful jaws capable of crushing almost anything. It is one of the swiftest and most versatile of the Nine Titans, excelling in close combat and quick maneuvers.',
    },
    {
      'name': 'Cart Titan',
      'image': 'assets/images/CART.png',
      'thumb': 'assets/images/CARTF.png',
      'description':
          'The Cart Titan is known for its remarkable endurance and speed, capable of carrying heavy artillery and supplies over long distances. Its quadrupedal form allows for extended operations on the battlefield, making it a valuable asset for support and logistics.',
    },
    {
      'name': 'War Hammer Titan',
      'image': 'assets/images/WAR.png',
      'thumb': 'assets/images/WARF.png',
      'description':
          'The War Hammer Titan is known for its unique ability to create weapons and structures from hardened Titan flesh. It can fight at a distance and is highly versatile in combat, making it one of the most formidable of the Nine Titans.',
    },
  ];

  final Map<String, Map<String, int>> characterStats = {
    'Eren Yeager': {
      'Strength': 9,
      'Agility': 7,
      'Intelligence': 6,
      'Endurance': 8,
      'Leadership': 7,
    },
    'Mikasa Ackerman': {
      'Strength': 8,
      'Agility': 9,
      'Intelligence': 7,
      'Endurance': 7,
      'Leadership': 6,
    },
    'Armin Arlert': {
      'Strength': 4,
      'Agility': 5,
      'Intelligence': 10,
      'Endurance': 5,
      'Leadership': 8,
    },
    'Levi Ackerman': {
      'Strength': 9,
      'Agility': 10,
      'Intelligence': 8,
      'Endurance': 8,
      'Leadership': 7,
    },
    'Jean Kirstein': {
      'Strength': 7,
      'Agility': 7,
      'Intelligence': 7,
      'Endurance': 6,
      'Leadership': 7,
    },
    'Erwin Smith': {
      'Strength': 6,
      'Agility': 6,
      'Intelligence': 9,
      'Endurance': 7,
      'Leadership': 10,
    },
    'Hange Zoë': {
      'Strength': 5,
      'Agility': 6,
      'Intelligence': 9,
      'Endurance': 6,
      'Leadership': 7,
    },
    'Reiner Braun': {
      'Strength': 9,
      'Agility': 6,
      'Intelligence': 6,
      'Endurance': 9,
      'Leadership': 7,
    },
  };

  final Map<String, Map<String, int>> titanStats = {
    'Attack Titan': {
      'Strength': 10,
      'Agility': 9,
      'Intelligence': 7,
      'Endurance': 9,
      'Leadership': 6,
    },
    'Colossal Titan': {
      'Strength': 10,
      'Agility': 4,
      'Intelligence': 6,
      'Endurance': 10,
      'Leadership': 7,
    },
    'Armored Titan': {
      'Strength': 9,
      'Agility': 5,
      'Intelligence': 6,
      'Endurance': 10,
      'Leadership': 6,
    },
    'Beast Titan': {
      'Strength': 8,
      'Agility': 6,
      'Intelligence': 9,
      'Endurance': 8,
      'Leadership': 8,
    },
    'Female Titan': {
      'Strength': 8,
      'Agility': 9,
      'Intelligence': 8,
      'Endurance': 8,
      'Leadership': 7,
    },
    'Jaw Titan': {
      'Strength': 7,
      'Agility': 10,
      'Intelligence': 6,
      'Endurance': 7,
      'Leadership': 5,
    },
    'Cart Titan': {
      'Strength': 6,
      'Agility': 8,
      'Intelligence': 7,
      'Endurance': 9,
      'Leadership': 5,
    },
    'War Hammer Titan': {
      'Strength': 9,
      'Agility': 7,
      'Intelligence': 9,
      'Endurance': 8,
      'Leadership': 7,
    },
  };

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const bottomControlsHeight = 168.0;
    final characters = isHumanSelected ? humans : titans;
    final selected = characters.firstWhere(
      (char) => char['name'] == selectedCharacter,
      orElse: () => characters[0],
    );

    final isFavorite = Provider.of<FavoriteProvider>(
      context,
    ).isFavorite(selectedCharacter);

    return Scaffold(
      appBar: const NavBar(),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              isHumanSelected
                  ? 'assets/images/backgaot.jpg'
                  : 'assets/images/backg2.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            bottom: bottomControlsHeight,
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 10, bottom: 16),
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: _buildSelectedCharacter(selected, isFavorite),
                ),
              ),
            ),
          ),
          // Favorite button fixed at top right of the image
          Positioned(
            top: 40,
            right: 30,
            child: SafeArea(
              child: _buildFavoriteButton(selected, isFavorite, context),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 100, // Pushed up to allow space for tab bar above grid
            child: _buildTabBar(),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              color: Colors.black.withValues(alpha: 0.7),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: characters.map((character) {
                    final bool isSelected =
                        selectedCharacter == character['name'];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCharacter = character['name']!;
                          _controller.reset();
                          _controller.forward();
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: isSelected
                                ? Colors.amberAccent
                                : Colors.transparent,
                            width: 3,
                          ),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: Colors.amber.withValues(alpha: 0.6),
                                    blurRadius: 10,
                                    spreadRadius: 3,
                                  ),
                                ]
                              : [],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            character['thumb'] ?? character['image']!,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTabButton('Humans', true, Icons.people),
          const SizedBox(width: 12),
          _buildTabButton('Titans', false, Icons.flash_on),
        ],
      ),
    );
  }

  Widget _buildTabButton(String label, bool isHuman, IconData icon) {
    final bool isSelected = isHumanSelected == isHuman;
    return Expanded(
      child: ElevatedButton.icon(
        onPressed: () {
          setState(() {
            isHumanSelected = isHuman;
            selectedCharacter = isHuman
                ? humans[0]['name']!
                : titans[0]['name']!;
            _controller.reset();
            _controller.forward();
          });
        },
        icon: Icon(icon, size: 20),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.amber : Colors.grey[850],
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 12),
          elevation: isSelected ? 6 : 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: Colors.white30),
          ),
          shadowColor: isSelected ? Colors.amber : Colors.transparent,
        ),
      ),
    );
  }

  Widget _buildSelectedCharacter(
    Map<String, String> selected,
    bool isFavorite,
  ) {
    final mediaQuery = MediaQuery.of(context);
    final isCompactPhone =
        mediaQuery.size.width < 430 || mediaQuery.size.height < 760;
    final stats = isHumanSelected
        ? characterStats[selected['name']] ?? {}
        : titanStats[selected['name']] ?? {};

    return Column(
      children: [
        Image.asset(
          selected['image']!,
          height: isCompactPhone ? 190 : 230,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 6),
        Text(
          selected['name']!,
          style: const TextStyle(
            fontSize: 24,
            fontFamily: 'Ditty',
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.6),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (stats.isNotEmpty)
                  ...stats.entries.map((entry) {
                    final statName = entry.key;
                    final statValue = entry.value.toDouble();
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 90,
                            child: Text(
                              statName,
                              style: const TextStyle(
                                color: Colors.amberAccent,
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: LinearProgressIndicator(
                                value: statValue / 10,
                                backgroundColor: Colors.grey.shade800,
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                  Colors.amber,
                                ),
                                minHeight: 8,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            statValue.toInt().toString(),
                            style: const TextStyle(
                              color: Colors.amberAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                if (stats.isNotEmpty) const SizedBox(height: 10),
                Text(
                  selected['description'] ?? '',
                  style: TextStyle(
                    fontSize: isCompactPhone ? 13 : 14,
                    color: Colors.white70,
                    height: 1.3,
                  ),
                  textAlign: isCompactPhone ? TextAlign.left : TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildFavoriteButton(
    Map<String, String> selected,
    bool isFavorite,
    BuildContext context,
  ) {
    return Material(
      color: Colors.transparent,
      child: IconButton(
        onPressed: () {
          final favProvider = Provider.of<FavoriteProvider>(
            context,
            listen: false,
          );
          if (isFavorite) {
            favProvider.removeFavorite(selected['name']!);
          } else {
            favProvider.addFavorite(selected);
          }
        },
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: const Color.fromARGB(255, 255, 0, 0),
          size: 32,
        ),
        tooltip: isFavorite ? 'Remove from Favorites' : 'Add to Favorites',
        splashRadius: 26,
      ),
    );
  }
}
