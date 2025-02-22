import 'package:bayan/pages/invoice_details.dart';
import 'package:flutter/material.dart';
import 'invoice_details.dart'; // <-- Adjust this import path as needed

class AllInvoicesScreen extends StatefulWidget {
  const AllInvoicesScreen({Key? key}) : super(key: key);

  @override
  State<AllInvoicesScreen> createState() => _AllInvoicesScreenState();
}

class _AllInvoicesScreenState extends State<AllInvoicesScreen> {
  final Color mainTeal = const Color(0xFF136760);

  int _currentIndex = 0; // For bottom navigation

  // Sample data for demonstration
  final List<Map<String, String>> _invoices = [
    {
      'invoiceNo': 'Invoice number 1234',
      'store': 'Alothaim',
      'total': 'Total 200 SR',
      'date': '10/01/2025',
    },
    {
      'invoiceNo': 'Invoice number 3650',
      'store': 'Cafe',
      'total': 'Total 98 SR',
      'date': '06/01/2025',
    },
    {
      'invoiceNo': 'Invoice number 3477',
      'store': 'Shein',
      'total': 'Total 970 SR',
      'date': '01/12/2024',
    },
    {
      'invoiceNo': 'Invoice number 1770',
      'store': 'Bath&body',
      'total': 'Total 321 SR',
      'date': '01/12/2024',
    },
    {
      'invoiceNo': 'Invoice number 1937',
      'store': 'Jarir',
      'total': 'Total 1500 SR',
      'date': '28/11/2024',
    },
  ];

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
          'All Invoices',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              // handle menu
            },
            icon: const Icon(Icons.menu, color: Colors.black),
          ),
        ],
      ),

      backgroundColor: Colors.grey.shade100,

      // -- BODY: List of invoices --
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: _invoices.length,
        itemBuilder: (context, index) {
          final invoice = _invoices[index];
          return GestureDetector(
            onTap: () {
              // Navigate to InvoiceDetailsScreen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InvoiceDetailsScreen(),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
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
                  // Row 1: invoice number + share button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        invoice['invoiceNo'] ?? '',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF56948F), // a teal
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
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
                  const SizedBox(height: 4),

                  // Row 2: store + total
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        invoice['store'] ?? '',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      Text(
                        invoice['total'] ?? '',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),

                  // Row 3: Details + date
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Details',
                          style: TextStyle(color: Colors.grey)),
                      Text(
                        invoice['date'] ?? '',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),

      // -- BOTTOM NAV BAR --
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() => _currentIndex = value);
          // Optionally handle navigation here
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
}
