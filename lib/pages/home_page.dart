import 'package:flutter/material.dart';
import 'character_page.dart';
import '../widgets/navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const NavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero image section with full screen height
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/home_hero.jpg',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/images/Attack On Titan (1).jpg',
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                  Align(
                    alignment: const Alignment(0, -0.55),
                    child: Image.asset('assets/images/logo.png', width: 300),
                  ),
                  Align(
                    alignment: const Alignment(0, 0.55),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CharacterPage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF8F241B),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 28,
                              vertical: 14,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: const BorderSide(color: Colors.white30),
                            ),
                          ),
                          child: const Text(
                            'Enter the Walls',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Info Section with background image
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/wallmariabg.jpg'),
                  fit: BoxFit.cover,
                  opacity: 0.4,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Humanity's Last Stand",
                    style: TextStyle(
                      fontFamily: 'Ditty',
                      fontSize: 35,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 5,
                          color: Colors.black54,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Explore the world beyond the walls",
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),

                  const SizedBox(height: 40),

                  const Text(
                    "About Attack on Titan",
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "In a world where humanity lives behind massive walls to protect themselves from giant humanoid creatures called Titans, young Eren Yeager joins the Survey Corps to fight back and reclaim their freedom. Experience the epic story of survival, sacrifice, and the truth behind the Titans.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Wrap(
                    spacing: 20,
                    children: [
                      Chip(
                        label: Text("Anime"),
                        backgroundColor: Colors.redAccent,
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                      Chip(
                        label: Text("Manga"),
                        backgroundColor: Colors.deepPurple,
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                      Chip(
                        label: Text("Completed"),
                        backgroundColor: Colors.green,
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                      Chip(
                        label: Text("Game"),
                        backgroundColor: Color.fromARGB(255, 24, 120, 106),
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Carousel Banner Section
            Container(
              color: Colors.grey[900],
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Column(
                children: [
                  const Text(
                    "Action Shots",
                    style: TextStyle(fontFamily: 'Ditty', fontSize: 30),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 180,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      children: [
                        bannerImage('assets/images/banner1.jpg'),
                        bannerImage('assets/images/banner2.jpg'),
                        bannerImage('assets/images/banner3.jpg'),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Featured Characters Section
            Container(
              color: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Featured Characters",
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      characterTile(
                        "Eren Yeager",
                        "The protagonist who inherits the Attack Titan.",
                        "assets/images/Eren.png",
                      ),
                      characterTile(
                        "Mikasa Ackerman",
                        "Eren's loyal friend and elite soldier.",
                        "assets/images/mikasa.png",
                      ),
                      characterTile(
                        "Levi Ackerman",
                        "Humanity's strongest soldier.",
                        "assets/images/Levi.png",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bannerImage(String path) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(path, height: 160),
      ),
    );
  }

  Widget characterTile(String name, String description, String imagePath) {
    return Card(
      color: Colors.grey[850],
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(imagePath),
          radius: 30,
        ),
        title: Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          description,
          style: const TextStyle(color: Colors.white70),
        ),
      ),
    );
  }
}
