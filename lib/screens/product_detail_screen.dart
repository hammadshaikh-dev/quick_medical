import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sugar Free Gold Low Calories')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/product.png', height: 200, width: double.infinity, fit: BoxFit.cover), // Add asset
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Rs.99 Rs.56', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ElevatedButton(onPressed: () {}, child: const Text('Add to cart')),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Etiam mollis'),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  _sizeButton('100 pellets', true),
                  _sizeButton('Rs.166', false),
                  _sizeButton('300 pellets Rs.252', false),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Product Detail', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Lorem ipsum dolor sit amet...'), // Full description
            ),
            // Add sections for Ingredients, Expiry, Brand, Ratings (use ListView for reviews)
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.amber),
                  Text('4.4'),
                  SizedBox(width: 10),
                  Text('923 Ratings and 257 Reviews'),
                ],
              ),
            ),
            // Review list...
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/cart'),
                style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
                child: const Text('GO TO CART'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sizeButton(String label, bool selected) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ChoiceChip(
        label: Text(label),
        selected: selected,
        onSelected: (bool value) {}, // Handle selection
      ),
    );
  }
}