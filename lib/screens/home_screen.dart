import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Medicine & Healthcare Products'),
        actions: [IconButton(icon: const Icon(Icons.notifications), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Top Categories', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _categoryCircle('Dental', Colors.pink[100]!),
                  _categoryCircle('Wellness', Colors.green[100]!),
                  _categoryCircle('Homeo', Colors.blue[100]!),
                  _categoryCircle('Eye Care', Colors.orange[100]!),
                  // Add more
                ],
              ),
            ),
            Container(
              height: 150,
              color: Colors.blue[100],
              child: const Center(child: Text('Every Save on... Banner')), // Replace with image
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Deals of the Day', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              children: [
                _productCard('Accu-Chek Active', 'Rs.112', context),
                _productCard('Accu-Chek Active', 'Rs.112', context),
                // Add more, tap navigates to /product_detail
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _categoryCircle(String label, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CircleAvatar(radius: 30, backgroundColor: color, child: const Icon(Icons.local_hospital, color: Colors.white)),
          const SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }

  Widget _productCard(String name, String price, BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, '/product_detail'),
        child: Column(
          children: [
            const Placeholder(fallbackHeight: 100), // Product image
            Text(name),
            Text(price, style: const TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}