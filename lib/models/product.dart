class Product {
  // ==============================
  // PROPERTI PRODUCT
  // ==============================

  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String category;
  int stock;
  final String? description;

  // ==============================
  // CONSTRUCTOR
  // ==============================

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.stock,
    this.description,
  });

  // ==============================
  // TUGAS MANDIRI NO. 1
  // METHOD STATUS STOK
  // ==============================

  String getStatusStok() {
    if (stock <= 0) {
      return 'Habis';
    } else if (stock < 5) {
      return 'Stok Terbatas';
    } else {
      return 'Tersedia';
    }
  }

  // ==============================
  // MENAMPILKAN INFORMASI PRODUCT
  // ==============================

  void displayInfo() {
    print('----------------------------------------');
    print('ID          : $id');
    print('Nama        : $name');
    print('Harga       : Rp ${price.toStringAsFixed(0)}');
    print('Kategori    : $category');
    print('Stok        : $stock');
    print('Status      : ${getStatusStok()}');
    print('Gambar      : $imageUrl');
    print('Deskripsi   : ${description ?? "Tidak ada deskripsi"}');
    print('----------------------------------------');
  }
}


// ==================================================
// CLASS DISCOUNTED PRODUCT
// ==================================================

class DiscountedProduct extends Product {
  final double discountPercent;

  DiscountedProduct({
    required super.id,
    required super.name,
    required super.price,
    required super.imageUrl,
    required super.category,
    required super.stock,
    super.description,
    required this.discountPercent,
  });

  // Menghitung harga setelah diskon
  double get finalPrice {
    return price - (price * discountPercent / 100);
  }

  @override
  void displayInfo() {
    print('----------------------------------------');
    print('ID          : $id');
    print('Nama        : $name');
    print('Harga Awal  : Rp ${price.toStringAsFixed(0)}');
    print('Diskon      : $discountPercent%');
    print('Harga Final : Rp ${finalPrice.toStringAsFixed(0)}');
    print('Kategori    : $category');
    print('Stok        : $stock');
    print('Status      : ${getStatusStok()}');
    print('Gambar      : $imageUrl');
    print('Deskripsi   : ${description ?? "Tidak ada deskripsi"}');
    print('----------------------------------------');
  }
}


// ==================================================
// TUGAS MANDIRI NO. 2
// LIST 8 PRODUK DUMMY
// ==================================================

final List<Product> dummyProducts = [
  Product(
    id: 'P001',
    name: 'Laptop ASUS',
    price: 8500000,
    imageUrl: 'https://example.com/laptop.jpg',
    category: 'Elektronik',
    stock: 10,
    description: 'Laptop untuk kebutuhan kuliah dan pekerjaan.',
  ),

  Product(
    id: 'P002',
    name: 'Smartphone Samsung',
    price: 5000000,
    imageUrl: 'https://example.com/smartphone.jpg',
    category: 'Elektronik',
    stock: 3,
    description: 'Smartphone Android dengan fitur lengkap.',
  ),

  Product(
    id: 'P003',
    name: 'Mouse Wireless',
    price: 150000,
    imageUrl: 'https://example.com/mouse.jpg',
    category: 'Elektronik',
    stock: 20,
    description: 'Mouse wireless untuk komputer dan laptop.',
  ),

  Product(
    id: 'P004',
    name: 'Keyboard Mechanical',
    price: 450000,
    imageUrl: 'https://example.com/keyboard.jpg',
    category: 'Elektronik',
    stock: 4,
    description: 'Keyboard mechanical untuk mengetik dan gaming.',
  ),

  Product(
    id: 'P005',
    name: 'Kaos Polos',
    price: 100000,
    imageUrl: 'https://example.com/kaos.jpg',
    category: 'Fashion',
    stock: 15,
    description: 'Kaos polos berbahan cotton.',
  ),

  Product(
    id: 'P006',
    name: 'Celana Jeans',
    price: 300000,
    imageUrl: 'https://example.com/jeans.jpg',
    category: 'Fashion',
    stock: 0,
    description: 'Celana jeans dengan model casual.',
  ),

  Product(
    id: 'P007',
    name: 'Roti Tawar',
    price: 20000,
    imageUrl: 'https://example.com/roti.jpg',
    category: 'Makanan',
    stock: 8,
    description: 'Roti tawar untuk sarapan.',
  ),

  Product(
    id: 'P008',
    name: 'Kopi Arabica',
    price: 75000,
    imageUrl: 'https://example.com/kopi.jpg',
    category: 'Makanan',
    stock: 6,
    description: 'Kopi Arabica dengan aroma khas.',
  ),
];


// ==================================================
// TUGAS MANDIRI NO. 3
// FUNCTION TOTAL BELANJA
// ==================================================

double hitungTotalBelanja(List<Product> keranjang) {
  double total = 0;

  for (Product product in keranjang) {
    total += product.price;
  }

  return total;
}