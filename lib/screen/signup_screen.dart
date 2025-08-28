import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import '../helper/pos_textform_field.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isPassword = true;
  bool isConfirmPassword = true;

  final Color primaryBrown = const Color(0xFF6D4C41); // deep brown
  final Color lightBrown = const Color(0xFFD7CCC8);   // soft brown background

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBrown,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [lightBrown, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // Logo / Icon
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: primaryBrown.withOpacity(0.1),
                    child: Icon(Icons.person_add, size: 50, color: primaryBrown),
                  ),

                  const SizedBox(height: 30),

                  // Title
                  Text(
                    "Create Account",
                    style: GoogleFonts.poppins(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: primaryBrown,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Join us and explore endless opportunities",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.brown.shade700,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 40),

                  // Form Card
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.brown.withOpacity(0.2),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Email Field
                        PosTextformField(
                          controller: emailController,
                          label: "Email",
                          placeholder: "Enter your email",
                          prefixIcon: const Icon(Icons.email),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email is required!";
                            }
                            final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                            if (!regex.hasMatch(value)) {
                              return "Enter a valid email!";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        // Phone Number Field
                        PosTextformField(
                          controller: phoneController,
                          label: "Phone Number",
                          placeholder: "Enter your phone number",
                          prefixIcon: const Icon(Icons.phone),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Phone number is required!";
                            }
                            if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                              return "Phone number must be numeric!";
                            }
                            if (value.length < 8) {
                              return "Phone number must be at least 8 digits!";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        // Password Field
                        PosTextformField(
                          controller: passwordController,
                          label: "Password",
                          placeholder: "Enter your password",
                          obscureText: isPassword,
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isPassword ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                              color: primaryBrown,
                            ),
                            onPressed: () {
                              setState(() {
                                isPassword = !isPassword;
                              });
                            },
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password is required!";
                            }
                            if (value.length < 6) {
                              return "Password must be at least 6 characters!";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        // Confirm Password Field
                        PosTextformField(
                          controller: confirmPasswordController,
                          label: "Confirm Password",
                          placeholder: "Re-enter your password",
                          obscureText: isConfirmPassword,
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isConfirmPassword ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                              color: primaryBrown,
                            ),
                            onPressed: () {
                              setState(() {
                                isConfirmPassword = !isConfirmPassword;
                              });
                            },
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please confirm your password!";
                            }
                            if (value != passwordController.text) {
                              return "Passwords do not match!";
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 20),

                        // Sign Up Button
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Registration successful!"),
                                  backgroundColor: Colors.green,
                                  duration: Duration(seconds: 2),
                                ),
                              );

                              Future.delayed(const Duration(seconds: 2), () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                );
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryBrown,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 5,
                          ),
                          child: Text(
                            "Sign Up",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Already have account? → Login
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: GoogleFonts.poppins(
                          color: Colors.brown.shade700,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Login",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            color: primaryBrown,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
