class Product {
  final String name;
  final String price;
  final String imageUrl;

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
  });
}

// ✅ Make sure this list is OUTSIDE any class
final List<Product> products = [
  Product(
    name: 'Accu-Chek Active',
    price: 'Rs. 112',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtK-Z-KR902G3cF2GlElzC2PbnFfbuGsRcyA&s',
  ),
  Product(
    name: 'Panadol Extra',
    price: 'Rs. 35',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxvJis54-z5ZokXEXvtQ4mHln4mcB3oOoYIw&s',
  ),
  Product(
    name: 'Sensodyne Toothpaste',
    price: 'Rs. 250',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTG2wWZT9CaTEHvWKW3UXn9GuoIrhmE5LzLkw&s',
  ),
  Product(
    name: 'Vitamin C Tablets',
    price: 'Rs. 180',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZJZ3Wx8Gj_wMLcyeUtPw-Ed4dX_OPZ9p2nw&s',
  )
];
