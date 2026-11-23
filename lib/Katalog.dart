import 'package:flutter/material.dart';

class Katalog extends StatefulWidget {
  const Katalog({super.key});

  @override
  State<Katalog> createState() => _KatalogState();
}

class _KatalogState extends State<Katalog> {
  bool tampilGrid = false;

  Set<String> favoritProduk = {};

  final List<Map<String, dynamic>> produk = [
    {
      'nama': 'Floral Midi Dress',
      'harga': 299000,
      'kategori': 'Dress',
      'deskripsi': 'Dress floral feminin dengan desain manis dan elegan.',
      'gambar':
          'https://images.unsplash.com/photo-1496747611176-843222e1e57c?auto=format&fit=crop&w=600&q=80',
    },
    {
      'nama': 'Pleated Mini Skirt',
      'harga': 189000,
      'kategori': 'Skirt',
      'deskripsi': 'Mini skirt dengan model pleated yang cocok untuk outfit girly.',
      'gambar':
          'https://images.unsplash.com/photo-1583496661160-fb5886a0aaaa?auto=format&fit=crop&w=600&q=80',
    },
    {
      'nama': 'Ribbon Blouse',
      'harga': 219000,
      'kategori': 'Blouse',
      'deskripsi': 'Blouse cantik dengan detail pita untuk tampilan feminin.',
      'gambar':
          'https://images.unsplash.com/photo-1483985988355-763728e1935b?auto=format&fit=crop&w=600&q=80',
    },
    {
      'nama': 'Soft Knit Cardigan',
      'harga': 259000,
      'kategori': 'Cardigan',
      'deskripsi': 'Cardigan lembut yang nyaman dipakai sehari-hari.',
      'gambar':
          'https://images.unsplash.com/photo-1434389677669-e08b4cac3105?auto=format&fit=crop&w=600&q=80',
    },
    {
      'nama': 'Coquette Top',
      'harga': 199000,
      'kategori': 'Top',
      'deskripsi': 'Atasan dengan gaya coquette yang manis dan fashionable.',
      'gambar':
          'https://images.unsplash.com/photo-1566206091558-7f218b696731?auto=format&fit=crop&w=600&q=80',
    },
    {
      'nama': 'Elegant Long Dress',
      'harga': 349000,
      'kategori': 'Dress',
      'deskripsi': 'Long dress elegan untuk acara spesial maupun hangout.',
      'gambar':
          'https://images.unsplash.com/photo-1539008835657-9e8e9680c956?auto=format&fit=crop&w=600&q=80',
    },
    {
      'nama': 'Lace Mini Dress',
      'harga': 279000,
      'kategori': 'Dress',
      'deskripsi': 'Mini dress dengan sentuhan lace yang feminin.',
      'gambar':
          'https://images.unsplash.com/photo-1595777457583-95e059d581b8?auto=format&fit=crop&w=600&q=80',
    },
    {
      'nama': 'Casual Pink Top',
      'harga': 179000,
      'kategori': 'Top',
      'deskripsi': 'Atasan casual berwarna pink untuk daily outfit.',
      'gambar':
          'https://images.unsplash.com/photo-1503342217505-b0a15ec3261c?auto=format&fit=crop&w=600&q=80',
    },
  ];

  String formatHarga(int harga) {
    return 'Rp ${harga.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    )}';
  }

