import 'package:ngaji_kuy/models/product_entry.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final QuranEntry item;

  const ProductDetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name: ${item.fields.name}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text("Description: ${item.fields.description}"),
            const SizedBox(height: 8),
      
            Text("Price: ${item.fields.price}"),
            const Spacer(),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Back to Order List"),
            ),
          ],
        ),
      ),
    );
  }
}