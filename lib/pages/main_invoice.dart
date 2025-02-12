import 'package:flutter/material.dart';

class HomeDashboardScreen extends StatefulWidget {
  const HomeDashboardScreen({Key? key}) : super(key: key);

  @override
  State<HomeDashboardScreen> createState() => _HomeDashboardScreenState();
}

class _HomeDashboardScreenState extends State<HomeDashboardScreen> {
  final Color mainTeal = const Color(0xFF136760);

  // A few sample invoice data
  final List<Map<String, String>> _newInvoices = [
    {
      'invoice': 'Invoice #1234',
      'amount': '-200 SR',
      'date': '10/1/2025',
    },
    {
      'invoice': 'Invoice #3650',
      'amount': '-98 SR',
      'date': '6/1/2025',
    },
  ];

  // For demonstration, we’ll just store daily values to simulate the bar chart
  final List<Map<String, dynamic>> _summaryData = [
    {'day': 'Dec27', 'value': 70.0},
    {'day': 'Dec28', 'value': 120.0},
    {'day': 'Dec29', 'value': 90.0},
    {'day': 'Dec30', 'value': 60.0},
    {'day': 'Dec31', 'value': 150.0},
  ];

  // For bottom navigation
  int _currentIndex = 1; // 1 = home selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Custom AppBar with leading/trailing icons
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            // Handle drawer or menu
          },
        ),
        centerTitle: false,
        title: const Text('',
            style: TextStyle(color: Colors.black)), // blank or project name
        actions: [
          IconButton(
            onPressed: () {
              // Notification action
            },
            icon: Icon(Icons.notifications_none, color: Colors.grey.shade800),
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ---- SEARCH BAR ----
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Hinted search text',
                    prefixIcon:
                        const Icon(Icons.search, color: Colors.grey, size: 24),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                  ),
                ),
              ),

              // ---- CATEGORIES ----
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () {
                      // Show more categories action
                    },
                    child: const Text(
                      'more Categories',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Category chips
              Row(
                children: [
                  _buildCategoryChip('New', Colors.teal.shade100),
                  _buildCategoryChip('All', Colors.grey.shade200),
                  _buildCategoryChip('Month', Colors.grey.shade200),
                  _buildCategoryChip('Year', Colors.grey.shade200),
                ],
              ),
              const SizedBox(height: 24),

              // ---- NEW INVOICES ----
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'New Invoices',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      // See all invoices
                    },
                    child: const Text(
                      'See All',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Invoice cards
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _newInvoices.map((invoice) {
                    return Container(
                      width: 160,
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.all(12),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            invoice['invoice']!,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text(invoice['amount']!,
                              style: const TextStyle(color: Colors.grey)),
                          const SizedBox(height: 4),
                          Text(invoice['date']!,
                              style: const TextStyle(color: Colors.grey)),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 24),

              // ---- SUMMARY (CHART) ----
              const Text(
                'Summary',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _summaryData.map((data) {
                    final day = data['day'];
                    final value = data['value'] as double;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // The bar
                        Container(
                          width: 10,
                          height: value, // dynamic based on data
                          decoration: BoxDecoration(
                            color: (value > 100)
                                ? Colors.teal.shade900
                                : Colors.teal.shade400,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Label under the bar
                        Text(day!,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade700,
                            )),
                      ],
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),

      // ---- BOTTOM NAVIGATION BAR ----
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          // Implement logic to navigate or switch pages if needed
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

  /// A helper method to build category chips or containers.
  Widget _buildCategoryChip(String label, Color bgColor) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 14, color: Colors.black),
      ),
    );
  }
}
