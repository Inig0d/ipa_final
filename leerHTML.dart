import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_html/flutter_html.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _htmlContent = '';

  @override
  void initState() {
    super.initState();
    _loadHtmlFromAssets();
  }

  Future<void> _loadHtmlFromAssets() async {
    try {
      String fileContent = await rootBundle.loadString('assets/html/mi_carnet_vip_canjear.html');
      setState(() {
        _htmlContent = fileContent;
      });
      print(_htmlContent); // Imprimir para depuración
    } catch (e) {
      print("Error loading HTML file: $e");
      setState(() {
        _htmlContent = "Error loading HTML content.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Render HTML desde archivo'),
        ),
        body: SingleChildScrollView(
          child: _htmlContent.isNotEmpty
              ? Html(data: _htmlContent)
              : Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
