import 'package:flutter/material.dart';

import 'product.dart';
import 'added_list.dart';
import 'added_products_page.dart';

class CataloguePage extends StatelessWidget {
  const CataloguePage({super.key});

  final List<Product> catalogue = const [
    Product("Téléphone", 1200),
    Product("Casque Bluetooth", 150),
    Product("Montre connectée", 300),
    Product("Chargeur USB", 40),
    Product("Clavier Sans Fil", 80),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalogue MiniShop"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            tooltip: "Produits ajoutés",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddedProductsPage(),
                ),
              );
            },
          ),
        ],
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: catalogue.length,
        itemBuilder: (context, index) {
          final p = catalogue[index];

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 7),
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.shopping_bag)),

              title: Text(
                p.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),

              subtitle: Text("${p.price} DT"),

              trailing: const Icon(
                Icons.add_shopping_cart,
                color: Color(0xFF800020),
              ),

              onTap: () {
                addedProducts.add(p);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Produit ajouté : ${p.name}"),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
