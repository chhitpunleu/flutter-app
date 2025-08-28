import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final Color primaryBrown = const Color(0xFF6D4C41); // Deep brown
  final Color lightBrown = const Color(0xFFD7CCC8);   // Beige background

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBrown,
      appBar: AppBar(
        backgroundColor: primaryBrown,
        elevation: 0,
        title: Text(
          "Notifications",
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Example notification card
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: primaryBrown.withOpacity(0.8),
                child: const Icon(Icons.notifications, color: Colors.white),
              ),
              title: Text(
                "Welcome to the App!",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                "Thanks for signing up. We’re glad to have you here.",
                style: GoogleFonts.poppins(),
              ),
              trailing: Text(
                "2m ago",
                style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Another example
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: primaryBrown.withOpacity(0.8),
                child: const Icon(Icons.local_offer, color: Colors.white),
              ),
              title: Text(
                "Special Offer!",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                "Get 20% off on your next order.",
                style: GoogleFonts.poppins(),
              ),
              trailing: Text(
                "1h ago",
                style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
