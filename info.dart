import 'package:flutter/material.dart';
import 'app_drawer.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Shop'),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.add_shopping_cart)),
      ],),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 20,
                ),
                Expanded(child: Text('Info')),
                TextButton(
                  onPressed: () {
                  Navigator.pop(context);
                  }, 
                child: Text('<Back>'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}