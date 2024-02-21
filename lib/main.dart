// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NFC Reader App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NFCReaderScreen(),
    );
  }
}

class NFCReaderScreen extends StatefulWidget {
  @override
  _NFCReaderScreenState createState() => _NFCReaderScreenState();
}

class _NFCReaderScreenState extends State<NFCReaderScreen> {
  @override
  void initState() {
    super.initState();
    _startNFCReading();
  }

  Future<void> _startNFCReading() async {
    try {
      await FlutterNfcKit.poll();
      FlutterNfcKit.finish(); {
        // ignore: avoid_print
        print('Leitura NFC finalizada');
      }
    } on Exception catch (e) {
        // ignore: avoid_print
      print('Erro ao iniciar a leitura NFC: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NFC Reader'),
      ),
      body: Center(
        child: Text(
          'Aguardando leitura NFC...',
          style: TextStyle(fontSize: 20),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _startNFCReading,
        child: Icon(Icons.nfc),
      ),
    );
  }
}
