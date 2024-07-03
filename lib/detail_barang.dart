import 'package:flutter/material.dart';
import 'package:mobile_test_siscom/models/models_barang.dart';
import 'package:mobile_test_siscom/tambah_barang.dart';

class DetailBarangScreen extends StatelessWidget {
  final Barang barang;

  const DetailBarangScreen({super.key, required this.barang});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            color: Colors.grey[300],
            child: const Icon(
              Icons.image,
              size: 100,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            barang.namaBarang,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text('Kategori:', style: TextStyle(fontSize: 14)),
              Text(barang.kategoriId.toString(), style: const TextStyle(fontSize: 14)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text('Kelompok:', style: TextStyle(fontSize: 14)),
              Text(barang.kelompokBarang, style: const TextStyle(fontSize: 14)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text('Stok:', style: TextStyle(fontSize: 14)),
              Text(barang.stok.toString(), style: const TextStyle(fontSize: 14)),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text('Harga:', style: TextStyle(fontSize: 14)),
              Text('Rp. ${barang.harga}', style: TextStyle(fontSize: 14)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  // Implement delete functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: const Text('Hapus Barang'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => TambahBarangScreen(), // Update to your edit screen
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text('Edit Barang'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
