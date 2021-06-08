import 'package:flutter/material.dart';

class DetailMealScreen extends StatelessWidget {
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
            'https://images.unsplash.com/photo-1496412705862-e0088f16f791?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80',
            fit: BoxFit.cover,
            width: 600,
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 5),
            child: titleSection,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: authorSection,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: tagSection,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: timeSection,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: ingredientSection,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
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
          backgroundImage: NetworkImage(
              'https://i.pinimg.com/originals/0f/56/51/0f56511d7e416da63782dd0cc73816f1.png'),
          radius: 22,
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          children: [
            Text("Công thức viết bởi"),
            SizedBox(height: 5.0),
            Text("Lalisa Monoban",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    ),
  );

  Widget titleSection = Container(
    alignment: Alignment.centerLeft,
    child: Text(
      "Cháo yến mạch trái cây",
      softWrap: true,
      textAlign: TextAlign.justify,
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ),
  );

  Widget tagSection =
      Wrap(alignment: WrapAlignment.start, spacing: 5.0, children: [
    Chip(
      label: const Text('Sáng'),
    ),
    Chip(
      label: const Text('Ít carb'),
    ),
    Chip(
      label: const Text('Trái cây'),
    ),
    Chip(
      label: const Text('Trái cây'),
    ),
  ]);

  Widget timeSection = Container(
    child: Row(
      children: [
        Icon(
          Icons.access_time,
          color: Colors.grey,
          size: 30,
        ),
        SizedBox(width: 10),
        Text(
          '15 phút',
          softWrap: true,
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        SizedBox(width: 10),
        Icon(
          Icons.breakfast_dining_outlined,
          color: Colors.grey,
          size: 30,
        ),
        SizedBox(width: 10),
        Text(
          '15 phút',
          softWrap: true,
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ],
    ),
  );

  Widget ingredientSection = Container(
    child: Column(
      children: [
        ListTile(
          title: Text(
            'Nguyên liệu cho 1 phần',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(width: 10),
        ListTile(
          title: Text(
            'Chuối',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          trailing: Text('50g'),
        ),
        Divider(),
        ListTile(
          title: Text(
            'Bơ',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          trailing: Text('100g'),
        ),
        Divider(),
      ],
    ),
  );

  Widget textSection = Container(
    alignment: Alignment.centerLeft,
    child: Text(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      softWrap: true,
      textAlign: TextAlign.justify,
      style: TextStyle(fontSize: 15),
    ),
  );
}
