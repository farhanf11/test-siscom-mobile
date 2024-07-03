import 'package:flutter/material.dart';
import 'package:mobile_test_siscom/ListBarang.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ItemProvider(),
      child: MaterialApp(
        title: 'Stok Barang',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ListStokBarangScreen(),
      ),
    );
  }
}

class ItemProvider with ChangeNotifier {
  final List<Item> _items = List.generate(
    5,
        (index) => Item(name: 'Nama Barang', stock: 35, price: 100000),
  );
  List<Item> get items => _items;

  void addItem(Item item) {
    _items.add(item);
    notifyListeners();
  }

  void removeSelectedItems() {
    _items.removeWhere((item) => item.isSelected);
    notifyListeners();
  }

  void toggleSelectAll(bool selectAll) {
    for (var item in _items) {
      item.isSelected = selectAll;
    }
    notifyListeners();
  }
}

class Item {
  String name;
  int stock;
  int price;
  bool isSelected;

  Item({
    required this.name,
    required this.stock,
    required this.price,
    this.isSelected = false,
  });
}
