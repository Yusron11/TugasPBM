import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Mahasiswa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final namaController = TextEditingController();
  final nimController = TextEditingController();
  String nama = '';
  String nim = '';

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    namaController.dispose();
    nimController.dispose();
    super.dispose();
  }

  void submitData() {
    // Get the values from the controllers.
    nama = namaController.text;
    nim = nimController.text;

    // Navigate to the next screen and pass the data.
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(nama: nama, nim: nim),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Mahasiswa'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: namaController,
              decoration: InputDecoration(
                hintText: 'Masukkan nama',
                labelText: 'Nama',
              ),
            ),
            TextField(
              controller: nimController,
              decoration: InputDecoration(
                hintText: 'Masukkan NIM',
                labelText: 'NIM',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: submitData,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String nama;
  final String nim;

  DetailScreen({required this.nama, required this.nim});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Mahasiswa'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Berikut data tentang anda:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Nama: $nama',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'NIM: $nim',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the previous screen and pass the data.
                Navigator.pop(context, {'nama': nama, 'nim': nim});
              },
              child: Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}
