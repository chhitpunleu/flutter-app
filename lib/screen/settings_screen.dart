import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final Color primaryBrown = const Color(0xFF6D4C41); // Deep brown
  final Color lightBrown = const Color(0xFFF5F5F5);   // Soft background

  bool notificationsEnabled = true;
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBrown,
      appBar: AppBar(
        backgroundColor: primaryBrown,
        elevation: 0,
        title: Text(
          "Settings",
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 8),

          // Profile section
          ListTile(
            leading: CircleAvatar(
              backgroundColor: primaryBrown,
              child: const Icon(Icons.person, color: Colors.white),
            ),
            title: Text(
              "My Account",
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              "Manage your profile & security",
              style: GoogleFonts.poppins(fontSize: 13),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          const Divider(),

          // Notifications toggle
          SwitchListTile(
            activeColor: primaryBrown,
            title: Text(
              "Enable Notifications",
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              "Turn app notifications on or off",
              style: GoogleFonts.poppins(fontSize: 13),
            ),
            value: notificationsEnabled,
            onChanged: (value) {
              setState(() {
                notificationsEnabled = value;
              });
            },
          ),
          const Divider(),

          // Dark Mode toggle
          SwitchListTile(
            activeColor: primaryBrown,
            title: Text(
              "Dark Mode",
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              "Reduce eye strain at night",
              style: GoogleFonts.poppins(fontSize: 13),
            ),
            value: darkMode,
            onChanged: (value) {
              setState(() {
                darkMode = value;
              });
            },
          ),
          const Divider(),

          // About
          ListTile(
            leading: Icon(Icons.info_outline, color: primaryBrown),
            title: Text(
              "About",
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              "Learn more about this app",
              style: GoogleFonts.poppins(fontSize: 13),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
