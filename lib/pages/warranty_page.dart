import 'package:flutter/material.dart';

class WarrantyPage extends StatelessWidget {
  const WarrantyPage({Key? key}) : super(key: key);

  // We’ll use the same teal (#56948F) you have in other screens
  final Color headerTeal = const Color(0xFF56948F);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // -- TOP APP BAR --
      appBar: AppBar(
        backgroundColor: headerTeal,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // or drawer
          },
        ),
        centerTitle: true,
        title: const Text(
          'Invoice number 1973',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.grey.shade100,

      // -- BODY CONTENT --
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // White card
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
                    // -- TOP ROW: Icon + "Warranted by Jarir" logos --
                    Row(
                      children: [
                        // Left: shield icon (placeholder)
                        Image.asset(
                          'assets/shield_icon.png', // replace with your icon path
                          width: 40,
                          height: 40,
                        ),
                        const SizedBox(width: 8),

                        // "Warranted by Jarir:" + Jarir bookstore logo
                        Expanded(
                          child: Row(
                            children: [
                              const Text(
                                'Warranted by Jarir:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 8),
                              // Right: Jarir logo (placeholder)
                              Image.asset(
                                'assets/jarir_logo.png', // replace with your logo path
                                height: 32,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // -- MODEL + SERIAL NUMBER --
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Model:     25-MNBX2AH/A',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          'Serial Number:   358387106512560',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),
                    const Divider(),
                    const SizedBox(height: 16),

                    // -- WARRANTY PERIOD --
                    // For example, we create two columns for Months + Years
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Period by:',
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    const SizedBox(height: 8),

                    // Table-like layout for months & years
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _PeriodColumn(
                          label: 'Months',
                          value: '12',
                        ),
                        _PeriodColumn(
                          label: 'Years',
                          value: '1',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // -- FLOATING ACTION BUTTON (the "N" bubble) --
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle FAB action
        },
        backgroundColor: headerTeal,
        child: const Text(
          'N',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// A small widget for a column: label & value
class _PeriodColumn extends StatelessWidget {
  final String label;
  final String value;

  const _PeriodColumn({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // White background with teal outline
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.teal.shade50, // or Colors.teal.shade100
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
