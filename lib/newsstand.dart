import 'package:flutter/material.dart';
import 'package:my_grocery_app/app_drawer.dart';

class Newsstand extends StatefulWidget {
  const Newsstand({super.key});

  @override
  State<Newsstand> createState() => _NewsstandState();
}

class _NewsstandState extends State<Newsstand> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    final List<String> news = args?['news'] ?? ['No news available'];


    final Map<String, String> descriptions = {
      'Top Stories': 'Latest breaking news from around the world.',
      'World': 'Global news and updates from every continent.',
      'Business': 'Market trends, company news, and financial insights.',
      'Technology': 'Innovations, gadgets, and tech industry updates.',
      'Entertainment': 'Movies, music, celebrities, and pop culture.',
      'Sports': 'Scores, highlights, and sports news.',
      'Science': 'Discoveries, research, and scientific advancements.',
      'Health': 'Wellness tips, medical news, and healthy living.',
    };


    final Map<String, IconData> icons = {
      'Top Stories': Icons.flash_on,
      'World': Icons.public,
      'Business': Icons.attach_money,
      'Technology': Icons.computer,
      'Entertainment': Icons.movie,
      'Sports': Icons.sports_soccer,
      'Science': Icons.science,
      'Health': Icons.health_and_safety,
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Newsstand'),
        actions: [
          IconButton(onPressed: () {Navigator.pushNamed(context, '/cart'); }, icon: const Icon(Icons.add_shopping_cart)),
        ],
        backgroundColor: Colors.pink,
        foregroundColor: Colors.grey,
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [

          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                const Expanded(
                  child: Text('Newsstand',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('< Back'),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: news.length,
              itemBuilder: (context, index) {
                final title = news[index];
                final description = descriptions[title] ?? 'No description available';
                final icon = icons[title] ?? Icons.article;

                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.pink[50],
                        child: Icon(icon, size: 30, color: Colors.pink),
                      ),
                      const SizedBox(width: 15),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              description,
                              style: const TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                            const SizedBox(height: 5),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: TextButton(
                                onPressed: () {
                                },
                                child: const Text('Read More'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
