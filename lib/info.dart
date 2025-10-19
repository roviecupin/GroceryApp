import 'package:flutter/material.dart';
import 'package:my_grocery_app/app_drawer.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Who we are'),
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
                  child: Text('Who we are', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [              
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://cdn.apartmenttherapy.info/image/upload/f_auto,q_auto:eco,c_fill,g_auto,w_1500,ar_3:2/stock%2Fshutterstock_373602469',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Welcome to My Grocery!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.pink),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Your one-stop grocery shopping app. Browse fresh products, enjoy exclusive deals, and get your essentials delivered right to your door. We’re happy to have you here! ',
                    style: TextStyle(fontSize: 15, height: 1.5),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
