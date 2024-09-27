import 'package:batdelivery/pages/register.dart';
import 'package:flutter/material.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({super.key});

  @override
  _LoginPagesState createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  final _formKey = GlobalKey<FormState>(); // Key for form validation
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isUser = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 174, 63, 194),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 174, 63, 194),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey, // Wrap with Form for validation
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 5. Logo รูปบนสุด
                Image.asset(
                  'assets/images/logo2.png',
                  height: 250,
                  width: 250,
                  fit: BoxFit.contain,
                ),

                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        // Email field with validation
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'อีเมล์',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          keyboardType:
                              TextInputType.emailAddress, // Ensure email input
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter an email';
                            }
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        // Password field with validation
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: 'รหัสผ่าน',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters long';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'User',
                              style: TextStyle(color: Colors.purple),
                            ),
                            Switch(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.padded,
                              value: isUser,
                              onChanged: (value) {
                                setState(() {
                                  isUser = value;
                                });
                              },
                            ),
                            const Text(
                              'Rider',
                              style: TextStyle(color: Colors.purple),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  login();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                backgroundColor: Colors.purple,
                                foregroundColor: Colors.white,
                              ),
                              child: const Text('เข้าสู่ระบบ'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                register();
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                backgroundColor:
                                    const Color.fromARGB(255, 0, 0, 0),
                                foregroundColor:
                                    const Color.fromARGB(255, 255, 255, 255),
                              ),
                              child: const Text(
                                'สมัครสมาชิก',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Login function
  void login() {
    final email = _emailController.text;
    final password = _passwordController.text;
    // Placeholder login logic
    if (email == 'user@example.com' && password == 'password123') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login successful!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid email or password')),
      );
    }
  }

  // Register function
  void register() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const RegisterPage()),
    );
  }
}
