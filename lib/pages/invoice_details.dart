import 'package:bayan/pages/invoice_pdf_screen.dart';
import 'package:bayan/pages/warranty_page.dart';
import 'package:flutter/material.dart';

// Example screen for Invoice Details
class InvoiceDetailsScreen extends StatefulWidget {
  const InvoiceDetailsScreen({Key? key}) : super(key: key);

  @override
  State<InvoiceDetailsScreen> createState() => _InvoiceDetailsScreenState();
}

class _InvoiceDetailsScreenState extends State<InvoiceDetailsScreen> {
  // Main teal used elsewhere
  final Color mainTeal = const Color(0xFF136760);
  // Lighter teal that matches your button outlines / text
  final Color outlineTeal = const Color(0xFF56948F);

  // For the bottom navigation bar
  int _currentIndex = 1; // e.g., if "Home" is index 1

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // -- APP BAR --
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Details',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Menu action
            },
            icon: const Icon(Icons.menu, color: Colors.black),
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade100,

      // -- BODY --
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            // Title row: "Invoice number 1973" + "Share" button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Invoice number 1973',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: outlineTeal, // teal shade
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                  onPressed: () {
                    // handle share
                  },
                  child: const Text(
                    'Share',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // White card containing invoice details
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 2),
                    blurRadius: 4,
                    color: Colors.black.withOpacity(0.1),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Row 1: invoice number on left, "Jarir" on right
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Invoice number 1973',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Jarir',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Row 2: Cart icon + items on left, date/total/payment on right
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left side (icon + item info)
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.shopping_cart, size: 40),
                            const SizedBox(height: 8),
                            const Text(
                              '1x Item\nIphone 11 black',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),

                      // Right side (Date, Total, Payment)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            '28/11/2024',
                            style: TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Total 1500 SR',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Mada Payment System',
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Divider(height: 1, color: Colors.grey),

                  // "See Invoice" + "See Warranty"
                  const SizedBox(height: 16),
                  _buildOutlinedButton(
                    label: 'See Invoice',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const InvoicePdfScreen(),
                        ),
                      );

                      // handle "See Invoice"
                    },
                  ),
                  const SizedBox(height: 12),
                  _buildOutlinedButton(
                    label: 'See Warranty',
                    onPressed: () {
                      // handle "See Warranty"
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WarrantyPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // -- BOTTOM NAV BAR --
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() => _currentIndex = value);
          // Handle navigation if desired
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline,
                color: _currentIndex == 0 ? mainTeal : Colors.grey),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
                color: _currentIndex == 1 ? mainTeal : Colors.grey),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined,
                color: _currentIndex == 2 ? mainTeal : Colors.grey),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  // Helper for building the "See Invoice" / "See Warranty" outline buttons
  Widget _buildOutlinedButton({
    required String label,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: outlineTeal, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(color: outlineTeal),
        ),
      ),
    );
  }
}
