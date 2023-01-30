import 'package:flutter/material.dart';

class drawer extends StatefulWidget {
  const drawer({Key? key}) : super(key: key);

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: const Color(0xff54759e),
              padding: const EdgeInsets.only(left: 20, top: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50,
                  ),
                  Text(
                    "Kishan Gaudani",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "92657 71251",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Padding(
              padding: EdgeInsets.only(left: 20, top: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.people_alt_outlined),
                      SizedBox(width: 30),
                      Text("New Group"),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: const [
                      Icon(Icons.person),
                      SizedBox(width: 30),
                      Text("New Contact"),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: const [
                      Icon(Icons.call),
                      SizedBox(width: 30),
                      Text("Calls"),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: const [
                      Icon(Icons.bookmark),
                      SizedBox(width: 30),
                      Text("Saved Messages"),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: const [
                      Icon(Icons.settings),
                      SizedBox(width: 30),
                      Text("Settings"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
