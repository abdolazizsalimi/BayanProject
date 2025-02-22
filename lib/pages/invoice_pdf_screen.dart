import 'package:flutter/material.dart';

class InvoicePdfScreen extends StatelessWidget {
  const InvoicePdfScreen({Key? key}) : super(key: key);

  final Color headerTeal = const Color(0xFF56948F);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Top AppBar with teal background
      appBar: AppBar(
        backgroundColor: headerTeal,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'Invoice number 1973',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            // -- TOP SECTION: DATE/TIME & ARABIC INVOICE HEADER --
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left side: date/time
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Thursday 28 November 2024 |\n9:45 AM',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),

                // Right side: invoice info in Arabic
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      // For Arabic text, you can wrap in Directionality if needed
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(
                          '#1973 فاتورة بضائع  / تفاصيل\n01000019 فاتورة بيع',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // -- NEXT SECTION: ADDRESSES / CONTACT INFO --
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left column (Arabic labels)
                Expanded(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('مصدرة إلى : ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Text(
                          'مستقبلة :\nالسعودية\nالرياض',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),

                // Right column (English / store info)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        'Jarir - جرير\nالصناعية الثانية، 24242،\nحي شرق طريق الملك فهد،\nالرياض 12451، المملكة العربية السعودية',
                        textAlign: TextAlign.right,
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 6),
                      Text('Email@email.com',
                          style: TextStyle(color: Colors.grey)),
                      Text('info@jarirgroup.com',
                          style: TextStyle(color: Colors.grey)),
                      Text('+55****', style: TextStyle(color: Colors.grey)),
                      Text('92000089+', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),
            const Divider(),

            // -- PAYMENT DETAILS (Arabic + English) --
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'تفاصيل الدفع :',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'SAR 1304.35',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        'طريقة الدفع :',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(height: 4),
                      Text(
                        'مدى',
                        style: TextStyle(color: Colors.grey),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),
            const Divider(),

            // -- TABLE HEADER (e.g. product, quantity, price, total) --
            Container(
              color: Colors.grey.shade200,
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              child: Row(
                children: const [
                  Expanded(
                    flex: 2,
                    child: Text('المجموع', textAlign: TextAlign.center),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text('السعر', textAlign: TextAlign.center),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text('الكمية', textAlign: TextAlign.center),
                  ),
                  Expanded(
                    flex: 4,
                    child: Text('المنتج', textAlign: TextAlign.center),
                  ),
                ],
              ),
            ),

            // -- TABLE ROW (example item) --
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              child: Row(
                children: const [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'SAR 1500',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'SAR 1304.35',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text('1', textAlign: TextAlign.center),
                  ),
                  Expanded(
                    flex: 4,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        'Apple, Iphone 11 256GB Black\nأبل ايفون 256 جيجا أسود\nTerm#: 2MKNX7A\nDevice Serial #: 35873601262560\nWarranted By: JARIR, Period (months): 12',
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // -- INVOICE TOTALS --
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildTotalRow(
                  context,
                  label: 'المجموع الكلي :',
                  amount: 'SAR 1304.35',
                ),
                _buildTotalRow(
                  context,
                  label: 'الضريبة :',
                  amount: 'SAR 195.65',
                ),
                _buildTotalRow(
                  context,
                  label: 'مبلغ الفاتورة :',
                  amount: 'SAR 1500',
                ),
              ],
            ),

            const SizedBox(height: 16),
            const Divider(),

            // -- BARCODE (Placeholder) --
            // You can replace this with a real barcode widget or image
            Center(
              child: Column(
                children: [
                  // For a real barcode, consider a plugin like barcode_widget
                  // or just use an Image.asset if you have a generated barcode.
                  Container(
                    width: 200,
                    height: 50,
                    color: Colors.black12, // placeholder
                    child: const Center(
                      child: Text(
                        '|| 035456 6320 28 1 ||',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text('0 356456 6320 28 1',
                      style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // Helper widget for building a row with label + amount on the right
  Widget _buildTotalRow(BuildContext context,
      {required String label, required String amount}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            amount,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            label,
            style: const TextStyle(color: Colors.grey),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}
