import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final Color mainTeal = const Color(0xFF136760);
  bool agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30), // Shifts content down by 10px
        child: SingleChildScrollView(
          child: Column(
            children: [
              // -- TOP TEAL HEADER --
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
                decoration: BoxDecoration(
                  color: mainTeal,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // spaceBetween places text on the left, row of [logo, close] on the right
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // -- Multiline text on the left --
                    Expanded(
                      child: Text(
                        "Let's\nCreate\nYour\nAccount!",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                      ),
                    ),
                    // -- Logo & Close button on the right --
                    Row(
                      children: [
                        // Logo on the right
                        Image.asset(
                          'lib/assets/images/logo2.png', // Adjust path as needed
                          width: 90,
                          height: 90,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 8),
                        // Close button
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // -- WHITE CONTENT SECTION --
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Phone Number TextField
                    _buildOutlinedTextField(
                      hintText: 'Phone number',
                      icon: Icons.person_outlined,
                    ),
                    const SizedBox(height: 16),

                    // Email TextField
                    _buildOutlinedTextField(
                      hintText: 'Email Address',
                      icon: Icons.email_outlined,
                    ),
                    const SizedBox(height: 16),

                    // Password TextField
                    _buildOutlinedTextField(
                      hintText: 'Password',
                      icon: Icons.lock_outlined,
                      obscureText: true,
                    ),
                    const SizedBox(height: 16),

                    // Retype Password TextField
                    _buildOutlinedTextField(
                      hintText: 'Retype Password',
                      icon: Icons.lock_outlined,
                      obscureText: true,
                    ),
                    const SizedBox(height: 16),

                    // Terms & Privacy
                    Row(
                      children: [
                        Checkbox(
                          value: agreeToTerms,
                          onChanged: (bool? value) {
                            setState(() {
                              agreeToTerms = value ?? false;
                            });
                          },
                          activeColor: mainTeal,
                        ),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              text: 'I agree to the ',
                              style: const TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: 'Terms & Privacy',
                                  style: TextStyle(
                                    color: mainTeal,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Sign Up Button
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: mainTeal,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        onPressed: agreeToTerms
                            ? () {
                                // Handle sign-up logic
                              }
                            : null,
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Have an account? Sign In...
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Have an account? ",
                          style: TextStyle(color: Colors.grey),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            // Or navigate to the login screen if desired
                          },
                          child: Text(
                            "Sign In..",
                            style: TextStyle(
                              color: mainTeal,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Helper method for building an Outlined TextField with a consistent style
  Widget _buildOutlinedTextField({
    required String hintText,
    required IconData icon,
    bool obscureText = false,
  }) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.teal),
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.teal.shade400, width: 1.5),
          borderRadius: BorderRadius.circular(50),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.teal, width: 2),
          borderRadius: BorderRadius.circular(50),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      ),
    );
  }
}
