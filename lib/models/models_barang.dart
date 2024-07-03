class Barang {
  int? id;
  String namaBarang;
  int kategoriId;
  int stok;
  String kelompokBarang;
  int harga;

  Barang({
    this.id,
    required this.namaBarang,
    required this.kategoriId,
    required this.stok,
    required this.kelompokBarang,
    required this.harga,
  });

  factory Barang.fromJson(Map<String, dynamic> json) => Barang(
    id: json['id'],
    namaBarang: json['namaBarang'],
    kategoriId: json['kategoriId'],
    stok: json['stok'],
    kelompokBarang: json['kelompokBarang'],
    harga: json['harga'],
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'nama_barang': namaBarang,
    'kategori_id': kategoriId,
    'stok': stok,
    'kelompok_barang': kelompokBarang,
    'harga': harga,
  };
}
