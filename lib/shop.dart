import 'package:flutter/material.dart';
import 'package:my_grocery_app/app_drawer.dart';
import 'package:provider/provider.dart';
import 'package:my_grocery_app/provider.dart';
import 'package:my_grocery_app/product.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  List<Product> products = List.generate(
    20,
    (index) => Product(
      id: '$index',
      name: 'Product $index',
      price: (index + 1) * 10.0,
      vendor: 'Vendor $index',
      imageUrl: 'https://www.craiyon.com/en/image/dFPuNMIdSYygKTrFmiQU1g',
    ),
  );


  final Set<String> favoriteProducts = {};

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Grocery'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.grey,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cart'); 
            },
            icon: const Icon(Icons.add_shopping_cart),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Column(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Products',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      ElevatedButton(onPressed: () {}, child: const Text('Default')),
                      const SizedBox(width: 10),
                      ElevatedButton(onPressed: () {}, child: const Text('A-Z')),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  final quantityInCart = cart.items[product.id]?.quantity ?? 0;
                  final isFavorite = favoriteProducts.contains(product.id);

                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 10,
                          color: Colors.grey,
                          spreadRadius: 0.5,
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Row(
                        children: [
                       
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[200],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                product.imageUrl,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Center(
                                    child: Icon(Icons.image_not_supported, color: Colors.grey),
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                                Text('\$ ${product.price.toStringAsFixed(2)}'),
                                Text(product.vendor),
                                if (quantityInCart > 0)
                                  Text(
                                    'In cart: $quantityInCart',
                                    style: const TextStyle(color: Colors.blue),
                                  ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                           
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (isFavorite) {
                                      favoriteProducts.remove(product.id);
                                    } else {
                                      favoriteProducts.add(product.id);
                                    }
                                  });
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  color: isFavorite ? Colors.red : Colors.grey,
                                ),
                              ),

                          
                              IconButton(
                                onPressed: () {
                                  cart.addItem(product);
                                },
                                icon: const Icon(Icons.add),
                              ),
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
