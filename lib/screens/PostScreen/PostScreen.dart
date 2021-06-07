import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        centerTitle: false,
        titleSpacing: 0,
        title: Text(
          "Quay lại",
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Image.network(
            'https://images.unsplash.com/photo-1608138404239-d2f557515ecb?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
            fit: BoxFit.cover,
            width: 600,
            height: 200,
          ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,20,20,10),
              child: titleSection,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,10,20,10),
              child: authorSection,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,10,20,0),
              child: timeSection,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,10,20,0),
              child: headLineSection,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,10,20,0),
              child: textSection,
            ),
        ],
      ),
    );
  }

  Widget authorSection = Container(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage('https://i.pinimg.com/originals/0f/56/51/0f56511d7e416da63782dd0cc73816f1.png'),
          radius: 20,
        ),
        SizedBox(
          width: 10,
        ),
        Column( 
          children: [
            Text("Công thức viết bởi"),
            Text(
              "Lalisa Monoban",
              style: TextStyle(fontWeight: FontWeight.bold)  
            ),
          ],
        ),
      ],
    ),
  );

  Widget titleSection = Container(
    alignment: Alignment.centerLeft,
    child: Text(
      "Chạy thế nào để hiệu quả ?",
      softWrap: true,
      textAlign: TextAlign.justify,
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ),
  );

  Widget timeSection = Container(
    alignment: Alignment.centerLeft,
    child: Row(
      children: [
        Icon(
          Icons.access_time,
          color: Colors.grey,
        ),
        SizedBox(width: 10),
        Text(
          '15 phút',
          softWrap: true,
        ),
      ],
    ),
  );

  Widget headLineSection = Container(
    alignment: Alignment.centerLeft,
    child: Text('Chạy bộ đúng cách và những lợi ích không tưởng',
        softWrap: true,
        textAlign: TextAlign.justify,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  );

  Widget textSection = Container(
    alignment: Alignment.centerLeft,
    child: Text(
      'Chạy bộ đúng cách và những lợi ích không tưởng Không nhiều hơn mà cũng không ít hơn, với 30 phút chạy bộ đúng cách mỗi ngày đã đủ giúp bạn cải thiện sức khỏe cho cơ thể, giảm các bệnh về huyết áp, tim mạch, giảm cân và kéo dài tuổi thọ. Các nghiên cứu khoa học chỉ ra rằng trong vòng nửa tiếng chạy bộ, cơ thể sẽ đốt cháy từ 300-500 calo (trung bình 10 calo/phút) tùy theo mức độ tập luyện.',
      softWrap: true,
      textAlign: TextAlign.justify,
      style: TextStyle(fontSize: 15),
    ),
  );
}
