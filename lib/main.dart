import 'models/product.dart';


// ==================================================
// FUNCTION CEK STATUS STOK
// ==================================================

String cekStatusStok(int stok) {
  if (stok <= 0) {
    return 'Habis';
  } else if (stok < 5) {
    return 'Stok Terbatas';
  } else {
    return 'Tersedia';
  }
}


// ==================================================
// FUNCTION DISKON KATEGORI
// ==================================================

double getDiskonKategori(String kategori) {
  switch (kategori) {
    case 'Elektronik':
      return 0.10;

    case 'Fashion':
      return 0.15;

    case 'Makanan':
      return 0.05;

    default:
      return 0.0;
  }
}


// ==================================================
// FUNCTION HITUNG HARGA SETELAH DISKON
// ==================================================

double hitungHargaSetelahDiskon({
  required double harga,
  double persenDiskon = 0.0,
}) {
  return harga - (harga * persenDiskon);
}


// ==================================================
// FUNCTION FORMAT RUPIAH
// ==================================================

String formatRupiah(double nominal) {
  return 'Rp ${nominal.toStringAsFixed(0)}';
}


// ==================================================
// MAIN PROGRAM
// ==================================================

void main() {

  print('========================================');
  print('       PRAKTIKUM DART - TOKOKITA');
  print('========================================');


  // ==================================================
  // 1. VARIABEL DAN TIPE DATA
  // ==================================================

  String namaProduk = 'Laptop ASUS';
  double hargaProduk = 8500000;
  int stokProduk = 10;
  bool produkAktif = true;

  print('\n=== VARIABEL & TIPE DATA ===');

  print('Nama Produk : $namaProduk');
  print('Harga       : ${formatRupiah(hargaProduk)}');
  print('Stok        : $stokProduk');
  print('Produk Aktif: $produkAktif');


  // ==================================================
  // 2. OPERATOR ARITMATIKA
  // ==================================================

  double diskon = 0.10;

  double hargaDiskon = hargaProduk * diskon;

  double hargaAkhir = hargaProduk - hargaDiskon;

  print('\n=== PERHITUNGAN OPERATOR ===');

  print('Harga Awal  : ${formatRupiah(hargaProduk)}');
  print('Diskon 10%  : ${formatRupiah(hargaDiskon)}');
  print('Harga Akhir : ${formatRupiah(hargaAkhir)}');


  // ==================================================
  // 3. IF-ELSE STATUS STOK
  // ==================================================

  print('\n=== STATUS STOK ===');

  print('Stok 0  : ${cekStatusStok(0)}');
  print('Stok 3  : ${cekStatusStok(3)}');
  print('Stok 10 : ${cekStatusStok(10)}');


  // ==================================================
  // 4. SWITCH DISKON KATEGORI
  // ==================================================

  print('\n=== DISKON KATEGORI ===');

  print(
    'Elektronik : ${getDiskonKategori('Elektronik') * 100}%',
  );

  print(
    'Fashion    : ${getDiskonKategori('Fashion') * 100}%',
  );

  print(
    'Makanan    : ${getDiskonKategori('Makanan') * 100}%',
  );


  // ==================================================
  // 5. FUNCTION HITUNG HARGA SETELAH DISKON
  // ==================================================

  double hasilDiskon = hitungHargaSetelahDiskon(
    harga: 5000000,
    persenDiskon: 0.15,
  );

  print('\n=== FUNCTION ===');

  print('Harga awal    : ${formatRupiah(5000000)}');
  print('Diskon        : 15%');
  print('Harga setelah : ${formatRupiah(hasilDiskon)}');


  // ==================================================
  // 6. CLASS PRODUCT
  // ==================================================

  print('\n=== CLASS PRODUCT ===');

  Product produk1 = Product(
    id: 'P001',
    name: 'Laptop ASUS',
    price: 8500000,
    imageUrl: 'https://example.com/laptop.jpg',
    category: 'Elektronik',
    stock: 10,
    description: 'Laptop untuk kebutuhan kuliah.',
  );

  produk1.displayInfo();

  print(
    'Status Stok Method: ${produk1.getStatusStok()}',
  );


  // ==================================================
  // 7. CLASS DISCOUNTED PRODUCT
  // ==================================================

  print('\n=== CLASS DISCOUNTED PRODUCT ===');

  DiscountedProduct produk2 = DiscountedProduct(
    id: 'P002',
    name: 'Smartphone Samsung',
    price: 5000000,
    imageUrl: 'https://example.com/smartphone.jpg',
    category: 'Elektronik',
    stock: 3,
    description: 'Smartphone Android.',
    discountPercent: 15,
  );

  produk2.displayInfo();


  // ==================================================
  // 8. TUGAS MANDIRI NO. 2
  // MENAMPILKAN 8 PRODUK DUMMY
  // ==================================================

  print('\n=== 8 PRODUK DUMMY ===');

  for (Product product in dummyProducts) {

    print(
      '${product.id} | '
      '${product.name} | '
      '${formatRupiah(product.price)} | '
      'Stok: ${product.stock} | '
      'Status: ${product.getStatusStok()}',
    );
  }


  // ==================================================
  // 9. TUGAS MANDIRI NO. 3
  // MENGHITUNG TOTAL BELANJA
  // ==================================================

  double totalBelanja =
      hitungTotalBelanja(dummyProducts);

  print('\n=== TOTAL BELANJA ===');

  print('Jumlah Produk : ${dummyProducts.length}');

  print(
    'Total Belanja : ${formatRupiah(totalBelanja)}',
  );


  // ==================================================
  // PROGRAM SELESAI
  // ==================================================

  print('\n========================================');
  print('          PROGRAM SELESAI');
  print('========================================');
}