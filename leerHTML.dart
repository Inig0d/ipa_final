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

  // Cargar el archivo HTML desde assets
  Future<void> _loadHtmlFromAssets() async {
    String fileContent = await rootBundle.loadString('assets/html/Mi carnet VIP – ▷Canjear Carnet VIP de Kandhavia.html');
    setState(() {
      _htmlContent = fileContent;
    });
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
              ? Html(
                  data: _htmlContent,
                )
              : Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