  void toggleFavorit(String nama) {
    setState(() {
      if (favoritProduk.contains(nama)) {
        favoritProduk.remove(nama);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Produk dihapus dari favorit'),
          ),
        );
      } else {
        favoritProduk.add(nama);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Produk ditambahkan ke favorit ❤️'),
          ),
        );
      }
    });
  }

  Widget gambarProduk(String url) {
    return Image.network(
      url,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }

        return const Center(
          child: CircularProgressIndicator(
            color: Color(0xFFEFAFC8),
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: const Color(0xFFFCE4EC),
          child: const Center(
            child: Icon(
              Icons.checkroom,
              size: 60,
              color: Color(0xFFEFAFC8),
            ),
          ),
        );
      },
    );
  }

  Widget cardList(Map<String, dynamic> item) {
    bool favorit = favoritProduk.contains(item['nama']);

    return Card(
      color: Colors.white,
      elevation: 2,
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () {
          bukaDetail(item);
        },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(18),
                bottomLeft: Radius.circular(18),
              ),
              child: SizedBox(
                width: 130,
                height: 150,
                child: gambarProduk(item['gambar']),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['kategori'],
                      style: const TextStyle(
                        color: Color(0xFFD88EAD),
                        fontSize: 12,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      item['nama'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF8D526B),
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      formatHarga(item['harga']),
                      style: const TextStyle(
                        color: Color(0xFFE38EAF),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 16,
                        ),
                        Text(' 4.8'),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            IconButton(
              onPressed: () {
                toggleFavorit(item['nama']);
              },
              icon: Icon(
                favorit ? Icons.favorite : Icons.favorite_border,
                color: favorit
                    ? Colors.pink
                    : const Color(0xFFEFAFC8),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardGrid(Map<String, dynamic> item) {
    bool favorit = favoritProduk.contains(item['nama']);

    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          bukaDetail(item);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: gambarProduk(item['gambar']),
                  ),

                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(
                          favorit
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: favorit
                              ? Colors.pink
                              : const Color(0xFFEFAFC8),
                        ),
                        onPressed: () {
                          toggleFavorit(item['nama']);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['kategori'],
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFFD88EAD),
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    item['nama'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8D526B),
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    formatHarga(item['harga']),
                    style: const TextStyle(
                      color: Color(0xFFE38EAF),
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  const Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 15,
                        color: Colors.amber,
                      ),
                      Text(
                        ' 4.8',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void bukaDetail(Map<String, dynamic> item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailProduk(
          produk: item,
          favorit: favoritProduk.contains(item['nama']),
          onFavorit: () {
            toggleFavorit(item['nama']);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8FB),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF8D7E5),
        foregroundColor: const Color(0xFF8D526B),
        centerTitle: true,
        title: const Text(
          'Fashion Collection',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Total favorit: ${favoritProduk.length} produk',
                  ),
                ),
              );
            },
          ),
        ],
      ),

      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFFFCE4EC),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '♡ THIS IS APRIL STYLE ♡',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF8D526B),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Find your pretty and feminine outfit!',
                  style: TextStyle(
                    color: Color(0xFFAD718D),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: Icon(
                  tampilGrid
                      ? Icons.list
                      : Icons.grid_view,
                ),
                label: Text(
                  tampilGrid
                      ? 'Tampilkan ListView'
                      : 'Tampilkan GridView',
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEFAFC8),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 13,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    tampilGrid = !tampilGrid;
                  });
                },
              ),
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: tampilGrid
                ? LayoutBuilder(
                    builder: (context, constraints) {
                      int jumlahKolom =
                          constraints.maxWidth >= 600 ? 3 : 2;

                      return GridView.builder(
                        padding: const EdgeInsets.all(12),
                        itemCount: produk.length,
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: jumlahKolom,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.65,
                        ),
                        itemBuilder: (context, index) {
                          return cardGrid(produk[index]);
                        },
                      );
                    },
                  )
                : ListView.builder(
                    padding: const EdgeInsets.only(bottom: 10),
                    itemCount: produk.length,
                    itemBuilder: (context, index) {
                      return cardList(produk[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

// ================= DETAIL PRODUK =================

class DetailProduk extends StatelessWidget {
  final Map<String, dynamic> produk;
  final bool favorit;
  final VoidCallback onFavorit;

  const DetailProduk({
    super.key,
    required this.produk,
    required this.favorit,
    required this.onFavorit,
  });

  String formatHarga(int harga) {
    return 'Rp ${harga.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    )}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8FB),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF8D7E5),
        foregroundColor: const Color(0xFF8D526B),
        title: const Text('Detail Produk'),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 350,
              width: double.infinity,
              child: Image.network(
                produk['gambar'],
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: const Color(0xFFFCE4EC),
                    child: const Icon(
                      Icons.checkroom,
                      size: 100,
                      color: Color(0xFFEFAFC8),
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    produk['kategori'],
                    style: const TextStyle(
                      color: Color(0xFFD88EAD),
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    produk['nama'],
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8D526B),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    formatHarga(produk['harga']),
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFE38EAF),
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Text(' 4.8 | Fashion Collection'),
                    ],
                  ),

                  const SizedBox(height: 25),

                  const Text(
                    'Deskripsi Produk',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8D526B),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    produk['deskripsi'],
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 25),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: Icon(
                        favorit
                            ? Icons.favorite
                            : Icons.favorite_border,
                      ),
                      label: Text(
                        favorit
                            ? 'Hapus dari Favorit'
                            : 'Tambah ke Favorit',
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFEFAFC8),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(15),
                      ),
                      onPressed: onFavorit,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}