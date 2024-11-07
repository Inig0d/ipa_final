import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  test('Load HTML content from assets', () async {
    try {
      String fileContent = await rootBundle.loadString('mi_carnet_vip_canjear.html');
      expect(fileContent.isNotEmpty, true, reason: 'HTML content should not be empty');
      print("HTML content loaded successfully: $fileContent");
    } catch (e) {
      fail("Error loading HTML file: $e");
    }
  });
}
