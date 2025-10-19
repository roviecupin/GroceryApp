import 'package:flutter/material.dart';
import 'package:grocery_app/app_drawer.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  children: [
                    Text('Products'),
                    Row(
                      children: [
                        ElevatedButton(onPressed: (){}, child: Text('Default')),
                        ElevatedButton(onPressed: (){}, child: Text('A - Z')),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index){
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            color: Colors.grey,
                            spreadRadius: 0.5,
                          )
                        ]

                      ),
                      child: ListTile(
                        title: Row(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(child: 
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Products'),
                                Text('\$ 0.00'),
                                Text('Vendor'),
                              ],
                            ),
                            ),
                            Column(
                              children: [
                                IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
                                IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                              ],
                            ),

                          ],
                        ),
                      ),
                    );
                  },
                ),
                ),
            ],
          ),  
      ),
    );
  }
}