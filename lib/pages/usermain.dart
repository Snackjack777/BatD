import 'package:flutter/material.dart';

class UserMainPage extends StatelessWidget {
  const UserMainPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple[100],
        appBar: AppBar(
          title: Text('User Main'),
          backgroundColor: Colors.purple,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // คอนเทนเนอร์สีม่วงที่คลุมฟอร์ม
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
                child: Column(
                  children: [
                    // แถวส่งจากไปยัง
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'ส่งจาก',
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
                              labelText: 'ไปยัง',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),

                    // แถวเบอร์ผู้ส่งกับผู้รับ
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'เบอร์ผู้ส่ง',
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
                              labelText: 'เบอร์ผู้รับ',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),

                    // ชื่อการส่ง
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'ชื่อการส่ง',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    // รายละเอียดของ
                    TextField(
                      maxLines: 3,
                      decoration: InputDecoration(
                        labelText: 'รายละเอียดของ',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    // ช่องใส่รูป
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                Icon(Icons.camera_alt,
                                    size: 40, color: Colors.grey),
                                SizedBox(height: 10),
                                Text('อัปโหลดรูปภาพ',
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    // ปุ่มบันทึก
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple, // สีปุ่ม
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      ),
                      onPressed: () {
                        _showConfirmationDialog(context);
                      },
                      child: Text('บันทึก', style: TextStyle(fontSize: 18)),
                    ),
                  ],
                ),
              ),
              Spacer(),

              // Bottom Navigation Bar
              BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.bathtub),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.location_on),
                    label: '',
                  ),
                ],
                onTap: (index) {
                  // การทำงานของแต่ละไอคอน
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ฟังก์ชัน AlertDialog สำหรับยืนยันการส่งข้อมูล
  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('ยืนยันการส่ง'),
          content: Text('คุณต้องการส่งข้อมูลนี้หรือไม่?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('ยกเลิก'),
            ),
            ElevatedButton(
              onPressed: () {
                // ฟังก์ชันการส่งข้อมูล
                Navigator.of(context).pop();
              },
              child: Text('ยืนยัน'),
            ),
          ],
        );
      },
    );
  }
}
