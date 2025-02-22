import 'package:flutter/material.dart';

class MoreCategoriesScreen extends StatefulWidget {
  const MoreCategoriesScreen({Key? key}) : super(key: key);

  @override
  State<MoreCategoriesScreen> createState() => _MoreCategoriesScreenState();
}

class _MoreCategoriesScreenState extends State<MoreCategoriesScreen> {
  final Color mainTeal = const Color(0xFF136760);
  final Color grayButton = Colors.grey;
  // For bottom nav bar
  int _currentIndex = 1; // e.g., "Home" is index 1

  // Example data for the categories
  final List<Map<String, dynamic>> _categories = [
    {
      'name': 'Devices',
      'count': 1,
      'buttonColor': const Color(0xFF56948F), // teal
    },
    {
      'name': 'Services',
      'count': 3,
      'buttonColor': Colors.grey, // or any custom color
    },
    {
      'name': 'Clothes',
      'count': 2,
      'buttonColor': Colors.grey,
    },
    {
      'name': 'Others',
      'count': 1,
      'buttonColor': Colors.grey,
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
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'Invoice Categorization',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // menu action
            },
            icon: const Icon(Icons.menu, color: Colors.black),
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade100,

      // -- BODY: Search bar + category cards
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            // Search bar
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                ),
              ),
            ),
            // Category cards
            Column(
              children: _categories.map((cat) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
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
                  child: Row(
                    children: [
                      // Left side: Title + count
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Category name
                              Expanded(
                                child: Text(
                                  cat['name'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              // Count label
                              Text(
                                '${cat['count']}',
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Right side: "Select >" button
                      Container(
                        width: 100,
                        height: 48,
                        decoration: BoxDecoration(
                          color: cat['buttonColor'],
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(12),
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(0),
                            bottomLeft: Radius.circular(0),
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {
                            // Navigate or handle selection
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Select  >',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),

      // -- BOTTOM NAV BAR --
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() => _currentIndex = value);
          // Handle nav if needed
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
