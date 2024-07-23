import 'package:flutter_esc_pos_utils/flutter_esc_pos_utils.dart';

Future<List<int>> generateReceipt(
    PaperSize paper, CapabilityProfile profile) async {
  final Generator generator = Generator(paper, profile);
  List<int> bytes = [];

  // Sample receipt content
  bytes += generator.text('Makdan Store',
      styles: PosStyles(align: PosAlign.center, bold: true));
  bytes += generator.text('Lagos VI Estate',
      styles: PosStyles(align: PosAlign.center));
  bytes += generator.text('Lekki, Nigeria',
      styles: PosStyles(align: PosAlign.center));
  bytes += generator.text('Tel: +234 81 456 7890',
      styles: PosStyles(align: PosAlign.center));
  bytes += generator.hr();

  bytes += generator.text('Receipt',
      styles: PosStyles(align: PosAlign.center, bold: true, underline: true));

  bytes += generator.text('Product 1');
  bytes +=
      generator.text('NGN 10.00', styles: PosStyles(align: PosAlign.right));

  bytes += generator.text('Product 2');
  bytes +=
      generator.text('NGN 15.00', styles: PosStyles(align: PosAlign.right));

  bytes += generator.hr();

  bytes += generator.text('Total');
  bytes += generator.text('NGN 25.00',
      styles: PosStyles(align: PosAlign.right, bold: true));

  bytes += generator.hr();
  bytes += generator.feed(2);
  bytes += generator.cut();

  return bytes;
}
