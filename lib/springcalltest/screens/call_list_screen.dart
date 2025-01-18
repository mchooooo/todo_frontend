import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/call.dart';

class CallDetailScreen extends StatefulWidget {
  final int callId;

  const CallDetailScreen({Key? key, required this.callId}) : super(key: key);

  @override
  _CallDetailScreenState createState() => _CallDetailScreenState();
}

class _CallDetailScreenState extends State<CallDetailScreen> {
  final ApiService apiService = ApiService();
  Call? call;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCallDetail();
  }

  void fetchCallDetail() async {
    try {
      call = await apiService.fetchCall(widget.callId);
    } catch (e) {
      print('Error fetching call: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Call Detail')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : call == null
              ? const Center(child: Text('Call not found'))
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Title:',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Text(call!.title, style: Theme.of(context).textTheme.bodyLarge),
                      const SizedBox(height: 16),
                      Text('Description:',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Text(call!.description,
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                ),
    );
  }
}
