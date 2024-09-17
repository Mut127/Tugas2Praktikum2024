import '/ui/tampil_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FormData extends StatefulWidget {
  const FormData({Key? key}) : super(key: key);

  @override
  FormDataState createState() => FormDataState();
}

class FormDataState extends State<FormData> {
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _tahunController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input Data"),
        backgroundColor: Colors.purple, // Ubah warna AppBar menjadi ungu
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            _inputContainer(_textboxNama(), Icons.person),
            _inputContainer(_textboxNIM(), Icons.badge),
            _inputContainer(_textboxTahun(), Icons.cake),
            const SizedBox(
                height: 30), // Menambah jarak lebih besar sebelum tombol
            _tombolSimpan(),
          ],
        ),
      ),
    );
  }

  _inputContainer(Widget child, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      margin: const EdgeInsets.only(bottom: 20), // Menambah jarak antar input
      decoration: BoxDecoration(
        color: Colors.white, // Warna latar belakang kontainer
        borderRadius: BorderRadius.circular(
            15), // Border radius lebih besar untuk rounded corner
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3), // Warna bayangan lebih gelap
            spreadRadius: 2, // Penyebaran bayangan
            blurRadius: 8, // Kekaburan bayangan
            offset: const Offset(0, 4), // Offset bayangan
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.purple), // Menambahkan ikon di sisi kiri
          const SizedBox(width: 10), // Jarak antara ikon dan TextField
          Expanded(
              child: child), // Membuat TextField memenuhi ruang yang tersisa
        ],
      ),
    );
  }

  _textboxNama() {
    return TextField(
      decoration: InputDecoration(
        labelText: "Nama",
        labelStyle: const TextStyle(color: Colors.purple), // Warna label ungu
        focusedBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: Colors.purple), // Border fokus ungu
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: Colors.purple), // Border normal ungu
        ),
        border:
            InputBorder.none, // Menghilangkan border default di dalam container
      ),
      controller: _namaController,
    );
  }

  _textboxNIM() {
    return TextField(
      decoration: InputDecoration(
        labelText: "NIM",
        labelStyle: const TextStyle(color: Colors.purple),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.purple),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.purple),
        ),
        border: InputBorder.none, // Menghilangkan border default
      ),
      controller: _nimController,
    );
  }

  _textboxTahun() {
    return TextField(
      decoration: InputDecoration(
        labelText: "Tahun Lahir",
        labelStyle: const TextStyle(color: Colors.purple),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.purple),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.purple),
        ),
        border: InputBorder.none, // Menghilangkan border default
      ),
      controller: _tahunController,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        String nama = _namaController.text;
        String nim = _nimController.text;
        int tahun = int.parse(_tahunController.text);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => TampilData(nama: nama, nim: nim, tahun: tahun),
        ));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple, // Ubah warna tombol menjadi ungu
        foregroundColor: Colors.white, // Warna teks tombol putih
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Membuat tombol lebih bulat
        ),
        padding: const EdgeInsets.symmetric(
            horizontal: 40, vertical: 15), // Padding tombol lebih besar
        elevation: 5, // Menambahkan efek bayangan pada tombol
      ),
      child: const Text('Simpan', style: TextStyle(fontSize: 16)),
    );
  }
}
