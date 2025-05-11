import 'package:flutter/material.dart';

class SendFeedbackScreen extends StatefulWidget {
  const SendFeedbackScreen({super.key});

  @override
  State<SendFeedbackScreen> createState() => _SendFeedbackScreenState();
}

class _SendFeedbackScreenState extends State<SendFeedbackScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4A0D0D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4A0D0D),
        title: const Text('Send Feedback', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              maxLines: 6,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Write your feedback here...',
                hintStyle: const TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Colors.black12,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              onPressed: () {
                // Submit feedback logic
                Navigator.pop(context);
              },
              child: const Text('Submit', style: TextStyle(color: Color(0xFF4A0D0D))),
            )
          ],
        ),
      ),
    );
  }
}