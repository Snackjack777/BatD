import 'package:batdelivery/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isUser = true;

  // Controllers to get text from fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController addressOrLicenseController =
      TextEditingController();

  // Helper function to check if email is valid
  bool isValidEmail(String email) {
    final RegExp emailRegex =
        RegExp(r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
    return emailRegex.hasMatch(email);
  }

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                        // Switch for User and Rider
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'ผู้ใช้',
                              style: TextStyle(color: Colors.purple),
                            ),
                            customSwitch(
                              value: isUser,
                              onChanged: (value) {
                                setState(() {
                                  isUser = value;
                                  addressOrLicenseController
                                      .clear(); // ล้างข้อมูลเมื่อสลับ
                                });
                              },
                            ),
                            const Text(
                              'ไรเดอร์',
                              style: TextStyle(color: Colors.purple),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        // Form Fields
                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: 'ชื่อ',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: phoneController,
                          keyboardType:
                              TextInputType.phone, // Set type for phone input
                          decoration: InputDecoration(
                            labelText: 'โทรศัพท์',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(
                                10), // Limit to 10 characters
                          ],
                        ),

                        const SizedBox(height: 16),
                        TextField(
                          controller: emailController,
                          keyboardType: TextInputType
                              .emailAddress, // Set type for email input
                          decoration: InputDecoration(
                            labelText: 'อีเมล์',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: passwordController,
                          obscureText: true, // Hide text for password
                          decoration: InputDecoration(
                            labelText: 'รหัสผ่าน',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: confirmPasswordController,
                          obscureText: true, // Hide text for confirm password
                          decoration: InputDecoration(
                            labelText: 'ยืนยันรหัสผ่าน',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        isUser
                            ? TextField(
                                controller: addressOrLicenseController,
                                decoration: InputDecoration(
                                  labelText: 'ที่อยู่',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              )
                            : TextField(
                                controller: addressOrLicenseController,
                                decoration: InputDecoration(
                                  labelText: 'ป้ายทะเบียนรถ',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                        const SizedBox(height: 20),
                        // Buttons in Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPages()),
                                );
                                setState(() {
                                  // ล้างข้อมูลทุกช่อง
                                  nameController.clear(); // ล้างชื่อ
                                  phoneController.clear(); // ล้างโทรศัพท์
                                  emailController.clear(); // ล้างอีเมล์
                                  passwordController.clear(); // ล้างรหัสผ่าน
                                  confirmPasswordController
                                      .clear(); // ล้างยืนยันรหัสผ่าน
                                  addressOrLicenseController
                                      .clear(); // ล้างที่อยู่หรือป้ายทะเบียนรถ
                                });
                              },
                              child: const Text(
                                'กลับหน้า Login',
                                style: TextStyle(color: Colors.purple),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                register(); // Call register function
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                backgroundColor: Colors.purple,
                                foregroundColor: Colors.white,
                              ),
                              child: const Text('Register'),
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Register function
  void register() {
    String name = nameController.text;
    String phone = phoneController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;
    String addressOrLicense = addressOrLicenseController.text;

    if (name.isEmpty ||
        phone.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty ||
        addressOrLicense.isEmpty) {
      showMessage('กรุณากรอกข้อมูลให้ครบทุกช่อง');
      return;
    }

    if (!isValidEmail(email)) {
      showMessage('รูปแบบอีเมล์ไม่ถูกต้อง');
      return;
    }

    if (password != confirmPassword) {
      showMessage('รหัสผ่านและยืนยันรหัสผ่านไม่ตรงกัน');
      return;
    }

    if (isUser) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Notification'),
            content: Text('ลงทะเบียนเป็นผู้ใช้สำเร็จ'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Notification'),
            content: Text('ลงทะเบียนเป็นไรเดอร์สำเร็จ'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }

    setState(() {
      nameController.clear();
      phoneController.clear();
      emailController.clear();
      passwordController.clear();
      confirmPasswordController.clear();
      addressOrLicenseController.clear();
    });
  }

  void showMessage(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Notification'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Widget customSwitch(
      {required bool value, required ValueChanged<bool> onChanged}) {
    return GestureDetector(
      onTap: () {
        onChanged(!value); // เปลี่ยนสถานะเมื่อกด
      },
      child: Container(
        width: 80, // ความกว้างของสวิตช์
        height: 30, // ความสูงของสวิตช์
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: value ? Colors.purple : Colors.grey, // สีเปลี่ยนตามสถานะ
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeIn,
              left: value ? 40.0 : 0.0, // เคลื่อนที่ตามสถานะ
              right: value ? 0.0 : 40.0,
              child: Container(
                height: 25,
                width: 25,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
