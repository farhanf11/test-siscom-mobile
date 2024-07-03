import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobile_test_siscom/db/controller.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class TambahBarangScreen extends StatefulWidget {
  @override
  _TambahBarangScreenState createState() => _TambahBarangScreenState();
}

class _TambahBarangScreenState extends State<TambahBarangScreen> {
    final _formKey = GlobalKey<FormState>();
  var namaBarang = '';
  var kategoriId = 0;
  var kelompokBarang = '';
  var stok = 0;
  var harga = 0;

    final BarangConrtoller _barangController = Get.put(BarangConrtoller());
    final TextEditingController namaBarangController = TextEditingController();
    final TextEditingController kategoriIdController = TextEditingController();
    final TextEditingController stokController = TextEditingController();
    final TextEditingController kelompokBarangController = TextEditingController();
    final TextEditingController hargaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Barang'),
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(color: Colors.black),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: namaBarangController,
                decoration: const InputDecoration(labelText: 'Nama Barang', border: OutlineInputBorder()),
                onSaved: (value) => namaBarang = value ?? '',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukan Nama Barang';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 14,),
              TextFormField(
                controller: kategoriIdController,
                decoration: const InputDecoration(
                    labelText: 'Kategori Barang', border: OutlineInputBorder()),
                onSaved: (value) => kategoriId = (value ?? '') as int,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukan Kategori Barang';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 14,),
              TextFormField(
                controller: kelompokBarangController,
                decoration: const InputDecoration(labelText: 'Kelompok Barang', border: OutlineInputBorder()),
                onSaved: (value) => kelompokBarang = value ?? '',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukan Kelompok Barang';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 14,),
              TextFormField(
                controller: stokController,
                decoration: const InputDecoration(labelText: 'Stok', border: OutlineInputBorder()),
                onSaved: (value) => stok = int.tryParse(value ?? '0') ?? 0,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukan Stok';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 14,),
              TextFormField(
                controller: hargaController,
                decoration: const InputDecoration(labelText: 'Harga', border: OutlineInputBorder()),
                onSaved: (value) => harga = int.tryParse(value ?? '0') ?? 0,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukan Harga';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Color(0xff001767
                  )),
                ),
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    _barangController.addData();
                    Navigator.pop(context);
                  }
                },
                child: const Text('Tambah Barang'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
