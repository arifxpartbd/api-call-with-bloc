import 'package:apicallwithbloc/screens/post_screen.dart';
import 'package:apicallwithbloc/screens/task_screen.dart';
import 'package:apicallwithbloc/screens/user_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const UserListScreen()));
              },
              child: const Text('User List'),
            ),
            const SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const PostListScreen()));
              },
              child: const Text('Post List'),
            ),
            const SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const TaskScreen()));
              },
              child: const Text('Task List'),
            ),
          ],
        ),
      ),
    );
  }
}
