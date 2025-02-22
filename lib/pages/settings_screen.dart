import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final Color mainTeal = const Color(0xFF136760);
  final Color accentTeal = const Color(0xFF56948F);

  int _currentIndex = 2; // e.g., "Settings" tab is index 2

  // Toggle states
  bool warrantyNotification = true;
  bool generalNotification = true;

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
            // handle menu / drawer
          },
        ),
        centerTitle: true,
        title: const Text(
          'Setting',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.grey.shade800),
            onPressed: () {
              // handle notification
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
            // Card 1: "Adjust Notification Setting"
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  const Text(
                    'Adjust Notification Setting',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Divider(height: 1, color: Colors.grey),

                  const SizedBox(height: 16),
                  // Row with bell icon or we can skip - your mockup has a big bell on the left
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.notifications_active_outlined,
                          size: 40, color: mainTeal),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          children: [
                            // Warranty’s Notification toggle
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Warranty’s Notification'),
                                Switch(
                                  value: warrantyNotification,
                                  onChanged: (val) {
                                    setState(() {
                                      warrantyNotification = val;
                                    });
                                  },
                                  activeColor: accentTeal,
                                ),
                              ],
                            ),
                            const Divider(),

                            // General Notification toggle
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('General  Notification'),
                                Switch(
                                  value: generalNotification,
                                  onChanged: (val) {
                                    setState(() {
                                      generalNotification = val;
                                    });
                                  },
                                  activeColor: accentTeal,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Card 2: "Change Information"
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  const Text(
                    'Change Information',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Divider(height: 1, color: Colors.grey),

                  const SizedBox(height: 16),
                  // 1) Change Phone Number
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.phone_iphone, color: mainTeal),
                          const SizedBox(width: 8),
                          const Text('Change Phone Number'),
                        ],
                      ),
                      const Text(
                        '05********',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // 2) Change Email
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.email_outlined, color: mainTeal),
                          const SizedBox(width: 8),
                          const Text('Change Email'),
                        ],
                      ),
                      const Text('Email@email.com',
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // 3) Change Password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.lock_outline, color: mainTeal),
                          const SizedBox(width: 8),
                          const Text('Change Password'),
                        ],
                      ),
                      const Text('********',
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // -- BOTTOM NAVIGATION BAR --
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          // Handle navigation logic here
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              color: _currentIndex == 0 ? mainTeal : Colors.grey,
            ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _currentIndex == 1 ? mainTeal : Colors.grey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_outlined,
              color: _currentIndex == 2 ? mainTeal : Colors.grey,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
