import 'package:flutter/material.dart';
import 'check_phone.dart'; // <-- Import the CheckPhoneScreen here, adjust path as needed

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  final Color mainTeal = const Color(0xFF136760);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // We'll keep the entire screen scrollable in case of small devices
      body: SingleChildScrollView(
        child: Column(
          children: [
            // -- TOP WHITE SECTION --
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                children: [
                  // Top Row with 3-dot menu on the left
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          // Handle a menu or drawer if you want
                        },
                        icon: const Icon(Icons.more_horiz, color: Colors.black),
                      ),
                      // If you want something on the right side, put it here
                      const SizedBox(width: 48), // just placeholder
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Lock Icon
                  Icon(
                    Icons.lock,
                    size: 60,
                    color: mainTeal,
                  ),
                  const SizedBox(height: 16),

                  // "Forgot Password?" text
                  Text(
                    'Forgot\nPassword?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      color: mainTeal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Subtext
                  const Text(
                    'No worries, we will send you reset instructions',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),

            // -- BOTTOM TEAL SECTION --
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              decoration: BoxDecoration(
                color: mainTeal,
                // Round the top corners
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  // Title (small label: "Enter")
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Enter',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Phone number TextField with an outline
                  Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 1.5),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        prefixIcon:
                            const Icon(Icons.phone, color: Colors.white),
                        hintText: 'Phone number',
                        hintStyle: const TextStyle(color: Colors.white70),
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                  ),

                  // Reset Password Button -> Navigates to CheckPhoneScreen
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      onPressed: () {
                        // Navigate to the "Check phone" screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CheckPhoneScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Reset Password',
                        style: TextStyle(
                          color: mainTeal,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Back to Login
                  InkWell(
                    onTap: () {
                      Navigator.pop(context); // or push to login screen
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.arrow_circle_left_outlined,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Back to Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
