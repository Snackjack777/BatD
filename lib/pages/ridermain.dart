import 'package:flutter/material.dart';

void main() => runApp(RiderMain());

class RiderMain extends StatelessWidget {
  const RiderMain({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple[100],
        appBar: AppBar(
          title: Text('รับงาน'),
          backgroundColor: Colors.purple,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // คอนเทนเนอร์แสดงชื่อผู้จ้างพร้อมปุ่มรายละเอียด
              Expanded(
                child: ListView(
                  children: [
                    buildJobCard(context, 'นาย A'),
                    SizedBox(height: 10),
                    buildJobCard(context, 'นาย B'),
                  ],
                ),
              ),
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
                  // การทำงานเมื่อกดไอคอน
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // การ์ดแสดงงาน
  Widget buildJobCard(BuildContext context, String name) {
    return Container(
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: TextStyle(fontSize: 18)),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple, // สีของปุ่ม
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
              // เมื่อกดปุ่มจะแสดง AlertDialog
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('รายละเอียดงานของ $name'),
                    content: buildAlertDialogContent(),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('คุณปฏิเสธงาน')),
                          );
                        },
                        child: Text('ปฏิเสธ'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        onPressed: () {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('คุณยอมรับงานแล้ว')),
                          );
                        },
                        child: Text('ยอมรับ'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text('รายละเอียด'),
          ),
        ],
      ),
    );
  }

  // เนื้อหาภายใน AlertDialog
  Widget buildAlertDialogContent() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ช่องส่งจาก และไปยัง
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
          // ช่องกรอกเบอร์ผู้ส่งและผู้รับ
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
          // ช่องชื่อการส่ง
          TextField(
            decoration: InputDecoration(
              labelText: 'ชื่อการส่ง',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(height: 10),
          // ช่องกรอกรายละเอียดการส่ง
          TextField(
            decoration: InputDecoration(
              labelText: 'รายละเอียดการส่ง',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            maxLines: 3,
          ),
          SizedBox(height: 10),
          // ช่องใส่รูป
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Icon(Icons.camera_alt, size: 50),
                SizedBox(height: 8),
                Text('อัพโหลดรูปภาพ'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
