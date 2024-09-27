import 'package:flutter/material.dart';

class Profileuser extends StatelessWidget {
  const Profileuser({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 143, 56, 158),
        appBar: AppBar(
          title: Text('โปรไฟล์ผู้ใช้'),
          backgroundColor: Colors.purple,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // รูปโปรไฟล์
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300],
                child: IconButton(
                  icon: Icon(Icons.camera_alt, size: 40),
                  onPressed: () {
                    // เพิ่มการเปลี่ยนรูปโปรไฟล์
                  },
                ),
              ),
              SizedBox(height: 20),

              // คอนเทนเนอร์สีขาวครอบฟอร์มโปรไฟล์
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: ProfileForm(),
              ),
              Spacer(),

              // Bottom Bar
              BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.location_on),
                    label: '',
                  ),
                ],
                onTap: (index) {
                  // เพิ่มการทำงานของแต่ละไอคอน
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ชื่อ และ หมายเลขโทรศัพท์
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'ชื่อ',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'หมายเลขโทรศัพท์',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),

        // อีเมล
        TextField(
          decoration: InputDecoration(
            labelText: 'อีเมล',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        SizedBox(height: 10),

        // ที่อยู่
        TextField(
          decoration: InputDecoration(
            labelText: 'ที่อยู่',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        SizedBox(height: 10),

        // แก้ไขรหัสผ่าน
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              // ฟังก์ชันแก้ไขรหัสผ่าน
            },
            child: Text(
              'แก้ไขรหัสผ่าน',
              style: TextStyle(color: Colors.purple),
            ),
          ),
        ),
      ],
    );
  }
}
