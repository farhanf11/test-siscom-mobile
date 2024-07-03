import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:mobile_test_siscom/detail_barang.dart';
import 'package:mobile_test_siscom/models/models_barang.dart';
import 'package:mobile_test_siscom/tambah_barang.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class ListStokBarangScreen extends StatefulWidget {
  @override
  _ListStokBarangScreenState createState() => _ListStokBarangScreenState();
}

class _ListStokBarangScreenState extends State<ListStokBarangScreen> {
  bool _editMode = false;
  bool _selectAll = false;

  @override
  Widget build(BuildContext context) {
    final items = Provider.of<ItemProvider>(context).items;

    return Scaffold(
      appBar: EasySearchBar(
        backgroundColor: Colors.white,
        title: const Text(
          'List Stok Barang',
          style: TextStyle(color: Colors.black),
        ),
        onSearch: (p0) => {},
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Menampilkan Data Barang'),
              TextButton(
                onPressed: () {
                  setState(() {
                    _editMode = !_editMode;
                    if (!_editMode) _selectAll = false;
                  });
                },
                child: const Text('Edit'),
              ),
            ],
          ),
          if (_editMode)
            CheckboxListTile(
              title: const Text('Pilih Semua'),
              value: _selectAll,
              onChanged: (bool? value) {
                setState(() {
                  _selectAll = value ?? false;
                  Provider.of<ItemProvider>(context, listen: false)
                      .toggleSelectAll(_selectAll);
                });
              },
            ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                    leading: _editMode
                        ? Checkbox(
                            value: items[index].isSelected,
                            onChanged: (bool? value) {
                              setState(() {
                                items[index].isSelected = value ?? false;
                              });
                            },
                          )
                        : null,
                    title: Text(items[index].name),
                    subtitle: Text('Stok: ${items[index].stock}'),
                    trailing: Text('Rp. ${items[index].price}'),
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return DetailBarangScreen(barang: Barang(namaBarang: items[index].name, kategoriId: 1, stok: items[index].stock, kelompokBarang: 'kelompokBarang', harga: items[index].price),);
                        },
                      );
                    });
              },
            ),
          ),
          if (_editMode)
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Color(0xff001767)),
                      ),
                      onPressed: () {
                        Provider.of<ItemProvider>(context, listen: false)
                            .removeSelectedItems();
                      },
                      child: const Text('Hapus Barang'),
                    ),
                  ],
                )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TambahBarangScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
