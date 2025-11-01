import 'package:flutter/material.dart';
import 'package:quick_medical/data/products_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Medicine & Healthcare Products'),
        actions: [
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {})
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Top Categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            // 🔹 Category Row
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _categoryCircle('Dental', Colors.pink[100]!),
                  _categoryCircle('Wellness', Colors.green[100]!),
                  _categoryCircle('Homeo', Colors.blue[100]!),
                  _categoryCircle('Eye Care', Colors.orange[100]!),
                ],
              ),
            ),

            // 🔹 Banner section
            Container(
              height: 150,
              color: Colors.blue[100],
              child: const Center(child: Text('Every Save on... Banner')),
            ),

            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Deals of the Day',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            // ✅ Product grid using Wrap instead of GridView
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: products.map((product) {
                  final tileWidth =
                      MediaQuery.of(context).size.width / 2 - 16; // 2 per row
                  return SizedBox(
                    width: tileWidth,
                    child: _productCard(
                      product.name,
                      product.price,
                      product.imageUrl,
                      context,
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Category Circle Widget
  Widget _categoryCircle(String label, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: const Icon(Icons.local_hospital, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }

  // 🔹 Product Card Widget
  Widget _productCard(String name, String price, String imageUrl, BuildContext context) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    elevation: 2,
    child: InkWell(
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min, // 👈 important
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              color: Colors.grey[200],
            ),
            child: Image.network(imageUrl, fit: BoxFit.contain),
          ),
          const SizedBox(height: 8),
          Text(name, textAlign: TextAlign.center, style: const TextStyle(fontSize: 13)),
          Text(price, style: const TextStyle(color: Colors.red)),
          const SizedBox(height: 8),
        ],
      ),
    ),
  );
}
}