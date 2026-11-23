import 'package:flutter/material.dart';

class Profil extends StatelessWidget {
  const Profil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8FB),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF8D7E5),
        foregroundColor: const Color(0xFF8D526B),
        title: const Text(
          'Profil',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // FOTO PROFIL
              Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: Color(0xFFEFAFC8),
                  shape: BoxShape.circle,
                ),
                child: const CircleAvatar(
                  radius: 65,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 75,
                    color: Color(0xFFEFAFC8),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Nabila Aurellia Kristyaningsih',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8D526B),
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Mahasiswa Informatika',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFFD88EAD),
                ),
              ),

              const SizedBox(height: 25),

              // KARTU INFORMASI
              Card(
                color: Colors.white,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      infoProfil(
                        Icons.badge,
                        'Nama',
                        'Nabila Aurellia Kristyaningsih',
                      ),

                      const Divider(),

                      infoProfil(
                        Icons.numbers,
                        'NPM',
                        '25670102',
                      ),

                      const Divider(),

                      infoProfil(
                        Icons.school,
                        'Program Studi',
                        'INFORMATIKA',
                      ),

                      const Divider(),

                      infoProfil(
                        Icons.account_balance,
                        'Universitas',
                        'UNIVERSITAS PGRI SEMARANG',
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // TOMBOL KEMBALI
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Kembali'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEFAFC8),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                '♡ Pink Boutique ♡',
                style: TextStyle(
                  color: Color(0xFFD88EAD),
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget infoProfil(
    IconData icon,
    String label,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: const Color(0xFFEFAFC8),
            size: 25,
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  value,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF8D526B),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}