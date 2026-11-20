import 'package:flutter/material.dart';

import 'added_list.dart';

class AddedProductsPage extends StatefulWidget {
  const AddedProductsPage({super.key});

  @override
  State<AddedProductsPage> createState() => _AddedProductsPageState();
}

class _AddedProductsPageState extends State<AddedProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Produits ajoutés"), centerTitle: true),

      body: Column(
        children: [
          Expanded(
            child: addedProducts.isEmpty
                ? const Center(
                    child: Text(
                      "Aucun produit ajouté pour le moment",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: addedProducts.length,
                    itemBuilder: (context, index) {
                      final p = addedProducts[index];

                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        child: ListTile(
                          leading: const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                          title: Text(
                            p.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text("${p.price} DT"),
                        ),
                      );
                    },
                  ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.delete),
                label: const Text("Vider la liste"),
                onPressed: () {
                  setState(() {
                    addedProducts.clear();
                  });

                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text("Liste vidée")));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
