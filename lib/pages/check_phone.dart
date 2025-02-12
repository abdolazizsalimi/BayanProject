import 'package:flutter/material.dart';

class CheckPhoneScreen extends StatefulWidget {
  const CheckPhoneScreen({Key? key}) : super(key: key);

  @override
  State<CheckPhoneScreen> createState() => _CheckPhoneScreenState();
}

class _CheckPhoneScreenState extends State<CheckPhoneScreen> {
  final Color mainTeal = const Color(0xFF136760);

  // We’ll use a List of TextEditingControllers for the 4 OTP fields
  final List<TextEditingController> _otpControllers =
      List.generate(4, (_) => TextEditingController());

  // You could add logic to handle a real countdown timer. For now, we’ll just hardcode the text.
  String timeRemaining = "01:00";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Make the screen scrollable to avoid overflow on smaller devices
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
          child: Column(
            children: [
              // Title
              Text(
                "Check your Phone",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),

              // Subtitle
              const Text(
                "We've sent the code to your phone.",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 24),

              // OTP Fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  4,
                  (index) => _buildOtpBox(_otpControllers[index]),
                ),
              ),
              const SizedBox(height: 24),

              // "Code expire in: 01:00"
              Text(
                "Code expire in: $timeRemaining",
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 32),

              // "Verify" Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainTeal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: () {
                    // Collect the OTP from _otpControllers
                    final otpCode = _otpControllers
                        .map((controller) => controller.text)
                        .join();

                    // TODO: Handle verify logic here
                  },
                  child: const Text(
                    'Verify',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // "Send again" Button (Outlined)
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: mainTeal, width: 1.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: () {
                    // TODO: logic to resend the OTP code
                  },
                  child: Text(
                    'Send again',
                    style: TextStyle(color: mainTeal, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget to build a single OTP box
  Widget _buildOtpBox(TextEditingController controller) {
    return SizedBox(
      width: 50,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: "", // hide the "1/1" below the text field
          filled: true,
          fillColor: Colors.grey.shade200,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: (value) {
          // Optionally: move focus to next field if not empty
          if (value.isNotEmpty) {
            // find the current index
            final currentIndex = _otpControllers.indexOf(controller);
            if (currentIndex < 3) {
              FocusScope.of(context).nextFocus();
            } else {
              FocusScope.of(context).unfocus();
            }
          }
        },
      ),
    );
  }
}
