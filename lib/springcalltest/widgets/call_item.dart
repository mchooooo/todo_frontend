import 'package:flutter/material.dart';
import 'package:todo_frontend/springcalltest/screens/call_list_screen.dart';
import '../models/call.dart';

class CallItem extends StatelessWidget {
  final Call call;

  const CallItem({Key? key, required this.call}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(call.title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(call.description),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CallDetailScreen(callId: call.id),
            ),
          );
        },
      ),
    );
  }
}
