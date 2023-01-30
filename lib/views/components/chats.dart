import 'package:flutter/material.dart';
import 'global.dart';

class chats extends StatefulWidget {
  const chats({Key? key}) : super(key: key);

  @override
  State<chats> createState() => _chatsState();
}

class _chatsState extends State<chats> {
  static List<Map<String, dynamic>> details = [
    {
      'number': '9999999999',
      'name': 'Tony Stark',
      'desc': 'Sun of Odin',
      'time': '8:50',
      'image': "",
    },
    {
      'number': '9797979797',
      'name': 'Thor',
      'desc': 'Done!',
      'time': '8:60',
      'image': "",
    },
    {
      'number': '9696969696',
      'name': 'Thanos',
      'desc': 'Ready for fight',
      'time': 'Now',
      'image': "",
    },
    {
      'number': '9595959595',
      'name': 'Hulk',
      'desc': 'I am angry..',
      'time': 'Now',
      'image': "",
    },
    {
      'number': '949494949494',
      'name': 'Dr.Strange',
      'desc': 'it magic',
      'time': '9:88 PM',
      'image': "",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: details
              .map(
                (e) => GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                        height: 300,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage(e['images']),
                              radius: 60,
                            ),
                            Text("${e['name']}"),
                            Text("+91 ${e['number']}"),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("Send Message"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Cancel"),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(e['image']),
                          radius: 25,
                        ),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${e['name']}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "${e['desc']}",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        Spacer(),
                        Text(
                          "${e['time']}",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
