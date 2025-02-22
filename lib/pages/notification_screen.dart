import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final Color mainTeal = const Color(0xFF136760);
  final Color accentTeal = const Color(0xFF56948F);

  int _currentIndex = 1; // e.g., Home is index 1
  String _sortBy = 'Newest'; // For the "Short by" label

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // -- APP BAR --
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            // Handle menu / drawer
          },
        ),
        centerTitle: true,
        title: const Text(
          'Notification',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.grey.shade800),
            onPressed: () {
              // Notification bell action
            },
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade100,

      // -- BODY --
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            // Card: "Warranty about to expire"
            Container(
              margin: const EdgeInsets.only(bottom: 16),
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left side: Title + date
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Warranty about to expire',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          '30 Feb , 2025',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),

                        // A small green label "TV"
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.green.shade400,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'TV',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Right side: "See details >"
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        // Navigate to details
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            'See details',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(Icons.arrow_right, color: Colors.grey),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // -- SORT BY (dropdown) --
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // If you want an actual dropdown:
                // You could use a PopupMenuButton or a DropdownButton here
                PopupMenuButton<String>(
                  offset: const Offset(0, 40),
                  onSelected: (value) {
                    setState(() {
                      _sortBy = value;
                    });
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'Newest',
                      child: Text('Newest'),
                    ),
                    const PopupMenuItem(
                      value: 'Oldest',
                      child: Text('Oldest'),
                    ),
                  ],
                  child: Row(
                    children: [
                      Text('Short by $_sortBy',
                          style: const TextStyle(fontSize: 16)),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // -- NOTIFICATION ACTIONS (like cards or big buttons) --
            // 1) New invoice
            _buildNotificationCard(
              icon: Icons.description_outlined,
              title: 'New invoice',
            ),
            const SizedBox(height: 16),

            // 2) see your monthly summary
            _buildNotificationCard(
              icon: Icons.bar_chart_outlined,
              title: 'see your monthly summary',
            ),
            const SizedBox(height: 16),

            // 3) Warranty Expiration
            _buildNotificationCard(
              icon: Icons.security_outlined,
              title: 'Warranty Expiration',
            ),
          ],
        ),
      ),

      // -- BOTTOM NAVIGATION BAR --
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() => _currentIndex = value);
          // handle nav if needed
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

  // Helper widget for building the bottom "action" cards
  Widget _buildNotificationCard(
      {required IconData icon, required String title}) {
    return Container(
      width: double.infinity,
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
      child: Row(
        children: [
          // Icon on the left
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.teal.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: mainTeal),
          ),
          const SizedBox(width: 16),

          // Title text
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
