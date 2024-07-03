import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mobile_test_siscom/db/database_helper.dart';
import 'package:mobile_test_siscom/models/models_barang.dart';
import 'package:get/get.dart';

class BarangConrtoller extends GetxController {
  var barang = List<Barang>.empty().obs;
  late TextEditingController addBarangConrtoller;
  @override
  void onInit() {
    addBarangConrtoller = TextEditingController();
    _getData();
    super.onInit();
  }

  void _getData() {
    DatabaseHelper.instance.queryAllRows().then((value) {
      value.forEach((element) {
        barang.add(Barang(
            id: element['id'],
            namaBarang: element['namaBarang'],
            kategoriId: element['kategoriId'],
            stok: element['stok'],
            kelompokBarang: element['kelompokBarang'],
            harga: element['harga']));
      });
    });
  }

  void addData() async {
    await DatabaseHelper.instance.insert(Barang(
        namaBarang: addBarangConrtoller.text,
        kategoriId: addBarangConrtoller.hashCode,
        stok: addBarangConrtoller.hashCode,
        kelompokBarang: addBarangConrtoller.text,
        harga: addBarangConrtoller.hashCode));
    barang.insert(
        0,
        Barang(
            id: 0,
            namaBarang: '',
            kategoriId: 0,
            stok: 0,
            kelompokBarang: '',
            harga: 0));
    addBarangConrtoller.clear();
  }

  void deleteTask(int id) async {
    await DatabaseHelper.instance.delete(id);
    barang.removeWhere((element) => element.id == id);
  }
}
